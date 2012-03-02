From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Mar 2012 11:59:27 -0300
Subject: [Buildroot] [PATCH 1/3] packages: remove redundant AUTORECONF=NO
	declarations
Message-ID: <1330700369-15033-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/blackbox/blackbox.mk                       |    1 -
 package/docker/docker.mk                           |    1 -
 package/fbdump/fbdump.mk                           |    1 -
 package/fltk/fltk.mk                               |    4 ----
 package/gqview/gqview.mk                           |    1 -
 package/gvfs/gvfs.mk                               |    1 -
 package/iperf/iperf.mk                             |    3 ---
 package/ipkg/ipkg.mk                               |    1 -
 package/leafpad/leafpad.mk                         |    1 -
 package/libconfig/libconfig.mk                     |    1 -
 package/libconfuse/libconfuse.mk                   |    2 --
 package/libevent/libevent.mk                       |    2 --
 package/libsexy/libsexy.mk                         |    1 -
 package/mdadm/mdadm.mk                             |    3 ---
 package/multimedia/speex/speex.mk                  |    1 -
 package/netcat/netcat.mk                           |    1 -
 package/pcmanfm/pcmanfm.mk                         |    1 -
 package/rpm/rpm.mk                                 |    2 --
 package/samba/samba.mk                             |    3 ---
 .../startup-notification/startup-notification.mk   |    1 -
 package/torsmo/torsmo.mk                           |    1 -
 package/xvkbd/xvkbd.mk                             |    1 -
 22 files changed, 0 insertions(+), 34 deletions(-)

diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index 6836c96..8e8ebc9 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -7,7 +7,6 @@
 BLACKBOX_VERSION:=0.70.1
 BLACKBOX_SOURCE:=blackbox-$(BLACKBOX_VERSION).tar.bz2
 BLACKBOX_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/blackboxwm/
-BLACKBOX_AUTORECONF:=NO
 BLACKBOX_INSTALL_STAGING:=NO
 BLACKBOX_INSTALL_TARGET:=YES
 
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 59282a2..0e9eeaa 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -6,7 +6,6 @@
 DOCKER_VERSION = 1.5
 DOCKER_SOURCE = docker-$(DOCKER_VERSION).tar.gz
 DOCKER_SITE = http://icculus.org/openbox/2/docker
-DOCKER_AUTORECONF = NO
 DOCKER_INSTALL_STAGING = NO
 DOCKER_INSTALL_TARGET = YES
 
diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index 8a5a44e..eca432e 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -6,7 +6,6 @@
 FBDUMP_VERSION:=0.4.2
 FBDUMP_SOURCE:=fbdump-$(FBDUMP_VERSION).tar.gz
 FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
-FBDUMP_AUTORECONF = NO
 
 $(eval $(call AUTOTARGETS))
 
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 164c518..ea2bef0 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -7,15 +7,11 @@
 FLTK_VERSION = 1.1.7
 FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.bz2
 FLTK_SITE = http://ftp.easysw.com/pub/fltk/1.1.7/
-FLTK_AUTORECONF = NO
 FLTK_INSTALL_STAGING = YES
 FLTK_INSTALL_TARGET = YES
-
 FLTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
-
 FLTK_CONF_OPT = --enable-threads --with-x
-
 FLTK_DEPENDENCIES = xserver_xorg-server xlib_libXt
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index 25d9739..5695bf7 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -6,7 +6,6 @@
 GQVIEW_VERSION = 2.1.5
 GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
-GQVIEW_AUTORECONF = NO
 GQVIEW_INSTALL_STAGING = NO
 GQVIEW_INSTALL_TARGET = YES
 
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index b33b7e5..05a54a3 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -10,7 +10,6 @@ GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.gz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
 GVFS_INSTALL_TARGET = YES
-GVFS_AUTORECONF = NO
 GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus shared-mime-info
 
 GVFS_CONF_OPT = \
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index b774cc3..50cb315 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -6,9 +6,6 @@
 IPERF_VERSION = 2.0.5
 IPERF_SOURCE = iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
-
-IPERF_AUTORECONF = NO
-
 IPERF_INSTALL_STAGING = NO
 IPERF_INSTALL_TARGET = YES
 
diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index 64dd0d5..6d5ff5d 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -7,7 +7,6 @@
 IPKG_VERSION = 0.99.163
 IPKG_SOURCE = ipkg-$(IPKG_VERSION).tar.gz
 IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
-IPKG_AUTORECONF = NO
 IPKG_INSTALL_STAGING = YES
 IPKG_INSTALL_TARGET = YES
 
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index e855b03..9f5b0b7 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -6,7 +6,6 @@
 LEAFPAD_VERSION = 0.8.18
 LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
-LEAFPAD_AUTORECONF = NO
 LEAFPAD_INSTALL_STAGING = NO
 LEAFPAD_INSTALL_TARGET = YES
 
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 28b3d5f..38e9a59 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -6,7 +6,6 @@
 LIBCONFIG_VERSION:=1.4.6
 LIBCONFIG_SOURCE:=libconfig-$(LIBCONFIG_VERSION).tar.gz
 LIBCONFIG_SITE:=http://www.hyperrealm.com/libconfig/
-LIBCONFIG_AUTORECONF:=NO
 LIBCONFIG_INSTALL_STAGING:=YES
 LIBCONFIG_INSTALL_TARGET:=YES
 
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index ea10d6e..feababf 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -6,9 +6,7 @@
 LIBCONFUSE_VERSION = 2.7
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.gz
 LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
-LIBCONFUSE_AUTORECONF = NO
 LIBCONFUSE_INSTALL_STAGING = YES
-
 LIBCONFUSE_CONF_OPT = --disable-rpath
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 76fb627..73ad2b0 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -6,8 +6,6 @@
 LIBEVENT_VERSION = 2.0.14
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
-
-LIBEVENT_AUTORECONF = NO
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_INSTALL_TARGET = YES
 
diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
index aca4f7f..9f33d29 100644
--- a/package/libsexy/libsexy.mk
+++ b/package/libsexy/libsexy.mk
@@ -7,7 +7,6 @@
 LIBSEXY_VERSION = 0.1.11
 LIBSEXY_SOURCE = libsexy-$(LIBSEXY_VERSION).tar.gz
 LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy/
-LIBSEXY_AUTORECONF = NO
 LIBSEXY_DEPENDENCIES = libgtk2 libxml2
 LIBSEXY_INSTALL_TARGET = YES
 LIBSEXY_INSTALL_STAGING = YES
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 087a2d2..581984a 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -6,9 +6,6 @@
 MDADM_VERSION:=2.6.9
 MDADM_SOURCE:=mdadm-$(MDADM_VERSION).tar.bz2
 MDADM_SITE:=http://www.kernel.org/pub/linux/utils/raid/mdadm
-
-MDADM_AUTORECONF = NO
-
 MDADM_INSTALL_STAGING = NO
 MDADM_INSTALL_TARGET = YES
 
diff --git a/package/multimedia/speex/speex.mk b/package/multimedia/speex/speex.mk
index dfb426b..0aca871 100644
--- a/package/multimedia/speex/speex.mk
+++ b/package/multimedia/speex/speex.mk
@@ -6,7 +6,6 @@
 SPEEX_VERSION=1.2rc1
 SPEEX_SOURCE=speex-$(SPEEX_VERSION).tar.gz
 SPEEX_SITE=http://downloads.us.xiph.org/releases/speex
-SPEEX_AUTORECONF = NO
 SPEEX_INSTALL_STAGING = YES
 SPEEX_INSTALL_TARGET = YES
 SPEEX_DEPENDENCIES = libogg
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index dfd0b5a..8342622 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -7,7 +7,6 @@
 NETCAT_VERSION:=0.7.1
 NETCAT_SOURCE:=netcat-$(NETCAT_VERSION).tar.gz
 NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netcat
-NETCAT_AUTORECONF:=NO
 NETCAT_INSTALL_STAGING:=NO
 NETCAT_INSTALL_TARGET:=YES
 
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 72c2369..ba0da46 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -6,7 +6,6 @@
 PCMANFM_VERSION = 0.3.5.9
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
 PCMANFM_SITE = http://internap.dl.sourceforge.net/sourceforge/pcmanfm
-PCMANFM_AUTORECONF = NO
 PCMANFM_INSTALL_STAGING = NO
 PCMANFM_INSTALL_TARGET = YES
 
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 4d8fe21..9f42ee1 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -5,8 +5,6 @@
 #############################################################
 RPM_VERSION = 5.2.0
 RPM_SITE = http://rpm5.org/files/rpm/rpm-5.2/
-RPM_AUTORECONF = NO
-
 RPM_DEPENDENCIES = zlib beecrypt neon popt
 
 RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 4e02682..5887065 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -6,10 +6,7 @@
 
 SAMBA_VERSION = 3.5.12
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
-
 SAMBA_SUBDIR = source3
-SAMBA_AUTORECONF = NO
-
 SAMBA_INSTALL_STAGING = YES
 SAMBA_INSTALL_TARGET = YES
 
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index bebb8e9..cbcaad3 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -6,7 +6,6 @@
 STARTUP_NOTIFICATION_VERSION = 0.9
 STARTUP_NOTIFICATION_SOURCE = startup-notification-$(STARTUP_NOTIFICATION_VERSION).tar.gz
 STARTUP_NOTIFICATION_SITE = http://freedesktop.org/software/startup-notification/releases
-STARTUP_NOTIFICATION_AUTORECONF = NO
 STARTUP_NOTIFICATION_INSTALL_STAGING = YES
 STARTUP_NOTIFICATION_INSTALL_TARGET = YES
 STARTUP_NOTIFICATION_DEPENDENCIES = xlib_libX11
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index f81ce51..7cce110 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -6,7 +6,6 @@
 TORSMO_VERSION = 0.18
 TORSMO_SOURCE = torsmo-$(TORSMO_VERSION).tar.gz
 TORSMO_SITE = http://avr32linux.org/twiki/pub/Main/Torsmo
-TORSMO_AUTORECONF = NO
 TORSMO_INSTALL_STAGING = NO
 TORSMO_INSTALL_TARGET = YES
 
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 9d7d506..cdc8dde 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -6,7 +6,6 @@
 XVKBD_VERSION = 3.2
 XVKBD_SOURCE = xvkbd-$(XVKBD_VERSION).tar.gz
 XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
-XVKBD_AUTORECONF = NO
 XVKBD_INSTALL_STAGING = NO
 XVKBD_INSTALL_TARGET = YES
 
-- 
1.7.3.4
