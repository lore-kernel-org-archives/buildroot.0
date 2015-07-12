From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 18:57:12 +0200
Subject: [Buildroot] [PATCH 1/1] ti-wl12xx_target_scripts: new package
In-Reply-To: <1407445843-24031-1-git-send-email-jtheou@adeneo-embedded.us>
References: <1407445843-24031-1-git-send-email-jtheou@adeneo-embedded.us>
Message-ID: <20150712185712.6f0b6e90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jean-Baptiste Theou,

Sorry for the very slow response. We are in the process of triaging a
lot of old patches, so here is some feedback.

On Thu, 7 Aug 2014 14:10:43 -0700, Jean-Baptiste Theou wrote:

> diff --git a/package/ti-wl12xx_target_scripts/ti-wl12xx_target_scripts.mk b/package/ti-wl12xx_target_scripts/ti-wl12xx_target_scripts.mk
> new file mode 100644
> index 0000000..5b12032
> --- /dev/null
> +++ b/package/ti-wl12xx_target_scripts/ti-wl12xx_target_scripts.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# ti-wl12xx_target_scripts
> +#
> +################################################################################
> +
> +TI_WL12XX_TARGET_SCRIPTS_VERSION = 142042970a7827dfd74de2a4c4b91cff57c6b870
> +TI_WL12XX_TARGET_SCRIPTS_SITE = $(call github,TI-OpenLink,wl12xx_target_scripts,$(TI_WL12XX_TARGET_SCRIPTS_VERSION))

The github page says "Project has moved - Please
use :http://software-dl.ti.com/ecs/WiLink8/latest/index_FDS.html".

> +TI_WL12XX_TARGET_SCRIPTS_LICENSE = Apache-2.0
> +
> +define TI_WL12XX_TARGET_SCRIPTS_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/opt/ti/wl12xx_target_scripts
> +	cp -R $(@D)/* \
> +		$(TARGET_DIR)/opt/ti/wl12xx_target_scripts

This should be on one line, the line isn't longer than 80 characters.

> +	chmod +x -R $(TARGET_DIR)/opt/ti/wl12xx_target_scripts

Why do we install in /opt/ti ? It seems like a weird location for
scripts, no?

In the mean time, we've marked your patch as Changes Requested in
patchwork. Please resend an updated version taking into account the
above feedback if you're still interested by this package.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
