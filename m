From: Julius Kriukas <julius@kriukas.lt>
Date: Tue, 5 Dec 2017 01:47:34 +0200
Subject: [Buildroot] [PATCH] package/omxplayer: add missing dependency
 to alsa-lib
In-Reply-To: <20171204213103.26812-1-yann.morin.1998@free.fr>
References: <20171204213103.26812-1-yann.morin.1998@free.fr>
Message-ID: <59c4810b-e549-22f6-4df4-5b0de7bdd818@kriukas.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/2017 11:31 PM, Yann E. MORIN wrote:
> Since the bump in 58a00a13 (omxplayer: bump to version 2ee17b2),
> omxplayer gained a dependency to alsa-lib.
> 
> Fixes:
>      http://autobuild.buildroot.org/results/652/65212c59a37398681b341263bd76ba8a65ff7828/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Julius Kriukas <julius@kriukas.lt>
> ---
>   package/omxplayer/Config.in    | 3 ++-
>   package/omxplayer/omxplayer.mk | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/omxplayer/Config.in b/package/omxplayer/Config.in
> index b417aa3b0b..bdb3f4054d 100644
> --- a/package/omxplayer/Config.in
> +++ b/package/omxplayer/Config.in
> @@ -4,9 +4,10 @@ config BR2_PACKAGE_OMXPLAYER
>   	depends on BR2_USE_MMU # dbus
>   	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # ffmpeg
>   	depends on BR2_INSTALL_LIBSTDCPP # boost
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libusb
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, boost, libusb
>   	depends on BR2_USE_WCHAR # boost
>   	depends on BR2_PACKAGE_RPI_USERLAND
> +	select BR2_PACKAGE_ALSA_LIB
>   	select BR2_PACKAGE_BOOST
>   	select BR2_PACKAGE_DBUS
>   	select BR2_PACKAGE_FFMPEG
> diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
> index 6e92250438..6999269161 100644
> --- a/package/omxplayer/omxplayer.mk
> +++ b/package/omxplayer/omxplayer.mk
> @@ -10,7 +10,7 @@ OMXPLAYER_LICENSE = GPL-2.0+
>   OMXPLAYER_LICENSE_FILES = COPYING
>   
>   OMXPLAYER_DEPENDENCIES = \
> -	host-pkgconf boost dbus ffmpeg freetype libidn libusb pcre \
> +	host-pkgconf alsa-lib boost dbus ffmpeg freetype libidn libusb pcre \
>   	rpi-userland zlib
>   
>   OMXPLAYER_EXTRA_CFLAGS = \
> 

Hi Yann,

It seems my patch arrived a bit too late. I waited for my local machine 
to confirm this test no longer fails and have not noticed you fixed this 
issue as well. Please ignore my patch.

-- 
Julius Kriukas
