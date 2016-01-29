From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Fri, 29 Jan 2016 19:34:42 +0100
Subject: [Buildroot] [PATCH v2 15/17] openal: add missing
 BR2_TOOLCHAIN_HAS_SYNC_4 dependency
In-Reply-To: <1453934861-26364-16-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453934861-26364-16-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56ABB0C2.9070203@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Isn't openal looking for the atomic functions and not for the sync ones?
As seen in the URL you provided:

libopenal.so.1.17.1: undefined reference to `__atomic_fetch_sub_4'
libopenal.so.1.17.1: undefined reference to `__atomic_compare_exchange_4'
libopenal.so.1.17.1: undefined reference to `__atomic_fetch_add_4'


Am 27.01.2016 um 23:47 schrieb Thomas Petazzoni:
> Fixes:
> 
>   http://autobuild.buildroot.org/results/314fb8da3ca87984e9240d67ff233e2f999ae89e/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 2 ++
>  package/openal/Config.in                      | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index f02be34..0dc217e 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -566,9 +566,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL
>  	bool "openal"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	select BR2_PACKAGE_OPENAL
>  
>  comment "openal plugin needs a toolchain w/ NPTL, C++"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
>  		|| !BR2_INSTALL_LIBSTDCPP
>  
> diff --git a/package/openal/Config.in b/package/openal/Config.in
> index 4a73f45..b497e26 100644
> --- a/package/openal/Config.in
> +++ b/package/openal/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENAL
>  	bool "openal"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	help
>  	  OpenAL provides capabilities for playing audio in a virtual
>  	  3D environment. Distance attenuation, doppler shift, and
> @@ -11,5 +12,6 @@ config BR2_PACKAGE_OPENAL
>  	  http://kcat.strangesoft.net/openal.html
>  
>  comment "openal needs a toolchain w/ NPTL, C++"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
>  		|| !BR2_INSTALL_LIBSTDCPP
> 
