From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 17:37:13 +0100
Subject: [Buildroot] [PATCH 10/10] barebox: migrate to the kconfig
 infrastructure
In-Reply-To: <ea421877479d951601ffcf49fd5bce2d9d4f96b5.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
 <ea421877479d951601ffcf49fd5bce2d9d4f96b5.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <20150214173713.53782bb1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue,  3 Feb 2015 15:21:50 +0100, Yann E. MORIN wrote:

>  ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
>  BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\

This $(@D) was causing problems: Barebox was being constantly rebuilt,
because '/arch/arm/configs/<foobar>_defconfig' does not exist. This is
because $(@D) does not exist at this point.

I've instead used $(BAREBOX_DIR), just like the Linux kernel uses
$(LINUX_DIR). This solved the problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
