From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jun 2012 15:23:51 +0200
Subject: [Buildroot] [PATCH] gstreamer: add xorg support
In-Reply-To: <1338726592-3168-1-git-send-email-spdawson@gmail.com>
References: <1338726592-3168-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120603152351.2faa4341@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun,  3 Jun 2012 13:29:52 +0100,
spdawson at gmail.com a ?crit :

> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +GST_PLUGINS_BASE_DEPENDENCIES += xserver_xorg-server
> +GST_PLUGINS_BASE_CONF_OPT += \
> +	--enable-x \
> +	--enable-xshm \
> +	--enable-xvideo
> +else
> +GST_PLUGINS_BASE_CONF_OPT += \
> +	--disable-x \
> +	--disable-xshm \
> +	--disable-xvideo
> +endif

Are you sure that the dependency is on xserver_xorg-server? I would
rather suspect that the real dependency is on a certain set of X11
client libraries (libX11 for the core protocol, libXv fdor the Xvideo
extension, etc.).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
