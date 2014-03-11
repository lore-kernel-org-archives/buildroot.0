From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Mar 2014 18:33:50 +0100
Subject: [Buildroot] [PATCH 1/6] barebox: fix coding style
In-Reply-To: <1394540278-28740-2-git-send-email-fabio.porcedda@gmail.com>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
 <1394540278-28740-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140311173350.GA3330@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-03-11 13:17 +0100, Fabio Porcedda spake thusly:
> Break long lines.
[--SNIP--]
> -BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
> +BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) \
> +	$(TARGET_CROSS)"

Although we have no written rule about thus, I'd rather that folded-lines
assignments continue after the '=' sign, like:

BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) \
                     $(TARGET_CROSS)"

It makes it easier to see the assignment.

>  ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
> -BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
> +BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
> +	$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig

Ditto.

>  else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
>  BAREBOX_SOURCE_CONFIG = $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
>  endif
>  
>  define BAREBOX_CONFIGURE_CMDS
> -	cp $(BAREBOX_SOURCE_CONFIG) $(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
> -	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
> +	cp $(BAREBOX_SOURCE_CONFIG) \
> +		$(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
> +	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) \
> +		buildroot_defconfig
>  endef
>  
>  ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
> @@ -68,7 +73,8 @@ endef
>  endif
>  
>  ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
> -BAREBOX_ENV_NAME = $(notdir $(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
> +BAREBOX_ENV_NAME = $(notdir $(call qstrip,\
> +	$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))

Ditto.

But I'd like the maintainer to Ack this before you resend. I have no
strong opinion about it, I just find it easier to read...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
