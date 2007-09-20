From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Fri, 21 Sep 2007 05:08:36 +0530
Subject: [Buildroot] sysroot not anabled even when BR2_GCC_VERSION_4_2_1
	isselected
Message-ID: <C03A3C267DDF184EA523BBAB577BF924F03FA2@blrexsr1.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi  samant,

   I normally use arm gnu toolchain provided by cosesourcery to work on
arm926ejs. The gcc version they use is 4.2.0 . Also now a days i am
using toolchain built using buildroot uclibc which uses gcc 4.2.1. Both
are working absolutely fine for me except that the Busy box built using
Buildroot Toolchain (with gcc 4.2.1) doesnt work. I use buildroot
toolchain only to compile Linux kernel and use codesourcery toolchain to
build Busybox.

Regards
Gururaja



-----Original Message-----
From: Rae_Samant@emc.com [mailto:Rae_Samant at emc.com] 
Sent: Thursday, September 20, 2007 6:56 AM
To: Gururaja Hebbar K R
Subject: RE: sysroot not anabled even when BR2_GCC_VERSION_4_2_1
isselected

Hi Gururaj,
 I have a question : Are you able to boot Arm 926 with GCC 4.2.1 ?
 
 Which kernel are you using ? And what patches are you using ?

 Are you also using initrd / ramdisk ?
 
 I ask this because I have been unable to compile Arm 926 based kernel
(provided by marvell) with GCC 4.2.1 .

 When I am able to compile the kernel with Gcc 3.4.6, then the shell
seems to be not working (buildroot snapshot/busybox 1.2.0).

 Hey, Please help me if possible with the information. I am stuck for
past one and half weeks.

Thanks and Regards,
samant


-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Hebbar
Sent: Thursday, September 20, 2007 4:28 AM
To: buildroot at uclibc.org
Subject: [Buildroot] sysroot not anabled even when BR2_GCC_VERSION_4_2_1
isselected


Hi All,

 I just tried latest buildroot snapshot and below is my buildroot
config.
What i observed is that BR2_TOOLCHAIN_SYSROOT i snot selected even
though i have enabled gcc 4.2.1. Let me know if any one has a quickest
solution.
LEt
me know if anyone needs more info.

Regards
Gururaja

BR2_arm=y
BR2_arm926t=y
BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm9tdmi"


BR2_PREFER_STATIC_LIB=y


#

#
# Toolchain type
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
BR2_TOOLCHAIN_NORMAL=y
# BR2_TOOLCHAIN_ATMEL_AVR32 is not set



#
# Gcc Options
#
# BR2_GCC_VERSION_3_3_5 is not set
# BR2_GCC_VERSION_3_3_6 is not set
# BR2_GCC_VERSION_3_4_2 is not set
# BR2_GCC_VERSION_3_4_3 is not set
# BR2_GCC_VERSION_3_4_4 is not set
# BR2_GCC_VERSION_3_4_5 is not set
# BR2_GCC_VERSION_3_4_6 is not set
# BR2_GCC_VERSION_4_0_0 is not set
# BR2_GCC_VERSION_4_0_1 is not set
# BR2_GCC_VERSION_4_0_2 is not set
# BR2_GCC_VERSION_4_0_3 is not set
# BR2_GCC_VERSION_4_0_4 is not set
# BR2_GCC_VERSION_4_1_0 is not set
# BR2_GCC_VERSION_4_1_1 is not set
# BR2_GCC_VERSION_4_1_2 is not set
# BR2_GCC_VERSION_4_2_0 is not set
BR2_GCC_VERSION_4_2_1=y
# BR2_GCC_IS_SNAP is not set
BR2_GCC_VERSION="4.2.1"
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set



--
View this message in context:
http://www.nabble.com/sysroot-not-anabled-even-when-BR2_GCC_VERSION_4_2_
1-is-selected-tf4486096.html#a12792950
Sent from the BuildRoot mailing list archive at Nabble.com.

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
