From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 00:37:54 +0200
Subject: [Buildroot] [RFC/PATCH v3 07/11] package/kodi: Enable install
 to STAGING_DIR, needed for audioencoder addons
In-Reply-To: <1413661503-5382-8-git-send-email-bernd.kuhls@t-online.de>
References: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
 <1413661503-5382-8-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141018223754.GA14899@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-18 21:44 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/kodi.mk |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index fc24c4d..57baeed 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -9,6 +9,8 @@ KODI_SOURCE = $(KODI_VERSION).tar.gz
>  KODI_SITE = https://github.com/xbmc/xbmc/archive
>  KODI_LICENSE = GPLv2
>  KODI_LICENSE_FILES = LICENSE.GPL
> +# needed for audioencoder addons
> +KODI_INSTALL_STAGING = YES

I'm not sure I understand why you need Kodi in staging.

In this patch, you state that audioencoder addons need it at build time,
but in each such audioencoder addons, you state the dependency is only a
runtime dependency.

Care to expand a bit on this, please?

Regards,
Yann E. MORIN.

>  # Kodi needs host-sdl_image (and therefore host-sdl) for a host tools it builds
>  # called TexturePacker. It is responsible to take all the images used in the
>  # GUI and pack them in a blob.
> -- 
> 1.7.10.4
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
