From: Marco Pastorelli <mpastorelli@gmail.com>
Date: Thu, 3 Jul 2014 11:05:02 +0200
Subject: [Buildroot] Incorrect ABI setting on ubuntu 14.04LTS
Message-ID: <CAFRxoJn5x=5YbSCOsMu7XB1PS2Dv2=fyih7nrwMmde0YtveeTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

I'm using buildroot 2014.05 to compile a BSP for a beaglebone. I'm using
linaro toolchain 2014.02

If I compile with ubuntu 12.04LTS everything works fine.
When I compile exactly the same project with another PC running ubuntu
14.04LTS I run into this error:

>>> toolchain-external undefined Configuring
Incorrect ABI setting: EABIhf selected, but toolchain is incompatible

Does anybody knows which could be the problem?

Thanks!
Marco.

PS: hereafter the main config keys

BR2_HAVE_DOT_CONFIG=y
BR2_HOSTARCH_NEEDS_IA32_LIBS=y

BR2_arm=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_ARCH="armv7-a"
BR2_GCC_TARGET_ABI="aapcs-linux"
BR2_GCC_TARGET_CPU="cortex-a8"
BR2_GCC_TARGET_FPU="vfpv3-d16"
BR2_GCC_TARGET_FLOAT_ABI="hard"
BR2_GCC_TARGET_MODE="arm"
BR2_ARM_CPU_HAS_NEON=y
BR2_ARM_CPU_HAS_VFPV2=y
BR2_ARM_CPU_HAS_VFPV3=y
BR2_ARM_CPU_HAS_THUMB2=y
BR2_cortex_a8=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_VFPV3D16=y
BR2_ARM_INSTRUCTIONS_ARM_CHOICE=y
BR2_ARM_INSTRUCTIONS_ARM=y

BR2_TOOLCHAIN=y
BR2_TOOLCHAIN_USES_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02=y

BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_PREFIX="arm-linux-gnueabihf"
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_TOOLCHAIN_HAS_GCC_BUG_58854=y
BR2_TOOLCHAIN_HAS_NATIVE_RPC=y
BR2_USE_WCHAR=y
BR2_ENABLE_LOCALE=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG=y
BR2_TOOLCHAIN_HAS_THREADS_NPTL=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
BR2_TOOLCHAIN_HAS_SSP=y
BR2_GENERATE_LOCALE=""
BR2_USE_MMU=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST="3.1"
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140703/cbd38fd4/attachment.html>
