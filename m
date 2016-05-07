From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 09:13:43 +0200
Subject: [Buildroot] [PATCH v3 1/3] uboot-tools: install libubootenv to
 staging
In-Reply-To: <1462187815-2414-1-git-send-email-joerg.krause@embedded.rocks>
References: <1462187815-2414-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160507091343.0c7fc7d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 May 2016 13:16:53 +0200, J?rg Krause wrote:

> +define UBOOT_TOOLS_INSTALL_LIBUBOOTENV

I've dropped this variable, and simply done the installation directly
in UBOOT_TOOLS_INSTALL_STAGING_CMDS.

> +	$(INSTALL) -D -m 0755 $(@D)/tools/env/lib.a $(STAGING_DIR)/usr/lib/libubootenv.a
> +	$(INSTALL) -D -m 0644 $(@D)/tools/env/fw_env.h $(STAGING_DIR)/usr/include/fw_env.h
> +endef
> +
> +define UBOOT_TOOLS_INSTALL_STAGING_CMDS
> +	$(UBOOT_TOOLS_INSTALL_LIBUBOOTENV)
> +endef

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
