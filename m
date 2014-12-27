From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 11:13:35 +0100
Subject: [Buildroot] [PATCH 1/4] libxkbcommon: bump to version 0.5.0
In-Reply-To: <1419595603-15591-1-git-send-email-fatih.asici@gmail.com>
References: <1419595603-15591-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <20141227101335.GA4098@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fatih, All,

On 2014-12-26 14:06 +0200, Fatih A??c? spake thusly:
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  package/libxkbcommon/libxkbcommon.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
> index 3bfe764..2d30506 100644
> --- a/package/libxkbcommon/libxkbcommon.mk
> +++ b/package/libxkbcommon/libxkbcommon.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBXKBCOMMON_VERSION = 0.3.0
> +LIBXKBCOMMON_VERSION = 0.5.0

This is causing a lot of autobuild failures:
    http://autobuild.buildroot.org/?reason=libxkbcommon-0.5.0

    checking for XCB_XKB... no
    configure: error: xkbcommon-x11 requires xcb-xkb >= 1.10 which was not
    found. You can disable X11 support with --disable-x11.

I guess what we want is to use --disable-x11 when we do not have x11
enabled, and if it is enabled, select the required package(s).

Care to have a look, please?

Regards,
Yann E. MORIN.

>  LIBXKBCOMMON_SITE = http://xkbcommon.org/download
>  LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
>  LIBXKBCOMMON_LICENSE = MIT/X11
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
