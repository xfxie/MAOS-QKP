-P nItemTour < StateRefiner: nItemTour
-P pMix < R_XS:pMix

-D CostAssigner < implement.QKP.behavior.assign.RelativeRpwClueAssigner

-L StateRepairer < LS_REFINER@BinaryRepairerModules: nItemTour=2, CostAssigner=&CostAssigner

-L R_SS < RSS_Rand@KernelSSModules

-D R_INI < maosKernel.behavior.scratch.LinkedScratchSearch: scratchSearch=&R_SS, incumbentSearch=&StateRepairer

-L R_T < RT_BETTER@KernelRTModules

-D R_XS < implement.common.behavior.combine.UniformXRecombinator: pMix=0.5

-L R_G_O < RG_RSP_XS@KernelRGModules: R_XS=&R_XS

-D R_G < maosKernel.behavior.generate.LinkedMGenerator: baseGenerator=&R_G_O, incumbentSearch=&StateRepairer