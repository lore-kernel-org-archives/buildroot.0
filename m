From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 22:14:02 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] mariadb: move comments
 outside of define block
Message-ID: <20180823200811.B978F8E449@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8121acceaeb4dd779357b9905edb671d2a358dee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

There are two comments inside the post install define block that show up in
the build. Fix this by moving the comments outside the block.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d0a0d49c20b250a71e649268df1328fca139a879)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
