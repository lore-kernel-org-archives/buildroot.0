From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Nov 2013 23:26:01 +0100
Subject: [Buildroot] (no subject)
In-Reply-To: <20131120220956.97BD8814BA@whitealder.osuosl.org>
References: <20131120220956.97BD8814BA@whitealder.osuosl.org>
Message-ID: <528E8879.5030800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/11/13 23:09, chris at zankel.net wrote:
>>From 2f2ca743fab0a0b2aaf5658a532e09b2d64248c3 Mon Sep 17 00:00:00 2001
> Message-Id: <2f2ca743fab0a0b2aaf5658a532e09b2d64248c3.1384984956.git.chris@zankel.net>
> In-Reply-To: <cover.1384984956.git.chris@zankel.net>
> References: <cover.1384984956.git.chris@zankel.net>
> From: Chris Zankel <chris@zankel.net>
> Date: Wed, 20 Nov 2013 10:46:03 -0800
> Subject: [PATCH 2/2] libnspr: Add dependency on !BR2_xtensa
> To: buildroot at busybox.net
>
> Xtensa is not yet supported in libnspr. Also add dependencies to libnss,
> which requires libnspr, and ecryptfs-utils, which requires libnss.
>
> Signed-off-by: Chris Zankel <chris@zankel.net>
> ---
>   package/ecryptfs-utils/Config.in | 1 +
>   package/libnspr/Config.in        | 3 ++-
>   package/libnss/Config.in         | 1 +
>   3 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
> index 480aedd..514578c 100644
> --- a/package/ecryptfs-utils/Config.in
> +++ b/package/ecryptfs-utils/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
>   	depends on BR2_LARGEFILE # libnss
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
>   	depends on !BR2_arc # libnss -> libnspr
> +	depends on !BR2_xtensa # libnss -> libnspr
>   	help
>   	  eCryptfs is a POSIX-compliant enterprise cryptographic
>   	  filesystem for Linux. It is stacked on top of any other

  The comment needs to be updated as well.

  Oops, looks like the comment is missing for ecryptfs-utils...

> diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
> index 4ef3a51..0d5632f 100644
> --- a/package/libnspr/Config.in
> +++ b/package/libnspr/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBNSPR
>   	depends on BR2_LARGEFILE
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on !BR2_arc
> +	depends on !BR2_xtensa
>   	help
>   	  NSPR is the Netscape Portable Runtime library which provides
>   	  a platform-neutral API for system level and libc like
> @@ -12,5 +13,5 @@ config BR2_PACKAGE_LIBNSPR
>   	  http://www.mozilla.org/projects/nspr/
>
>   comment "libnspr needs a toolchain w/ largefile, threads"
> -	depends on !BR2_arc
> +	depends on !BR2_arc && !BR2_xtensa
>   	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libnss/Config.in b/package/libnss/Config.in
> index 88b1fde..2671998 100644
> --- a/package/libnss/Config.in
> +++ b/package/libnss/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBNSS
>   	depends on BR2_LARGEFILE
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
>   	depends on !BR2_arc # libnspr
> +	depends on !BR2_xtensa # libnspr
>   	help
>   	  Network Security Services (NSS) is a set of libraries designed
>   	  to support development of security-enabled client and server
>

  Here the comment really needs to be updated as well :-)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
