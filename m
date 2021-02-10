From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 19:53:58 +0100
Subject: [Buildroot] [PATCH 2/2] package/xenomai: disable cobalt for
 armv8
In-Reply-To: <20210202205614.59303-2-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 2 Feb 2021 21:56:14 +0100")
References: <20210202205614.59303-1-romain.naour@gmail.com>
 <20210202205614.59303-2-romain.naour@gmail.com>
Message-ID: <87pn17n48p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > When a armv8 target is used in 32bits mode, xenomai fail to
 > detect the ARM architecture and abord the build.
 > (__ARM_ARCH_7A__ is not defined for armv8 cpus).

 > There are no autobuilder failures for this issue since cobalt
 > is never selected, but the following defconfig:

 > BR2_arm=y
 > BR2_cortex_a53=y
 > BR2_ARM_FPU_NEON_VFPV4=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_PACKAGE_XENOMAI=y
 > BR2_PACKAGE_XENOMAI_COBALT=y

 > This was initialy reproduced using the raspberrypi3_defconfig
 > with Xenomai package with cobalt selected.

 > In order to use Xenomai on raspberrypi3 in 32 bits mode,
 > you have to select BR2_cortex_a7. This partially revert the
 > commit a13a388dd444ee047f0e7b8c10f5e6c235ec5004.

 > See:
 > https://gitlab.denx.de/Xenomai/xenomai/-/blob/v3.1/lib/cobalt/arch/arm/include/asm/xenomai/features.h#L52

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
