From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 23:05:35 +0100
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: add optional
 host-dtc dependency
In-Reply-To: <20200318205005.79605-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 18 Mar 2020 21:50:05 +0100")
References: <20200318205005.79605-1-thomas.petazzoni@bootlin.com>
Message-ID: <87blohfo7k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Some ATF configurations, such as the ones for the STM32MP1 processor
 > family, require DTC during the build as Device Tree files are
 > used. Without dtc, the build fails:

 > /bin/sh: 1: dtc: not found
 > dtc version too old (), you need at least version 1.4.4
 > plat/st/stm32mp1/platform.mk:239: recipe for target 'check_dtc_version' failed
 > make[1]: *** [check_dtc_version] Error 1

 > To solve this, this commit implements a
 > BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC option, in a way that mimics
 > the BR2_TARGET_UBOOT_NEEDS_DTC option we already have for the U-Boot
 > package.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

It isn't really technically a bugfix, but it seems quite low risk and
useful for the affected people, so committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
