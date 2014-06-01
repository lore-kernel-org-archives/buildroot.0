From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 1 Jun 2014 13:58:59 +0300
Subject: [Buildroot] [PATCH 08/11] toolchain-external: bump musl
 external toolchains to 1.1.1
In-Reply-To: <1401619668-28062-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401619668-28062-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140601105859.GD4280@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jun 01, 2014 at 12:47:45PM +0200, Thomas Petazzoni wrote:
> And while we're at it, factorize the definition of the musl version,
> since it's common to the definition of the tarball names for the
> various supported architectures.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/Config.in             |  2 +-
>  toolchain/toolchain-external/toolchain-external.mk | 23 +++++++++++-----------
>  2 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 8fca01a..527ff04 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -804,7 +804,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
>  	select BR2_TOOLCHAIN_EXTERNAL_MUSL
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
>  	help
>  	  Toolchain based on the Musl C library, provided by the
>  	  musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index a6c4061..47273d3 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -355,31 +355,32 @@ TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.05/components/toolchain/
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.05_linux.tar.xz
>  TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
> -TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-1.0.0/
> +TOOLCHAIN_EXTERNAL_VERSION = 1.1.1

This name sounds too generic. Other external toolchains are unlikely to use 
the same version string. Maybe MUSL_TOOLCHAIN_EXTERNAL_VERSION?

baruch

> +TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)/
>  ifeq ($(BR2_arm),y)
> -TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-1.0.0.tar.xz
> +TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
>  else ifeq ($(BR2_armeb),y)
> -TOOLCHAIN_EXTERNAL_SOURCE = crossx86-armeb-linux-musleabi-1.0.0.tar.xz
> +TOOLCHAIN_EXTERNAL_SOURCE = crossx86-armeb-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
>  else ifeq ($(BR2_i386),y)
> -TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-1.0.0.tar.xz
> +TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
>  else ifeq ($(BR2_microblazebe),y)
> -TOOLCHAIN_EXTERNAL_SOURCE = crossx86-microblaze-linux-musl-1.0.0.tar.xz
> +TOOLCHAIN_EXTERNAL_SOURCE = crossx86-microblaze-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
>  else ifeq ($(BR2_mips),y)
>  ifeq ($(BR2_SOFT_FLOAT),y)
> -TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-sf-linux-musl-1.0.0.tar.xz
> +TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
>  else
> -TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-1.0.0.tar.xz
> +TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
>  endif # BR2_SOFT_FLOAT
>  else ifeq ($(BR2_mipsel),y)
>  ifeq ($(BR2_SOFT_FLOAT),y)
> -TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-1.0.0.tar.xz
> +TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
>  else
> -TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-1.0.0.tar.xz
> +TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
>  endif # BR2_SOFT_FLOAT
>  else ifeq ($(BR2_powerpc),y)
> -TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-1.0.0.tar.xz
> +TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
>  else ifeq ($(BR2_x86_64),y)
> -TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-1.0.0.tar.xz
> +TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
>  endif
>  else
>  # Custom toolchain
> -- 
> 1.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
