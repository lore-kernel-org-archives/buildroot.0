From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 20 May 2013 15:56:35 +0300
Subject: [Buildroot] [PATCH 03/12] sqlite: Added host compilation support
In-Reply-To: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1369054604-26139-3-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 package/sqlite/sqlite.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 8eb6b2f..39d5528 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -54,6 +54,7 @@ SQLITE_CONF_OPT += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
 else
 SQLITE_CONF_OPT += --disable-readline
 endif
+HOST_SQLITE_CONF_OPT += --disable-readline
 
 define SQLITE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/sqlite3
@@ -68,3 +69,4 @@ define SQLITE_UNINSTALL_STAGING_CMDS
 endef
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.1.2
