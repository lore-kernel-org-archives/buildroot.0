From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 Mar 2015 13:56:43 -0400
Subject: [Buildroot] [PATCH 11/15] postgresql: move systemd service file to
	/usr/lib
In-Reply-To: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426787807-29510-12-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/postgresql/postgresql.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7dc3f0b..e904760 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -85,9 +85,9 @@ endef
 
 define POSTGRESQL_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/postgresql/postgresql.service \
-		$(TARGET_DIR)/etc/systemd/system/postgresql.service
+		$(TARGET_DIR)/usr/lib/systemd/system/postgresql.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../postgresql.service \
+	ln -fs /usr/lib/systemd/system/postgresql.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
 endef
 
-- 
2.1.0
