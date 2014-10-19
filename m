From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 13:00:32 +0200
Subject: [Buildroot] [git commit] avahi: fix indentation in
	AVAHI_INSTALL_INIT_SYSTEMD
Message-ID: <20141019111437.A37D3AF213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2fd9ef86ee096784c9b326004ba928a16d035ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The indentation for commands should be made with tabs, not spaces, so
fix that up in AVAHI_INSTALL_INIT_SYSTEMD.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 3508002..cafb2db 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -164,19 +164,18 @@ endif
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 
 define AVAHI_INSTALL_INIT_SYSTEMD
-  mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-  ln -fs /lib/systemd/system/avahi-daemon.service \
-    $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-daemon.service
+	ln -fs /lib/systemd/system/avahi-daemon.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-daemon.service
 
-  ln -fs /lib/systemd/system/avahi-dnsconfd.service \
-    $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-dnsconfd.service
+	ln -fs /lib/systemd/system/avahi-dnsconfd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-dnsconfd.service
 
-  mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
-
-  $(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
-    $(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
+	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
 
+	$(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
 endef
 
 define AVAHI_INSTALL_INIT_SYSV
