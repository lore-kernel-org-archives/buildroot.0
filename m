From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 22:13:46 +0100
Subject: [Buildroot] [git commit] sqlite: remove obsolete configure options
Message-ID: <20111211215606.623778F8D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0e8772a7fba6a4f7d010bdd1ffe39e12f42f3f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop options that are unknown to the configure script.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
