From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 04 Feb 2015 09:04:01 +0100
Subject: [Buildroot] [PATCH 05/21] gst1-plugins-base: add missing
 indirect dependency on atomics for pango
In-Reply-To: <1423010059-23446-6-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
 <1423010059-23446-6-git-send-email-arnout@mind.be>
Message-ID: <54D1D271.1050307@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

> Also removed the redundant indirect dependencies on wchar, threads, mmu
> (gstreamer depends on libglib2 so this indirect dependency is obvious).
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>   package/gstreamer1/gst1-plugins-base/Config.in | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
> index 3b487c5..90c00b1 100644
> --- a/package/gstreamer1/gst1-plugins-base/Config.in
> +++ b/package/gstreamer1/gst1-plugins-base/Config.in
> @@ -128,17 +128,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG
>   
>   config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
>   	bool "pango font renderer"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_USE_WCHAR # pango -> libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
> -	depends on BR2_USE_MMU # pango -> libglib2
> +	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
> +	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
>   	select BR2_PACKAGE_PANGO
>   	help
>   	  Pango-based text rendering and overlay
>   
>   comment "pango plugin needs a toolchain w/ C++, wchar, threads"

Same here

comment "pango plugin needs a toolchain w/ C++"

Regards,
Jerzy

> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_ARCH_HAS_ATOMICS
>   
>   config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
>   	bool "theora (*.ogg video)"
