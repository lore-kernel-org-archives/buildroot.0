From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 22:27:37 +0100
Subject: [Buildroot] [git commit] packages: remove redundant
	INSTALL_STAGING=NO declarations
Message-ID: <20120311213936.B832C90D42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0f84dfde55fda967ca77d66e5db7948dea43764
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/at/at.mk                                   |    2 --
 package/blackbox/blackbox.mk                       |    1 -
 package/crosstool-ng/crosstool-ng.mk               |    1 -
 package/docker/docker.mk                           |    1 -
 package/games/rubix/rubix.mk                       |    1 -
 package/gqview/gqview.mk                           |    1 -
 package/iperf/iperf.mk                             |    1 -
 package/leafpad/leafpad.mk                         |    1 -
 package/mdadm/mdadm.mk                             |    1 -
 package/netcat/netcat.mk                           |    1 -
 package/pcmanfm/pcmanfm.mk                         |    3 ---
 package/torsmo/torsmo.mk                           |    1 -
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 --
 package/x11vnc/x11vnc.mk                           |    1 -
 package/xvkbd/xvkbd.mk                             |    1 -
 15 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index 4270c83..92fb838 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -9,9 +9,7 @@ AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
 # missing deps for parsetime.l
 AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
-AT_INSTALL_STAGING = NO
 AT_INSTALL_TARGET = YES
-
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex)
 
 AT_CONF_OPT = \
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index 8e8ebc9..fd75255 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -7,7 +7,6 @@
 BLACKBOX_VERSION:=0.70.1
 BLACKBOX_SOURCE:=blackbox-$(BLACKBOX_VERSION).tar.bz2
 BLACKBOX_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/blackboxwm/
-BLACKBOX_INSTALL_STAGING:=NO
 BLACKBOX_INSTALL_TARGET:=YES
 
 BLACKBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index a2069a9..217b2f5 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,7 +1,6 @@
 CROSSTOOL_NG_VERSION           = 1.13.4
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
-CROSSTOOL_NG_INSTALL_STAGING   = NO
 CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
 HOST_CROSSTOOL_NG_DEPENDENCIES = $(if $(BR2_CCACHE),host-ccache) host-gawk host-automake
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 0e9eeaa..ce25e4d 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -6,7 +6,6 @@
 DOCKER_VERSION = 1.5
 DOCKER_SOURCE = docker-$(DOCKER_VERSION).tar.gz
 DOCKER_SITE = http://icculus.org/openbox/2/docker
-DOCKER_INSTALL_STAGING = NO
 DOCKER_INSTALL_TARGET = YES
 
 DOCKER_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
diff --git a/package/games/rubix/rubix.mk b/package/games/rubix/rubix.mk
index 2fb051a..5248b9e 100644
--- a/package/games/rubix/rubix.mk
+++ b/package/games/rubix/rubix.mk
@@ -6,7 +6,6 @@
 RUBIX_VERSION = 1.0.5
 RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
 RUBIX_SITE = http://avr32linux.org/twiki/pub/Main/Rubix
-RUBIX_INSTALL_STAGING = NO
 RUBIX_INSTALL_TARGET = YES
 RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
 
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index 5695bf7..a86d895 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -6,7 +6,6 @@
 GQVIEW_VERSION = 2.1.5
 GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
-GQVIEW_INSTALL_STAGING = NO
 GQVIEW_INSTALL_TARGET = YES
 
 GQVIEW_DEPENDENCIES = host-pkg-config libgtk2
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 50cb315..7f6b1b8 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -6,7 +6,6 @@
 IPERF_VERSION = 2.0.5
 IPERF_SOURCE = iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
-IPERF_INSTALL_STAGING = NO
 IPERF_INSTALL_TARGET = YES
 
 IPERF_CONF_ENV = \
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index 9f5b0b7..56c25df 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -6,7 +6,6 @@
 LEAFPAD_VERSION = 0.8.18
 LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
-LEAFPAD_INSTALL_STAGING = NO
 LEAFPAD_INSTALL_TARGET = YES
 
 LEAFPAD_DEPENDENCIES = libgtk2
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 581984a..4d8e1af 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -6,7 +6,6 @@
 MDADM_VERSION:=2.6.9
 MDADM_SOURCE:=mdadm-$(MDADM_VERSION).tar.bz2
 MDADM_SITE:=http://www.kernel.org/pub/linux/utils/raid/mdadm
-MDADM_INSTALL_STAGING = NO
 MDADM_INSTALL_TARGET = YES
 
 MDADM_MAKE_OPT = \
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 8342622..a668e9a 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -7,7 +7,6 @@
 NETCAT_VERSION:=0.7.1
 NETCAT_SOURCE:=netcat-$(NETCAT_VERSION).tar.gz
 NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netcat
-NETCAT_INSTALL_STAGING:=NO
 NETCAT_INSTALL_TARGET:=YES
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index ba0da46..d1d3377 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -6,11 +6,8 @@
 PCMANFM_VERSION = 0.3.5.9
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
 PCMANFM_SITE = http://internap.dl.sourceforge.net/sourceforge/pcmanfm
-PCMANFM_INSTALL_STAGING = NO
 PCMANFM_INSTALL_TARGET = YES
-
 PCMANFM_CONF_OPT = --disable-hal
-
 PCMANFM_DEPENDENCIES = host-pkg-config libgtk2 gamin startup-notification xserver_xorg-server
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index 7cce110..fb97639 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -6,7 +6,6 @@
 TORSMO_VERSION = 0.18
 TORSMO_SOURCE = torsmo-$(TORSMO_VERSION).tar.gz
 TORSMO_SITE = http://avr32linux.org/twiki/pub/Main/Torsmo
-TORSMO_INSTALL_STAGING = NO
 TORSMO_INSTALL_TARGET = YES
 
 # help2man doesn't work when cross compiling
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 61cd9fc..fd3f02d 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -6,10 +6,8 @@
 XKEYBOARD_CONFIG_VERSION = 2.0
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
-XKEYBOARD_CONFIG_INSTALL_STAGING = NO
 XKEYBOARD_CONFIG_INSTALL_TARGET = YES
 XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
-
 XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index b423f46..0fc885c 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -6,7 +6,6 @@
 X11VNC_VERSION = 0.9.3
 X11VNC_SOURCE = x11vnc-$(X11VNC_VERSION).tar.gz
 X11VNC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libvncserver
-X11VNC_INSTALL_STAGING = NO
 X11VNC_INSTALL_TARGET = YES
 
 X11VNC_CONF_OPT = \
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index cdc8dde..7e03c93 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -6,7 +6,6 @@
 XVKBD_VERSION = 3.2
 XVKBD_SOURCE = xvkbd-$(XVKBD_VERSION).tar.gz
 XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
-XVKBD_INSTALL_STAGING = NO
 XVKBD_INSTALL_TARGET = YES
 
 XVKBD_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_CC)" \
