From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:02:18 +0100
Subject: [Buildroot] [PATCH 3/6] configs/armadeus_apf27: fix U-Boot
 configuration
In-Reply-To: <20181122094150.10403-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 22 Nov 2018 10:41:46 +0100")
References: <20181122094150.10403-1-thomas.petazzoni@bootlin.com>
 <20181122094150.10403-3-thomas.petazzoni@bootlin.com>
Message-ID: <87pnurvkkl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The U-Boot part of the defconfig was not specifying explicitly any
 > U-Boot version. Since commit 21e3ae8a18bb77943c0a2492ab9ebf14cab333f9
 > ("boot/uboot: default to kconfig buildsystem for latest version"), we
 > default to using the kconfig build system when the default U-Boot
 > version is used. Following this change, the apf27 defconfig therefore
 > started using kconfig, for which the BR2_TARGET_UBOOT_BOARDNAME
 > Config.in option is not used. Due to this, the build fails with:

 > boot/uboot/uboot.mk:411: *** No board defconfig name specified, check your BR2_TARGET_UBOOT_BOARD_DEFCONFIG setting.  Stop.

 > Indeed, when Kconfig is used, the board defconfig must be specified
 > with BR2_TARGET_UBOOT_BOARD_DEFCONFIG.

 > As part of fixing this, we also set a fixed U-Boot version for this
 > defconfig, like we do in all other defconfigs.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/123771003

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
