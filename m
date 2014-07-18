From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Jul 2014 18:46:02 +0200
Subject: [Buildroot] [PATCH] pkg-infra: Fix DOWNLOAD_LOCALFILES
In-Reply-To: <53C8C8C9.1000004@andin.de>
References: <1405609578-28052-1-git-send-email-anaumann@ultratronik.de>
 <53C8C8C9.1000004@andin.de>
Message-ID: <20140718164602.GA3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2014-07-18 09:12 +0200, Andreas Naumann spake thusly:
> From 40ba2efd131a4fd70e44a0f9f96c4637da279df8 Mon Sep 17 00:00:00 2001
> From: Andreas Naumann <anaumann@ultratronik.de>
> Date: Thu, 17 Jul 2014 16:47:02 +0200
> Subject: [PATCH 1/6] pkg-infra: Fix DOWNLOAD_LOCALFILES
> 
> The cp helperscript expects a filename as target, but just the folder name
> was given.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 7f208d5..118591c 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -206,7 +206,7 @@ endef
>  define DOWNLOAD_LOCALFILES
>  	test -e $(DL_DIR)/$(2) || \
>  	$(EXTRA_ENV) support/download/cp $(call stripurischeme,$(call
> qstrip,$(1))) \
> -					 $(DL_DIR) && \
> +					 $(DL_DIR)/$(2) && \
>  	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
>  endef
> 
> -- 
> 1.8.3.2

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
