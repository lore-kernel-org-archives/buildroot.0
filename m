From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 17:20:50 +0200
Subject: [Buildroot] [PATCH] libnspr: Add dependency on !BR2_arc
In-Reply-To: <1375283672-1453-1-git-send-email-mjonker@synopsys.com>
References: <1375283672-1453-1-git-send-email-mjonker@synopsys.com>
Message-ID: <20130731172050.69abca4b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Wed, 31 Jul 2013 17:14:32 +0200, Mischa Jonker wrote:
> ARC is not supported yet in libnspr.
> 
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> ---
>  package/libnspr/Config.in |    1 +
>  package/libnss/Config.in  |    1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
> index f87b10c..ee7902b 100644
> --- a/package/libnspr/Config.in
> +++ b/package/libnspr/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBNSPR
>  	bool "libnspr"
>  	depends on BR2_LARGEFILE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_arc
>  	help
>  	  NSPR is the Netscape Portable Runtime library which provides
>  	  a platform-neutral API for system level and libc like
> diff --git a/package/libnss/Config.in b/package/libnss/Config.in
> index e8eec77..b5f3a01 100644
> --- a/package/libnss/Config.in
> +++ b/package/libnss/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBNSS
>  	select BR2_PACKAGE_ZLIB
>  	depends on BR2_LARGEFILE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
> +	depends on !BR2_arc # libnspr

This needs to be propagated to ecryptfs-utils I believe.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
