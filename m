From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 May 2014 12:08:43 +0200
Subject: [Buildroot] [PATCH v2 23/24] vlc: add opencv support
In-Reply-To: <1398208556-4195-24-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-24-git-send-email-s.martin49@gmail.com>
Message-ID: <20140504100843.GJ3211@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> Add OpenCV support for video filter in vlc.
> 
> vlc source code still includes the headers from the deprecated OpenCV
> API.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v1 -> v2:
> - new patch
> ---
>  package/vlc/Config.in | 1 +
>  package/vlc/vlc.mk    | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/vlc/Config.in b/package/vlc/Config.in
> index cdb0d16..ede9269 100644
> --- a/package/vlc/Config.in
> +++ b/package/vlc/Config.in
> @@ -11,6 +11,7 @@ config BR2_PACKAGE_VLC
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
> +	select BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS if BR2_PACKAGE_OPENCV
>  	help
>  	  VLC is a free and open source cross-platform multimedia player
>  	  and framework that plays most multimedia files as well as DVD,
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index e14c9c3..6e0f61d 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -125,6 +125,13 @@ else
>  VLC_CONF_OPT += --disable-glx
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENCV),y)
> +VCL_CONF_OPT += --with-opencv
> +VLC_DEPENDENCIES += opencv
> +else
> +VLC_CONF_OPT += --without-opencv
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPUS),y)
>  VLC_CONF_OPT += --enable-opus
>  VLC_DEPENDENCIES += libvorbis opus
> -- 
> 1.9.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
