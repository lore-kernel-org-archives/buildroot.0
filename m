From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jan 2010 11:10:32 +0100
Subject: [Buildroot] [git commit master] Bump kismet package to 2010-01-R1
Message-ID: <20100120101208.A2D35776FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=db9dcbee6e241d8ede6f3fbda2ea9cd7ab291b89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #931.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    3 ++-
 package/kismet/kismet.mk |    7 +++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index db97604..7350560 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 
 	Updated/fixed packages: autoconf, bind, binutils, bootutils, busybox,
 	directfb, e2fsprogs, gstreamer, gst-plugins-bad, hal, iptables,
-	iw, jpeg, libfuse, libpcap, libungif, lighttpd, mesa, mpg123,
+	iw, jpeg, kismet, libfuse, libpcap, libungif, lighttpd, mesa, mpg123,
 	mtd-utils, neon, pcre, qt, rpm, sshfs, tremor, u-boot,
 	usb_modeswitch, usbutils, wpa_supplicant, xfsprogs
 
@@ -34,6 +34,7 @@
 	#913: Bump iptables to 1.4.6
 	#919: Bump usb_modeswitch package to 1.0.7
 	#925: Bump wpa_supplicant package to 0.6.10
+	#931: Bump kismet package to 2010-01-R1
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index edc46e4..1b61ddd 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,8 +4,7 @@
 #
 #############################################################
 
-KISMET_VERSION = 2009-06-R1
-KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.gz
+KISMET_VERSION = 2010-01-R1
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = libpcap ncurses
 
@@ -35,7 +34,9 @@ $(eval $(call AUTOTARGETS,package,kismet))
 $(KISMET_TARGET_INSTALL_TARGET):
 	$(call MESSAGE,"Installing")
 	$(INSTALL) -m 755 $(addprefix $(KISMET_DIR)/, $(KISMET_TARGET_BINARIES)) $(TARGET_DIR)/usr/bin
+ifdef KISMET_TARGET_CONFIGS
 	$(INSTALL) -m 644 $(addprefix $(KISMET_DIR)/conf/, $(KISMET_TARGET_CONFIGS)) $(TARGET_DIR)/etc
+endif
 ifeq ($(BR2_ENABLE_DEBUG),)
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/bin/, $(KISMET_TARGET_BINARIES))
 endif
@@ -44,5 +45,7 @@ endif
 $(KISMET_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(KISMET_TARGET_BINARIES))
+ifdef KISMET_TARGET_CONFIGS
 	rm -f $(addprefix $(TARGET_DIR)/etc/, $(KISMET_TARGET_CONFIGS))
+endif
 	rm -f $(KISMET_TARGET_INSTALL_TARGET) $(KISMET_HOOK_POST_INSTALL)
-- 
1.6.3.3
