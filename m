From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 10:17:14 +0200
Subject: [Buildroot] [PATCH 24/67] libglade: libglib2 requires threads
In-Reply-To: <1373917670-30006-25-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
 <1373917670-30006-25-git-send-email-spenser@gillilanding.com>
Message-ID: <20130716101714.14b36fb4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Mon, 15 Jul 2013 14:47:07 -0500, Spenser Gilliland wrote:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/libglade/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libglade/Config.in b/package/libglade/Config.in
> index f7a9a1c..d042517 100644
> --- a/package/libglade/Config.in
> +++ b/package/libglade/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBGLADE
>  	bool "libglade"
>  	depends on BR2_PACKAGE_LIBGTK2
>  	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_ATK
>  	select BR2_PACKAGE_LIBXML2
> @@ -12,5 +13,6 @@ config BR2_PACKAGE_LIBGLADE
>  
>  	  http://ftp.gnome.org/pub/GNOME/sources/libglade/
>  
> -comment "libglade requires a toolchain with WCHAR support"
> -	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR
> +comment "libglade requires a toolchain with WCHAR and threading support"
> +	depends on BR2_PACKAGE_LIBGTK2 && \
> +		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)

I also believe this one is not needed, because there is already a
"depends on BR2_PACKAGE_LIBGTK2".

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
