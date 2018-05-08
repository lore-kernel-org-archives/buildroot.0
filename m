From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:31:39 +0200
Subject: [Buildroot] [PATCH] package/ncurses: enable widechar for host
 build
In-Reply-To: <20180503194507.GB2453@scaer>
References: <20180426190845.21415-1-arnout@mind.be>
 <20180503075808.26367-1-arnout@mind.be>
 <20180503194507.GB2453@scaer>
Message-ID: <20180508153139.0d807f82@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 May 2018 21:45:07 +0200, Yann E. MORIN wrote:

> What about overriding HOSTCC when calling linux-menuconfig:
> 
>     diff --git a/linux/linux.mk b/linux/linux.mk
>     index 9e646baffc..75a256ff9e 100644
>     --- a/linux/linux.mk
>     +++ b/linux/linux.mk
>     @@ -235,7 +235,7 @@ LINUX_KCONFIG_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
>      endif
>      LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
>      LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>     -LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
>     +LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC)"
>      
>      # If no package has yet set it, set it from the Kconfig option
>      LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)
> 
> We should not need any library from HOST_DIR when we run menuconfig.
> 
> Note: we may still want to enable widechar in host-ncurses for other
> reasons, though. But with the proposdal above, there is no lopnger any
> mix of system ncurses vs our own.

Arnout, any comment on Yann's proposal? I have to say my preference
goes to Yann's solution, as it's the one that ensures there is no
mixing of ncurses between the one we build in HOST_DIR and the one
provided by the system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
