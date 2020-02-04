From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon,  3 Feb 2020 17:21:54 -0800
Subject: [Buildroot] [PATCH v3 2/8] package/mariadb: remove mariadb_config
 from target
In-Reply-To: <20200204012200.7273-1-bluemrp9@gmail.com>
References: <20200204012200.7273-1-bluemrp9@gmail.com>
Message-ID: <20200204012200.7273-2-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We already remove mysql_config from the target since it's only useful in
staging. The same is true for mariadb_config. Thus, we remove it from the
target as well.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
Changes v2 -> v3:
  - separate changes into seperate patches (suggested by Thomas)
Changes v1 -> v2:
  - no change
---
 package/mariadb/mariadb.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index f76a974d65..4e7d693aee 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -123,11 +123,12 @@ define MARIADB_INSTALL_INIT_SYSTEMD
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
 
-- 
2.25.0
