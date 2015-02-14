From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 15:49:11 +0100
Subject: [Buildroot] [PATCH 35/35] package/x11r7/xserver_xorg-server:
 bump version to 1.17.0
In-Reply-To: <1423339908-2960-35-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
 <1423339908-2960-35-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150214154911.21eafa7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  7 Feb 2015 21:11:48 +0100, Bernd Kuhls wrote:
> - remove patches, all were applied upstream
> - add support for libglamor, needed by package/x11r7/xdriver_xf86-video-ati

So, just for one driver.

> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
> +XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
> +XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
> +endif

But it gets enabled essentially for all drivers. Also, I don't quite
understand the relationship between EGL availability and the ATI driver
in X.org. Isn't EGL the thing to create OpenGL contexts specifically in
the absence of a X.org server?

I applied the patch nonetheless, so please send any fix as a follow-up
patch based on the next branch, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
