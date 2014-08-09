From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat,  9 Aug 2014 19:34:39 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: remove devfiles from target
Message-ID: <1407605679-15342-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/postgresql/postgresql.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 0fecbc7..6d71b9c 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -51,6 +51,8 @@ endef
 
 define POSTGRESQL_INSTALL_TARGET_FIXUP
 	$(INSTALL) -dm 0700 $(TARGET_DIR)/var/lib/pgsql
+	rm -f $(TARGET_DIR)/usr/bin/pg_config
+	rm -rf $(TARGET_DIR)/usr/lib/postgresql/pgxs
 endef
 
 POSTGRESQL_POST_INSTALL_TARGET_HOOKS += POSTGRESQL_INSTALL_TARGET_FIXUP
-- 
1.8.3.2
