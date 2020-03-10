From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:27:05 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/mariadb: remove
 mariadb_config from target
Message-ID: <20200310202151.772D3905C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f540c1bb303b7535f18b6fab5febf9d5cc6e44a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

We already remove mysql_config from the target since it's only useful in
staging. The same is true for mariadb_config. Thus, we remove it from the
target as well.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c700b5ea8dc8cbe992cba260c5e98736fa95b32f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 6d8441b256..3aa7f94de2 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -126,11 +126,12 @@ define MARIADB_INSTALL_INIT_SYSTEMD
 endef
 endif
 
-# We don't need mysql_config on the target as it's only useful in staging
-# We also don't need the test suite on the target
+# We don't need mysql_config or mariadb_config on the target as it's
+# only useful in staging. We also don't need the test suite on the target.
 define MARIADB_POST_INSTALL
 	mkdir -p $(TARGET_DIR)/var/lib/mysql
 	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
+	$(RM) $(TARGET_DIR)/usr/bin/mariadb_config
 	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
 endef
 
