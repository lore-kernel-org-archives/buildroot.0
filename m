From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 23:19:54 +0200
Subject: [Buildroot] [PATCH v7 1/2] boot: add ts4800-mbrboot package
In-Reply-To: <1468610588-9709-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1468610588-9709-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1468610588-9709-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <20160715231954.5f97d28e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied, after doing some minor changes, see below.

On Fri, 15 Jul 2016 15:23:07 -0400, Patrick Keroulas wrote:

>  boot/Config.in                        |  1 +
>  boot/ts4800-mbrboot/Config.in         |  7 +++++++
>  boot/ts4800-mbrboot/ts4800-mbrboot.mk | 20 ++++++++++++++++++++

A hash file was missing, so I've added one.


> +define TS4800_MBRBOOT_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/mbrboot.bin $(BINARIES_DIR)/mbrboot.bin
> +endef

You're installing to $(BINARIES_DIR), not $(TARGET_DIR), so using
INSTALL_TARGET_CMDS is not correct (it works, but it's not correct).

I've changed that to use INSTALL_IMAGES_CMDS (and therefore I've also
added INSTALL_IMAGES = YES).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
