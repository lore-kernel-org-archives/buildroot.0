From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Oct 2015 22:59:37 +0200
Subject: [Buildroot] [PATCH] mplayer: needs zlib
In-Reply-To: <1444730313-34190-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444730313-34190-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151013205937.GC4161@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-10-13 10:58 +0100, Vicente Olivert Riera spake thusly:
> Otherwise it will fail to compile with an error message like this one:
> 
> libavcodec/pngdec.c:35:18: fatal error: zlib.h: No such file or
> directory
>  #include <zlib.h>
>                   ^
> compilation terminated.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mplayer/Config.in  |    1 +
>  package/mplayer/mplayer.mk |    2 +-
>  2 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
> index 7a8b03f..80ad7f1 100644
> --- a/package/mplayer/Config.in
> +++ b/package/mplayer/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
>  		|| BR2_microblaze || BR2_nios2)
>  	# Broken support for <ARMv5
>  	depends on !BR2_ARM_CPU_ARMV4
> +	select BR2_PACKAGE_ZLIB
>  
>  config BR2_PACKAGE_MPLAYER
>  	bool "mplayer"
> diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
> index d896b35..0f5ced5 100644
> --- a/package/mplayer/mplayer.mk
> +++ b/package/mplayer/mplayer.mk
> @@ -7,7 +7,7 @@
>  MPLAYER_VERSION = 1.2
>  MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
>  MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
> -MPLAYER_DEPENDENCIES = host-pkgconf
> +MPLAYER_DEPENDENCIES = host-pkgconf zlib
>  MPLAYER_LICENSE = GPLv2
>  MPLAYER_LICENSE_FILES = LICENSE Copyright
>  MPLAYER_CFLAGS = $(TARGET_CFLAGS)
> -- 
> 1.7.1
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
