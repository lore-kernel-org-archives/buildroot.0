From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2015 07:57:37 +0200
Subject: [Buildroot] [PATCH 1/3 v2] package/xserver: commonalise
 dependency on libdrm
In-Reply-To: <de75aa7f5d075edcaa2c25e4d021bd5b105e2bb1.1438297123.git.yann.morin.1998@free.fr>
References: <cover.1438297123.git.yann.morin.1998@free.fr>
 <de75aa7f5d075edcaa2c25e4d021bd5b105e2bb1.1438297123.git.yann.morin.1998@free.fr>
Message-ID: <20150731075737.01ad8236@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 31 Jul 2015 00:59:05 +0200, Yann E. MORIN wrote:

>  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
> -XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-libdrm --enable-glx
> -XSERVER_XORG_SERVER_DEPENDENCIES += libdrm mesa3d xproto_xf86driproto
> +XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
> +XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
> +XSERVER_XORG_SERVER_NEEDS_LIBDRM = y

Hum, didn't we say that this should be a hidden Config.in boolean?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
