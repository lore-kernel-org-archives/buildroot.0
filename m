From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Aug 2019 09:07:33 +0200
Subject: [Buildroot] [PATCH v3] configs/stm32mp157_dk: new defconfig
In-Reply-To: <20190807142456.23503-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 7 Aug 2019 16:24:56 +0200")
References: <20190807142456.23503-1-thomas.petazzoni@bootlin.com>
Message-ID: <87blwtmtl6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit adds a minimal defconfig to build a Buildroot system for
 > the STM32MP157 Discovery Kit, which is the low-cost evaluation
 > platform for the new STM32MP157 system-on-chip from ST. This
 > system-on-chip features a single or dual Cortex-A7, a single
 > Cortex-M4, and a wide variety of peripherals.

 > This commit includes a custom linux configuration file, because there
 > is no specific defconfig for this platform in the kernel, only
 > multi_v7_defconfig supports it, which is really a massive
 > defconfig. That's why a custom linux configuration file is added.

 > A small U-Boot config fragment allows to disable the watchdog, so that
 > userspace by default doesn't need to have a watchdog daemon running.

 > The vendor U-Boot and Linux trees are used for the moment, but the
 > platform support is being upstreamed, so switching to upstream
 > versions will be possible in the relatively near future.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Changes since v2:
 >  - Bump vendor Linux and U-Boot versions
 >  - Use the $(call github,...) macro also to download U-Boot as a
 >    tarball
 >  - Drop all other patches that have been merged

 > Peter: if you remember from the hackathon, this defconfig was not
 > booting properly. Turned out I rebased on master, but *before* the
 > point you merged the U-Boot change to support "custom build
 > variables". Due to this the DEVICE_TREE=stm32mp157c-dk2 directive from
 > BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS was not taken into account, causing
 > the incorrect DT to be used in the U-Boot build. Properly rebased on
 > the latest master, the defconfig works just fine!

Ahh, that explains it ;)

-- 
Bye, Peter Korsgaard
