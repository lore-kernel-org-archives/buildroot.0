From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Mar 2011 14:13:56 +0100
Subject: [Buildroot] [git commit master 1/1] avahi: bump version,
	remove dbus workaround
Message-ID: <20110301154333.024038D3E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=75adc4ab5c5833c9afda04d9a0eaf947130c539f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is now fixed upstream.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/avahi.mk |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 6321557..13ae85f 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -10,7 +10,7 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-AVAHI_VERSION = 0.6.27
+AVAHI_VERSION = 0.6.28
 AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
 AVAHI_SITE = http://www.avahi.org/download/
 AVAHI_INSTALL_STAGING = YES
@@ -160,19 +160,8 @@ define AVAHI_INSTALL_DAEMON_INITSCRIPT
 	$(INSTALL) -m 0755 package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
 endef
 
-# avahi build sys erroneously only installs dbus service if systemd is enabled
-define AVAHI_INSTALL_DAEMON_DBUS_SERVICE
-	$(INSTALL) -m 0644 -D $(@D)/avahi-daemon/org.freedesktop.Avahi.service \
-		$(TARGET_DIR)/usr/share/dbus-1/system-services/org.freedesktop.Avahi.service
-endef
-
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_DAEMON_INITSCRIPT
-
-ifeq ($(BR2_PACKAGE_DBUS),y)
-AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_DAEMON_DBUS_SERVICE
-endif
-
 endif
 
 $(eval $(call AUTOTARGETS,package,avahi))
-- 
1.7.3.4
