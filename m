From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 11 Jul 2016 16:20:08 +0000
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
	arc-2016.09-eng005
In-Reply-To: <1468253418-26929-1-git-send-email-vzakhar@synopsys.com>
References: <1468253418-26929-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <1468254007.3015.24.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I mentioned I had made a mistake in the commit message.
The right Subject should be: "toolchain: Bump ARC tools to arc-2016.09-eng006"

Thanks.

On Mon, 2016-07-11 at 19:10 +0300, Vlad Zakharov wrote:
> As described at:
> 4520524ba055706236db9f00dd79f1b2e2e87fde
> this commit continues a series of updates of ARC tools.
> 
> This engineering build fixes the kernel dwarf stack unwinder feature for
> ARC targets.
> 
> We still keep GDB as it is of arc-2016.03 release because there're some
> issues we'd like to resolve before releasing it to wider audience.
> 
> So again note this is next engineering builds of arc-2016.09 series
> and it might have all kinds of breakages, please don't use it for
> production builds.
> 
> Related to:
> 4520524ba055706236db9f00dd79f1b2e2e87fde
> ---
> ?package/binutils/Config.in.host?????????????????????????????????????????| 2 +-
> ?.../{arc-2016.09-eng005 => arc-2016.09-eng006}/0300-ld-makefile.patch???| 0
> ?.../0301-check-ldrunpath-length.patch???????????????????????????????????| 0
> ?.../0500-add-sysroot-fix-from-bug-3049.patch????????????????????????????| 0
> ?.../0600-poison-system-directories.patch????????????????????????????????| 0
> ?package/binutils/binutils.hash??????????????????????????????????????????| 2 +-
> ?package/binutils/binutils.mk????????????????????????????????????????????| 2 +-
> ?package/gcc/Config.in.host??????????????????????????????????????????????| 2 +-
> ?.../130-fix_build_with_gcc-6.patch??????????????????????????????????????| 0
> ?.../gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/130-pr43538.patch????| 0
> ?.../301-missing-execinfo_h.patch????????????????????????????????????????| 0
> ?.../305-libmudflap-susv3-legacy.patch???????????????????????????????????| 0
> ?.../gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/842-PR60155.patch????| 0
> ?.../850-libstdcxx-uclibc-c99.patch??????????????????????????????????????| 0
> ?.../{arc-2016.09-eng005 => arc-2016.09-eng006}/851-PR-other-56780.patch | 0
> ?.../930-libgcc-disable-split-stack-nothreads.patch??????????????????????| 0
> ?package/gcc/gcc.hash????????????????????????????????????????????????????| 2 +-
> ?17 files changed, 5 insertions(+), 5 deletions(-)
> ?rename package/binutils/{arc-2016.09-eng005 => arc-2016.09-eng006}/0300-ld-makefile.patch (100%)
> ?rename package/binutils/{arc-2016.09-eng005 => arc-2016.09-eng006}/0301-check-ldrunpath-length.patch (100%)
> ?rename package/binutils/{arc-2016.09-eng005 => arc-2016.09-eng006}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
> ?rename package/binutils/{arc-2016.09-eng005 => arc-2016.09-eng006}/0600-poison-system-directories.patch (100%)
> ?rename package/gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/130-fix_build_with_gcc-6.patch (100%)
> ?rename package/gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/130-pr43538.patch (100%)
> ?rename package/gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/301-missing-execinfo_h.patch (100%)
> ?rename package/gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/305-libmudflap-susv3-legacy.patch (100%)
> ?rename package/gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/842-PR60155.patch (100%)
> ?rename package/gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/850-libstdcxx-uclibc-c99.patch (100%)
> ?rename package/gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/851-PR-other-56780.patch (100%)
> ?rename package/gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/930-libgcc-disable-split-stack-nothreads.patch (100%)
> 
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index a606cc9..34cda13 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -28,7 +28,7 @@ endchoice
> ?
> ?config BR2_BINUTILS_VERSION
> ?	string
> -	default "arc-2016.09-eng005"	if BR2_arc
> +	default "arc-2016.09-eng006"	if BR2_arc
> ?	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
> ?	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
> ?	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
> diff --git a/package/binutils/arc-2016.09-eng005/0300-ld-makefile.patch b/package/binutils/arc-2016.09-eng006/0300-ld-makefile.patch
> similarity index 100%
> rename from package/binutils/arc-2016.09-eng005/0300-ld-makefile.patch
> rename to package/binutils/arc-2016.09-eng006/0300-ld-makefile.patch
> diff --git a/package/binutils/arc-2016.09-eng005/0301-check-ldrunpath-length.patch b/package/binutils/arc-2016.09-eng006/0301-check-
> ldrunpath-length.patch
> similarity index 100%
> rename from package/binutils/arc-2016.09-eng005/0301-check-ldrunpath-length.patch
> rename to package/binutils/arc-2016.09-eng006/0301-check-ldrunpath-length.patch
> diff --git a/package/binutils/arc-2016.09-eng005/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2016.09-eng006/0500-add-
> sysroot-fix-from-bug-3049.patch
> similarity index 100%
> rename from package/binutils/arc-2016.09-eng005/0500-add-sysroot-fix-from-bug-3049.patch
> rename to package/binutils/arc-2016.09-eng006/0500-add-sysroot-fix-from-bug-3049.patch
> diff --git a/package/binutils/arc-2016.09-eng005/0600-poison-system-directories.patch b/package/binutils/arc-2016.09-eng006/0600-poison-
> system-directories.patch
> similarity index 100%
> rename from package/binutils/arc-2016.09-eng005/0600-poison-system-directories.patch
> rename to package/binutils/arc-2016.09-eng006/0600-poison-system-directories.patch
> diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
> index 412dc11..435f622 100644
> --- a/package/binutils/binutils.hash
> +++ b/package/binutils/binutils.hash
> @@ -4,4 +4,4 @@ sha512??0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f6
> ?sha512??9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322bb6cb2b45e8df812f0e8ac059149f8a1f69ba3ed9d86a35c6a540b67?
> ?binutils-2.26.1.tar.bz2
> ?
> ?# Locally calculated (fetched from Github)
> -sha512??a0e2974990d6087aef94fec958b9f14458e847308d59dfb6f5dd8e9d1a246c4c4885a240ba43f15a7a20aff43bccba5a664daadf7fae54415bb8298620b46c23?
> ?binutils-arc-2016.09-eng005.tar.gz
> +sha512??2609afaad4c37469ee3661f12140d7b0c856cd8050a0d29ec28c92416377bc0742ff680fcffba753ac38a2692c77ac8bf2ec1373a94dde3782d9b077b939c8fa?
> ?binutils-arc-2016.09-eng006.tar.gz
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 50a3531..ae532a2 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -9,7 +9,7 @@
> ?BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
> ?ifeq ($(BINUTILS_VERSION),)
> ?ifeq ($(BR2_arc),y)
> -BINUTILS_VERSION = arc-2016.09-eng005
> +BINUTILS_VERSION = arc-2016.09-eng006
> ?else
> ?BINUTILS_VERSION = 2.25.1
> ?endif
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index dbabce8..204876f 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -107,7 +107,7 @@ config BR2_GCC_VERSION
> ?	default "4.9.3"?????if BR2_GCC_VERSION_4_9_X
> ?	default "5.4.0"?????if BR2_GCC_VERSION_5_X
> ?	default "6.1.0" if BR2_GCC_VERSION_6_X
> -	default "arc-2016.09-eng005" if BR2_GCC_VERSION_4_8_ARC
> +	default "arc-2016.09-eng006" if BR2_GCC_VERSION_4_8_ARC
> ?
> ?config BR2_EXTRA_GCC_CONFIG_OPTIONS
> ?	string "Additional gcc options"
> diff --git a/package/gcc/arc-2016.09-eng005/130-fix_build_with_gcc-6.patch b/package/gcc/arc-2016.09-eng006/130-fix_build_with_gcc-6.patch
> similarity index 100%
> rename from package/gcc/arc-2016.09-eng005/130-fix_build_with_gcc-6.patch
> rename to package/gcc/arc-2016.09-eng006/130-fix_build_with_gcc-6.patch
> diff --git a/package/gcc/arc-2016.09-eng005/130-pr43538.patch b/package/gcc/arc-2016.09-eng006/130-pr43538.patch
> similarity index 100%
> rename from package/gcc/arc-2016.09-eng005/130-pr43538.patch
> rename to package/gcc/arc-2016.09-eng006/130-pr43538.patch
> diff --git a/package/gcc/arc-2016.09-eng005/301-missing-execinfo_h.patch b/package/gcc/arc-2016.09-eng006/301-missing-execinfo_h.patch
> similarity index 100%
> rename from package/gcc/arc-2016.09-eng005/301-missing-execinfo_h.patch
> rename to package/gcc/arc-2016.09-eng006/301-missing-execinfo_h.patch
> diff --git a/package/gcc/arc-2016.09-eng005/305-libmudflap-susv3-legacy.patch b/package/gcc/arc-2016.09-eng006/305-libmudflap-susv3-
> legacy.patch
> similarity index 100%
> rename from package/gcc/arc-2016.09-eng005/305-libmudflap-susv3-legacy.patch
> rename to package/gcc/arc-2016.09-eng006/305-libmudflap-susv3-legacy.patch
> diff --git a/package/gcc/arc-2016.09-eng005/842-PR60155.patch b/package/gcc/arc-2016.09-eng006/842-PR60155.patch
> similarity index 100%
> rename from package/gcc/arc-2016.09-eng005/842-PR60155.patch
> rename to package/gcc/arc-2016.09-eng006/842-PR60155.patch
> diff --git a/package/gcc/arc-2016.09-eng005/850-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2016.09-eng006/850-libstdcxx-uclibc-c99.patch
> similarity index 100%
> rename from package/gcc/arc-2016.09-eng005/850-libstdcxx-uclibc-c99.patch
> rename to package/gcc/arc-2016.09-eng006/850-libstdcxx-uclibc-c99.patch
> diff --git a/package/gcc/arc-2016.09-eng005/851-PR-other-56780.patch b/package/gcc/arc-2016.09-eng006/851-PR-other-56780.patch
> similarity index 100%
> rename from package/gcc/arc-2016.09-eng005/851-PR-other-56780.patch
> rename to package/gcc/arc-2016.09-eng006/851-PR-other-56780.patch
> diff --git a/package/gcc/arc-2016.09-eng005/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/arc-2016.09-eng006/930-libgcc-
> disable-split-stack-nothreads.patch
> similarity index 100%
> rename from package/gcc/arc-2016.09-eng005/930-libgcc-disable-split-stack-nothreads.patch
> rename to package/gcc/arc-2016.09-eng006/930-libgcc-disable-split-stack-nothreads.patch
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index 1b41d0a..808e0ac 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -12,4 +12,4 @@ sha512??2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
> ?sha512??eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e?
> ?gcc-6.1.0.tar.bz2
> ?
> ?# Locally calculated (fetched from Github)
> -sha512??6234ad8d6e613bc490f8b8d92be8b348ce6cf5e803afab009936323ef5bca36ad56614f57f9ba8a3cb1b03d9f4e45a3e4529b7356a764ad2176e3ff3d0e593db?
> ?gcc-arc-2016.09-eng005.tar.gz
> +sha512??40e4c5d8dc4086c1d5edea94fa4efc5726b1dd6d0b7c14f28d75a2538d434e908f7561bfae28e239c87bde52775464fd86a8b08fde4204bc374312c37e681db1?
> ?gcc-arc-2016.09-eng006.tar.gz
-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
