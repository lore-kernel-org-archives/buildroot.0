From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:03 -0400
Subject: [Buildroot] [PATCH v2 12/25] libiio: move systemd service file to
	/usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-13-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/libiio/libiio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index abcddba..7082e89 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -41,8 +41,8 @@ endef
 define LIBIIO_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	$(INSTALL) -D -m 0644 $(@D)/debian/iiod.service \
-		$(TARGET_DIR)/lib/systemd/system/iiod.service
-	ln -fs /lib/systemd/system/iiod.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/iiod.service
+	ln -fs ../../../../usr/lib/systemd/system/iiod.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/iiod.service
 endef
 endif
-- 
2.1.0
