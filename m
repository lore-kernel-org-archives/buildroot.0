From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Dec 2017 18:17:55 +0100
Subject: [Buildroot] [PATCH 1/1] omxplayer: add missing dependency on
 alsa-lib
In-Reply-To: <20171204233035.2183-1-julius@kriukas.lt>
References: <20171204233035.2183-1-julius@kriukas.lt>
Message-ID: <20171205171755.GA3993@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-12-05 01:30 +0200, Julius Kriukas spake thusly:
> Omxplayer depends on alsa-lib. This patch fixes:
> 
> http://autobuild.buildroot.net/results/652/65212c59a37398681b341263bd76ba8a65ff7828
> 
> Signed-off-by: Julius Kriukas <julius@kriukas.lt>

We sent about the same patch at about the same time, so I would not care
which is applied.

Yet, as you may have noticed, my patch also fixes the comment-dependency
on threads, so I believe mine is a little bit better in that respect.

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/omxplayer/Config.in    | 1 +
>  package/omxplayer/omxplayer.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/omxplayer/Config.in b/package/omxplayer/Config.in
> index b417aa3b0b..67367cf123 100644
> --- a/package/omxplayer/Config.in
> +++ b/package/omxplayer/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_OMXPLAYER
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libusb
>  	depends on BR2_USE_WCHAR # boost
>  	depends on BR2_PACKAGE_RPI_USERLAND
> +	select BR2_PACKAGE_ALSA_LIB
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_FFMPEG
> diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
> index 6e92250438..6999269161 100644
> --- a/package/omxplayer/omxplayer.mk
> +++ b/package/omxplayer/omxplayer.mk
> @@ -10,7 +10,7 @@ OMXPLAYER_LICENSE = GPL-2.0+
>  OMXPLAYER_LICENSE_FILES = COPYING
>  
>  OMXPLAYER_DEPENDENCIES = \
> -	host-pkgconf boost dbus ffmpeg freetype libidn libusb pcre \
> +	host-pkgconf alsa-lib boost dbus ffmpeg freetype libidn libusb pcre \
>  	rpi-userland zlib
>  
>  OMXPLAYER_EXTRA_CFLAGS = \
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
