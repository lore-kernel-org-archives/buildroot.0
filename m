From: Ryan Coe <bluemrp9@gmail.com>
Date: Thu, 26 Jul 2018 09:37:01 -0700
Subject: [Buildroot] [PATCH v2 1/3] mariadb: move comments outside of define
 block
Message-ID: <20180726163703.7598-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are two comments inside the post install define block that show up in
the build. Fix this by moving the comments outside the block.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/mariadb/mariadb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index ce846d9cda..e395d387e5 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -104,13 +104,13 @@ define MARIADB_INSTALL_INIT_SYSTEMD
 endef
 endif
 
+# We don't need mysql_config on the target as it's only useful in staging
+# We also don't need the test suite on the target
 define MARIADB_POST_INSTALL
 	mkdir -p $(TARGET_DIR)/var/lib/mysql
 	$(INSTALL) -D -m 644 $(TARGET_DIR)/usr/share/mysql/my-small.cnf \
 		$(TARGET_DIR)/etc/mysql/my.cnf
-	# We don't need this on the target as it's only useful in staging
 	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
-	# Remove test suite
 	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
 endef
 
-- 
2.18.0
