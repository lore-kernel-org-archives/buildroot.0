From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 16:00:50 +0200
Subject: [Buildroot] [git commit] ntpd: drop default /etc/default/ntpd file
Message-ID: <20140709140118.B96BE9CCE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6864a744e87435d6d45b52d2cf44cf8d6e930577
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the recent change to the init script the default /etc/default/ntpd file
doesn't do anything, so don't install it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.mk           |    4 ----
 package/ntp/ntpd.etc.default |    2 --
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index b60e623..6349aae 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -53,10 +53,6 @@ define NTP_INSTALL_TARGET_CMDS
 	$(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 $(@D)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd)
 	test -z "$(NTP_INSTALL_FILES_y)" || install -m 755 $(addprefix $(@D)/,$(NTP_INSTALL_FILES_y)) $(TARGET_DIR)/usr/bin/
 	$(INSTALL) -m 644 package/ntp/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
-	@if [ ! -f $(TARGET_DIR)/etc/default/ntpd ]; then \
-		$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/default ; \
-		$(INSTALL) -m 644 package/ntp/ntpd.etc.default $(TARGET_DIR)/etc/default/ntpd ; \
-	fi
 endef
 
 ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
diff --git a/package/ntp/ntpd.etc.default b/package/ntp/ntpd.etc.default
deleted file mode 100644
index 94e2bc2..0000000
--- a/package/ntp/ntpd.etc.default
+++ /dev/null
@@ -1,2 +0,0 @@
-# Start the ntp daemon?
-NTPD=yes
