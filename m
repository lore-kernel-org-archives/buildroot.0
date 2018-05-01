From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 1 May 2018 22:09:01 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "glibc: install the obsolete
 libnsl"
In-Reply-To: <20180501200508.13974-2-romain.naour@gmail.com>
References: <20180501200508.13974-1-romain.naour@gmail.com>
 <20180501200508.13974-2-romain.naour@gmail.com>
Message-ID: <eff9b6b0-1abb-8edc-8cf9-9aa4e25ddfb2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Le 01/05/2018 ? 22:05, Romain Naour a ?crit?:
> libnsl from Glibc is deprecated and should not be used anymore.
> libnsl is now an separate library that can be packaged later if
> necessary [1].
> 
> Note: libnsl from Glibc doesn't build with gcc 8 due new warning [2].
> 
> [1] https://github.com/thkukuk/libnsl.git
> [2] http://patchwork.sourceware.org/patch/26437
> 
> This reverts commit 398747f5fafca8c07e696612d8eded53d4f935c7.

I missed libnsl.so.* from GLIBC_LIBS_LIB list. It should be removed.
Same for libnsl.so.* from TOOLCHAIN_EXTERNAL_LIBS.

Thoughts?

Best regards,
Romain

> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/glibc/glibc.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 3ab673c0cc..0d406c195e 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -100,7 +100,6 @@ define GLIBC_CONFIGURE_CMDS
>  		--disable-profile \
>  		--without-gd \
>  		--enable-obsolete-rpc \
> -		--enable-obsolete-nsl \
>  		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
>  		--with-headers=$(STAGING_DIR)/usr/include)
>  	$(GLIBC_ADD_MISSING_STUB_H)
> 
