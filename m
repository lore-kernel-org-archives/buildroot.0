From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Jul 2018 14:09:17 +0200
Subject: [Buildroot] [git commit] mariadb: move comments outside of define
 block
Message-ID: <20180730120340.25E6680676@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0a0d49c20b250a71e649268df1328fca139a879
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are two comments inside the post install define block that show up in
the build. Fix this by moving the comments outside the block.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
