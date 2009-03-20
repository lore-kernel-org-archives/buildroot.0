From: Christian Eggers <wgnetz@freenet.de>
Date: Fri, 20 Mar 2009 07:49:32 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
Message-ID: <200903200749.32358.wgnetz@freenet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>Try the following changes, thing work fine here for me, also with
>gcc-4.3.2 built for PXA270/300.
>
>> # Automatically generated make config: don't edit
>> # Tue Mar 17 13:25:58 2009
>
>[...]
>
>> BR2_xscale=y
>> # BR2_iwmmxt is not set
>> BR2_ARM_TYPE="ARM_XSCALE"
>> # BR2_ARM_OABI is not set
>> BR2_ARM_EABI=y
>> BR2_ARCH="arm"
>> BR2_ENDIAN="LITTLE"
>> BR2_GCC_TARGET_TUNE="xscale"
>> BR2_GCC_TARGET_ABI="aapcs-linux"
>
># BR2_xscale is not set
>BR2_iwmmxt=y
>BR2_ARM_TYPE="ARM_IWMMXT"
># BR2_ARM_OABI is not set
>BR2_ARM_EABI=y
>BR2_ARCH="arm"
>BR2_ENDIAN="LITTLE"
>BR2_GCC_TARGET_TUNE="iwmmxt"
>BR2_GCC_TARGET_ARCH="iwmmxt"

/home/christian/buildroot-r25712/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c: In function '__do_global_dtors_aux':
/home/christian/buildroot-r25712/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306: error: '__DTOR_LIST__' undeclared (first use in this function)
/home/christian/buildroot-r25712/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306: error: (Each undeclared identifier is reported only once
/home/christian/buildroot-r25712/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306: error: for each function it appears in.)
make[2]: *** [crtbegin.o] Fehler 1
make[2]: Leaving directory `/home/christian/buildroot-r25712/toolchain_build_arm/gcc-4.3.3-initial/arm-linux-uclibc/libgcc'
make[1]: *** [all-target-libgcc] Fehler 2
make[1]: Leaving directory `/home/christian/buildroot-r25712/toolchain_build_arm/gcc-4.3.3-initial'
make: *** [/home/christian/buildroot-r25712/toolchain_build_arm/gcc-4.3.3-initial/.compiled] Fehler 2


I've the same problem building an ARM EABI toolchain. The GCC build error happens with buildroot-2009.02 (gcc-4.3.2) and current SVN (25712, gcc-4.3.3). The 
result is equal for xscale, iwmmxt and arm920t.

Ater each change in menuconfg I've deleted the toolchain_build_arm/ subdir. Is this sufficient?

regards
Christian
