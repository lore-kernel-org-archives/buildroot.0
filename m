From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:49:51 +0200
Subject: [Buildroot] [git commit] psplash: move systemd service files to
	/usr/lib
Message-ID: <20150422205050.3EF50819D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38ca8839656146979721c63ffe70151df976fc83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/psplash/psplash.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 5901547..85c0fb8 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -11,15 +11,15 @@ PSPLASH_AUTORECONF = YES
 
 define PSPLASH_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/psplash/psplash-start.service \
-		$(TARGET_DIR)/etc/systemd/system/psplash-start.service
+		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
 	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
-	ln -sf  ../psplash-start.service \
+	ln -sf  ../../../../usr/lib/systemd/system/psplash-start.service \
 		 $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/
 
 	$(INSTALL) -D -m 644 package/psplash/psplash-quit.service \
-		$(TARGET_DIR)/etc/systemd/system/psplash-quit.service
+		$(TARGET_DIR)/usr/lib/systemd/system/psplash-quit.service
 	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf  ../psplash-quit.service \
+	ln -sf  ../../../../usr/lib/systemd/system/psplash-quit.service \
 		 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
 endef
 
