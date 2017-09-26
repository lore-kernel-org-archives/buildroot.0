From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:02:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
 glamor support needs egl
In-Reply-To: <20170923113018.20562-1-bernd.kuhls@t-online.de>
References: <20170923113018.20562-1-bernd.kuhls@t-online.de>
Message-ID: <09ed1866-1277-03ee-f891-4b54465e10da@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-09-17 13:30, Bernd Kuhls wrote:
> Glamor support in xserver_xorg-server depends on gbm:
> https://cgit.freedesktop.org/xorg/xserver/tree/configure.ac#n2100
> 
> Gbm is provided by mesa3d only if egl is enabled:
> https://git.buildroot.net/buildroot/tree/package/mesa3d/mesa3d.mk#n167
> 
> This patch adds libegl as additional prerequisite for enabling glamor
> support in xserver_xorg-server.
> 
> Fixes
> http://autobuild.buildroot.net/results/04d/04d93745d63fcfbea070c0126862b49f1b6f473e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 12c3ed06c1..45a2c81f2b 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -223,7 +223,7 @@ endif
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_XPROTO_DRI3PROTO),yy)
>  XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
>  XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
> -ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yy)
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
>  XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
>  XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
>  else
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
