From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Nov 2014 14:00:35 +0100
Subject: [Buildroot] [PATCH 1/1] binutils/gcc: make it possible to use
 lto
In-Reply-To: <1415534161-24389-1-git-send-email-syntheticpp@gmx.net>
References: <1415534161-24389-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <20141109140035.3798a1c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter K?mmel,

On Sun,  9 Nov 2014 12:56:01 +0100, Peter K?mmel wrote:
> When -flto is used the compiler and binutils have to support lto.
> ar/ranlib needs to be called with the lto plugin, therefore use
> the wrappers provided by GCC: *-gcc-ar and *-gcc-ranlib.
> 
> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
> ---
>  package/binutils/binutils.mk | 2 ++
>  package/gcc/gcc.mk           | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index b8dab5d..e552abc 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -48,6 +48,7 @@ BINUTILS_DISABLE_GDB_CONF_OPTS = \
>  BINUTILS_CONF_OPTS = --disable-multilib --disable-werror \
>  		--host=$(GNU_TARGET_NAME) \
>  		--target=$(GNU_TARGET_NAME) \
> +		--enable-plugins --enable-lto \
>  		--enable-install-libiberty \
>  		$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
>  		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
> @@ -67,6 +68,7 @@ endif
>  HOST_BINUTILS_CONF_OPTS = --disable-multilib --disable-werror \
>  			--target=$(GNU_TARGET_NAME) \
>  			--disable-shared --enable-static \
> +			--enable-plugins --enable-lto \
>  			--with-sysroot=$(STAGING_DIR) \
>  			$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
>  			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index cdd71aa..a8853f7 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -92,6 +92,8 @@ HOST_GCC_COMMON_CONF_OPTS = \
>  	--with-gnu-ld \
>  	--disable-libssp \
>  	--disable-multilib \
> +	--enable-plugins \
> +	--enable-lto \
>  	--with-gmp=$(HOST_DIR)/usr \
>  	--with-mpfr=$(HOST_DIR)/usr
>  

Should we make this optional?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
