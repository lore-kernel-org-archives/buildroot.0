From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 22:31:52 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/nano: fix tiny build"
In-Reply-To: <20210119175326.497192-1-fontaine.fabrice@gmail.com>
References: <20210119175326.497192-1-fontaine.fabrice@gmail.com>
Message-ID: <20210124213152.GJ2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-19 18:53 +0100, Fabrice Fontaine spake thusly:
> This reverts commit a0202ffa4a1e89225d22433d162d1726e43cd629 as it will
> raise a build failure to enable color without MMU.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cd5583b493df6e30a033cc6bc29c637eb0e46f64
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nano/nano.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/nano/nano.mk b/package/nano/nano.mk
> index 097afadc31..c688ff216c 100644
> --- a/package/nano/nano.mk
> +++ b/package/nano/nano.mk
> @@ -28,9 +28,6 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_NANO_TINY),y)
>  NANO_CONF_OPTS += --enable-tiny
> -ifeq ($(BR2_PACKAGE_FILE),y)
> -NANO_CONF_OPTS += --enable-color --enable-nanorc
> -endif
>  define NANO_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
>  endef
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
