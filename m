From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:19:30 +0100
Subject: [Buildroot] [PATCH v6 05/28] package/qwt: Partially convert to
 qmake infra
In-Reply-To: <20200217212350.29750-6-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-6-anaumann@ultratronik.de>
Message-ID: <20200311221930.4fde6032@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Feb 2020 22:23:27 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> -define QWT_CONFIGURE_CMDS
> +define QWT_PRE_CONFIGURE_CMD
>  	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
> -	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
>  endef
>  
> -define QWT_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> -endef
> +QWT_PRE_CONFIGURE_HOOKS += QWT_PRE_CONFIGURE_CMD

PRE_CONFIGURE_CMD is not a great name of a hook, as it doesn't say what
it does. So I renamed to QWT_TWEAK_QWTCONFIG_PRI, and applied.

Also, why can this package use INSTALL_ROOT in a "normal" way, i.e
INSTALL_ROOT=$(STAGING_DIR) and INSTALL_ROOT=$(TARGET_DIR) ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
