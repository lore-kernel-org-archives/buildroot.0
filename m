From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 11:23:44 +0100
Subject: [Buildroot] [PATCH 3/4] package/sqlite: Fix readline support
In-Reply-To: <1453544625-30597-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453544625-30597-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453544625-30597-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes https://bugs.busybox.net/show_bug.cgi?id=8621#c0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/sqlite.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 46acbf8..1603e00 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -47,7 +47,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SQLITE_READLINE),y)
 SQLITE_DEPENDENCIES += ncurses readline
-SQLITE_CONF_OPTS += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
+SQLITE_CONF_OPTS += --enable-readline
 else
 SQLITE_CONF_OPTS += --disable-readline
 endif
-- 
2.7.0.rc3
