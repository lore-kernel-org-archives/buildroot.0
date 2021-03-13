From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Mar 2021 09:14:34 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: fix compilation with
 PER_PACKAGE_DIRECTORIES enable
In-Reply-To: <20210310161646.23709-1-nicolas.toromanoff@foss.st.com>
References: <20210310161646.23709-1-nicolas.toromanoff@foss.st.com>
Message-ID: <20210313081434.GN2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2021-03-10 17:16 +0100, Nicolas Toromanoff spake thusly:
> If PER_PACKAGE_DIRECTORIES=Y and using host-make package
> (because BR2_FORCE_HOST_BUILD=Y or local make is too old)
> .stamp_dotconfig target needs per-package/uboot/host/bin/host-make that doesn't exist yet.
> Add host-make into UBOOT_KCONFIG_DEPENDENCIES.

At first, I was a bit confused because BR2_MAKE_HOST_DEPENDENCY is
already a dependency of uboot... So I slightly rephrased the commit
title to emphasize that this is related to the kconfig dependencies.

> Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/uboot/uboot.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index bb4598002252..dbe82e65b17e 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -498,6 +498,7 @@ $(eval $(generic-package))
>  else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
>  UBOOT_MAKE_ENV = $(TARGET_MAKE_ENV)
>  UBOOT_KCONFIG_DEPENDENCIES = \
> +	$(BR2_MAKE_HOST_DEPENDENCY) \
>  	$(BR2_BISON_HOST_DEPENDENCY) \
>  	$(BR2_FLEX_HOST_DEPENDENCY)
>  $(eval $(kconfig-package))
> -- 
> 2.17.1
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
