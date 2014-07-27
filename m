From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Jul 2014 13:38:54 +0200
Subject: [Buildroot] [PATCH 20/20 v3] package/xserver_xorg-server: needs
	libudev, not a udev daemon
References: <cover.1405777634.git.yann.morin.1998@free.fr>
 <7964be0c75358121baa69301d23eb93d72a64db9.1405777634.git.yann.morin.1998@free.fr>
 <XnsA3777C2F4BB23berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <XnsA3778AD689B30berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:XnsA3777C2F4BB23berndkuhlsPkbjNfxxIA at bernd-kuhls.de:

> Luckily enough xserver_xorg-server does not depend on udev/hal, configure 
> just prints:
> 
> configure: WARNING:
>              ***********************************************
>              Neither HAL nor udev backend will be enabled.
>              Input device hotplugging will not be available!
>              ***********************************************
> 
> which is fine for me, everything works good without udev/hal ;)

Hi,

a small, but important addition: To avoid xserver_xorg-server picking up 
libudev when the udev daemon is disabled this patch is needed for 
xserver_xorg-server.mk:

@@ -134,6 +134,7 @@
 XSERVER_XORG_SERVER_CONF_OPT += --disable-config-udev-kms
 endif
 else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-config-udev
 ifeq ($(BR2_PACKAGE_DBUS),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += dbus
 XSERVER_XORG_SERVER_CONF_OPT += --enable-config-dbus

Regards, Bernd
