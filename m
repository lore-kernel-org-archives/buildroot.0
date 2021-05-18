From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 23:21:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/rustc: prepare for musl-based
 platforms support
In-Reply-To: <20210518205432.133118-2-thomas.petazzoni@bootlin.com>
References: <20210518205432.133118-1-thomas.petazzoni@bootlin.com>
 <20210518205432.133118-2-thomas.petazzoni@bootlin.com>
Message-ID: <20210518212112.GE2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathaniel, Thomas, All,

On 2021-05-18 22:54 +0200, Thomas Petazzoni spake thusly:
> From: Nathaniel Husted <nathaniel.husted@outlook.com>
> 
> The current rustc package only supports configurations based on glibc
> and hardcodes this requirement. This patch prepares the addition of
> support for musl-based platforms by using $(LIBC) instead of
> hardcoding "gnu" as the C library specifier when defining
> RUSTC_TARGET_NAME.
> 
> Signed-off-by: Nathaniel Husted <nathaniel.husted@outlook.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This first patch: Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rustc/rustc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
> index 35ffc36106..52860b7eff 100644
> --- a/package/rustc/rustc.mk
> +++ b/package/rustc/rustc.mk
> @@ -8,7 +8,7 @@ RUSTC_ARCH = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ARCH))
>  RUSTC_ABI = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ABI))
>  
>  ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
> -RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
> +RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-$(LIBC)$(RUSTC_ABI)
>  endif
>  
>  ifeq ($(HOSTARCH),x86)
> -- 
> 2.31.1
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
