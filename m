From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Jun 2015 23:35:07 +0200
Subject: [Buildroot] [PATCH 07/11] package/ocf-linux: use kernel-module
	helper
In-Reply-To: <4efd619bc93860107ecf52076857ae06321f0e61.1433628825.git.yann.morin.1998@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <4efd619bc93860107ecf52076857ae06321f0e61.1433628825.git.yann.morin.1998@free.fr>
Message-ID: <20150608213506.GF3590@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2015-06-07 00:20 +0200, Yann E. MORIN spake thusly:
> Remove our patch since it is no longer needed.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
> index 8ca5578..3ebf462 100644
> --- a/package/ocf-linux/ocf-linux.mk
> +++ b/package/ocf-linux/ocf-linux.mk
> @@ -6,22 +6,19 @@
>  
>  OCF_LINUX_VERSION = 20120127
>  OCF_LINUX_SITE = http://downloads.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
> -OCF_LINUX_DEPENDENCIES = linux
>  OCF_LINUX_INSTALL_STAGING = YES
>  
> -define OCF_LINUX_BUILD_CMDS
> -	$(MAKE) -C $(@D)/ocf $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
> -		ocf_modules
> -endef
> -
> -define OCF_LINUX_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D)/ocf $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
> -		ocf_install
> -endef
> +OCF_LINUX_MODULE_DIR = ocf

Before any notices: that's wrong, and already fixed locally.

Regards,
Yann E. MORIN.

> +OCF_LINUX_MODULE_MAKE_OPTS = \
> +	CONFIG_OCF_OCF=m \
> +	CONFIG_OCF_CRYPTOSOFT=m \
> +	CONFIG_OCF_BENCH=m \
> +	CONFIG_OCF_OCFNULL=m
>  
>  define OCF_LINUX_INSTALL_STAGING_CMDS
>  	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
>  		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
>  endef
>  
> +$(eval $(kernel-module))
>  $(eval $(generic-package))
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
