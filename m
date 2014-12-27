From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 18:07:56 +0100
Subject: [Buildroot] [PATCH 1/1] libvncserver: disable libva support
In-Reply-To: <1419699691-7765-1-git-send-email-bos@je-eigen-domein.nl>
References: <1419699691-7765-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20141227170756.GL4098@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2014-12-27 18:01 +0100, Floris Bos spake thusly:
> The libvncclient library (part of libvncserver) has optional support
> for HW accelerated H264 video playback using libva
> 
> However there are currently two problems with it:
> 
> 1) it only supports libva compiled with X11 support enabled, but it
>    does not verify that is the case, resulting in compile errors.
> 
> 2) it only supports the libva 1.0.x API, and not newer
>    libva versions, like 1.4.x we include with buildroot.
> 
>    https://github.com/LibVNC/libvncserver/issues/11
> 
> Disabling libva support for now.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libvncserver/libvncserver.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
> index ced6689..a8389b4 100644
> --- a/package/libvncserver/libvncserver.mk
> +++ b/package/libvncserver/libvncserver.mk
> @@ -17,6 +17,10 @@ LIBVNCSERVER_DEPENDENCIES = host-pkgconf
>  # tarball, so we need to generate them.
>  LIBVNCSERVER_AUTORECONF = YES
>  
> +# libvncserver does not get along with newer libva versions
> +# https://github.com/LibVNC/libvncserver/issues/11
> +LIBVNCSERVER_CONF_OPTS += --without-libva
> +
>  # only used for examples
>  LIBVNCSERVER_CONF_OPTS += --with-sdl-config=/bin/false
>  
> -- 
> 1.9.1
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
