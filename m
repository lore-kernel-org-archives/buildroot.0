From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed,  7 Dec 2011 20:00:08 +0100
Subject: [Buildroot] [PATCH 2/4] sqlite: remove obsolete configure options
In-Reply-To: <1323284410-8884-1-git-send-email-s.neumann@raumfeld.com>
References: <1323284410-8884-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1323284410-8884-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop options that are unknown to the configure script.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/sqlite/sqlite.mk |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 5391d86..f587f47 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -16,11 +16,9 @@ ifneq ($(BR2_LARGEFILE),y)
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DSQLITE_DISABLE_LFS"
 endif
 
-SQLITE_CONF_OPT =	--enable-tempstore=yes \
-			--enable-threadsafe \
-			--enable-releasemode \
-			--disable-tcl \
-			--localstatedir=/var
+SQLITE_CONF_OPT = \
+	--enable-threadsafe \
+	--localstatedir=/var
 
 ifeq ($(BR2_PACKAGE_SQLITE_READLINE),y)
 SQLITE_DEPENDENCIES += ncurses readline
-- 
1.7.5.4
