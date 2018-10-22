From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Oct 2018 12:14:09 +0000
Subject: [Buildroot] [Bug 11421] New: GCC error message for ARM
 Cortex-A9/ARM.V7
Message-ID: <bug-11421-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11421

            Bug ID: 11421
           Summary: GCC error message for ARM Cortex-A9/ARM.V7
           Product: buildroot
           Version: 2018.05.2
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ecs.egon.derflinger at t-online.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Dear ARM-friends,?

please find below the GCC error message for the source code also given below.?

The compiler error is reported for interrupt label "FIQ"?only.?

Thanks for your help!

BR Egon:)





//--------------------------------------------------------------------------------------------------

13:44:13 **** Incremental Build of configuration Debug for project MsgDma ****
make all 
Building file: /opt/ScCU_Firmware/ScCU-FW/hal/halFpga/irq/src/IrqCA9ArmV7.c
Invoking: Cross GCC Compiler
arm-buildroot-linux-gnueabi-gcc
-I/opt/ScCU_Firmware/ScCU-FW/hal/halFpga/irq/inc/ -O0 -g3 -Wall -c
-fmessage-length=0 -MMD -MP -MF"src/IrqCA9ArmV7.d" -MT"src/IrqCA9ArmV7.o" -o
"src/IrqCA9ArmV7.o"
"/opt/ScCU_Firmware/ScCU-FW/hal/halFpga/irq/src/IrqCA9ArmV7.c"
/opt/ScCU_Firmware/ScCU-FW/hal/halFpga/irq/src/IrqCA9ArmV7.c: In Funktion
?__isr_C_A9_A_V7_fiq?:
/opt/ScCU_Firmware/ScCU-FW/hal/halFpga/irq/src/IrqCA9ArmV7.c:61:1: Fehler:
Befehl erf?llt nicht seine Bedingungen:
}
^
(insn/f 13 12 14 (set (reg/f:SI 13 sp)
(plus:SI (reg/f:SI 11 fp)
(const_int 4 [0x4])))
/opt/ScCU_Firmware/ScCU-FW/hal/halFpga/irq/src/IrqCA9ArmV7.c:61 4 {*arm_addsi3}
(expr_list:REG_CFA_ADJUST_CFA (set (reg/f:SI 13 sp)
(plus:SI (reg/f:SI 11 fp)
(const_int 4 [0x4])))
(nil)))
/opt/ScCU_Firmware/ScCU-FW/hal/halFpga/irq/src/IrqCA9ArmV7.c:61:1: interner
Compiler-Fehler: in extract_constrain_insn, bei recog.c:2246
Bitte senden Sie einen vollst?ndigen Fehlerbericht auf Englisch ein;
inclusive vorverarbeitetem Quellcode, wenn es dienlich ist.
Siehe <http://bugs.buildroot.net/> f?r n?here Anweisungen.
make: *** [src/IrqCA9ArmV7.o] Fehler 1
src/subdir.mk:44: die Regel f?r Ziel ?src/IrqCA9ArmV7.o? scheiterte

13:44:14 Build Finished (took 790ms)

//--------------------------------------------------------------------------------------------------

Source file?IrqCA9ArmV7.c





/*! \brief text text.
*
* text text text text.
*
* Name : IrqCA9ArmV7.cpp
* Author : ECSed
* Version : 1.0
* Copyright : Your copyright notice
*/

//std includes (goes first)
//---
//interface & project includes
#include "IrqCA9ArmV7.h"
//module includes (goes last)
//---

//public:

//6.31.4 ARM Function Attributes
//acc. https://gcc.gnu.org/onlinedocs/gcc/ARM-Function-Attributes.html
/*
*
*/
void __attribute__ ((interrupt ("IRQ"))) __isr_C_A9_A_V7_irq(void) {
//your IRQ service code goes here
}

/*
*
*/
void __attribute__ ((interrupt ("UNDEF"))) __isr_C_A9_A_V7_undev(void) {
//your UNDEF service code goes here
}

/*
*
*/
void __attribute__ ((interrupt ("SWI"))) __isr_C_A9_A_V7_swi(void) {
//your SWI service code goes here
}

/*
*
*/
void __attribute__ ((interrupt ("ABORT"))) __isr_C_A9_A_V7_abort(void) {
//your ABORT service code goes here
}


//void __attribute__ ((interrupt)) __isr_C_A9_A_V7_pabort (void)
//void __attribute__ ((interrupt)) __isr_C_A9_A_V7_dabort (void)

/*
*
*/
void __attribute__ ((interrupt ("FIQ"))) __isr_C_A9_A_V7_fiq(void) {
//your FIQ service code goes here
}

//protected:
//private

//--------------------------------------------------------------------------------------------------

Header file?IrqCA9ArmV7.h



/*! \brief text text.
*
* text text text text.
*
* Name : IrqCA9ArmV7.h
* Author : ECSed
* Version : 1.0
* Copyright : Your copyright notice
*/

#ifndef _Irq_C_A9_Arm_V7_H_
# define _Irq_C_A9_Arm_V7_H_

//std includes (goes first)
//---
//interface & project includes
//---
//module includes (goes last)
//---


//public:
//see DE1-SoC Computer System with ARM Cortex-A9, p. 32
void __attribute__ ((interrupt ("IRQ"))) __isr_C_A9_A_V7_irq(void);
void __attribute__ ((interrupt ("UNDEF"))) __isr_C_A9_A_V7_undev(void);
void __attribute__ ((interrupt ("SWI"))) __isr_C_A9_A_V7_swi(void);
void __attribute__ ((interrupt ("ABORT"))) __isr_C_A9_A_V7_abort(void);
//void __attribute__ ((interrupt)) __isr_C_A9_A_V7_pabort (void);
//void __attribute__ ((interrupt)) __isr_C_A9_A_V7_dabort (void);
void __attribute__ ((interrupt ("FIQ"))) __isr_C_A9_A_V7_fiq(void);

//protected:
//private

#endif //_Irq_C_A9_Arm_V7_H_

-- 
You are receiving this mail because:
You are on the CC list for the bug.
