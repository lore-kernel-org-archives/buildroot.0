From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Oct 2014 19:56:03 +0200
Subject: [Buildroot] [PATCH] libva-intel-driver: add indirect dependency
	on BR2_PREFER_STATIC_LIB
References: <1413135701-588-1-git-send-email-arnout@mind.be>
Message-ID: <XnsA3C4CAC83F6A6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Arnout Vandecappelle (Essensium/Mind)" <arnout-
agwphqFHkxc@public.gmane.org> wrote in news:1413135701-588-1-git-send-
email-arnout at mind.be:

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout-
agwphqFHkxc@public.gmane.org>
> ---
>  package/libva-intel-driver/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-
driver/Config.in
> index 89a3264..16e7ced 100644
> --- a/package/libva-intel-driver/Config.in
> +++ b/package/libva-intel-driver/Config.in
> @@ -9,11 +9,13 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
>       depends on BR2_i386 || BR2_x86_64
>       depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
>       depends on BR2_LARGEFILE # libdrm
> +        depends on !BR2_PREFER_STATIC_LIB # libva
>       help
>         VA-API back-end driver for Intel graphics chips
>  
>         https://01.org/linuxgraphics/community/vaapi
>  
> -comment "libva intel driver needs a toolchain w/ largefile, threads"
> -     depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
> +comment "libva intel driver needs a toolchain w/ largefile, threads, 
dynamic library"
> +     depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
> +          BR2_PREFER_STATIC_LIB
>       depends on BR2_i386 || BR2_x86_64

Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
