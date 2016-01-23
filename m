From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 12:02:48 +0100
Subject: [Buildroot] [git commit] package/sqlite: Fix readline support
Message-ID: <20160123110528.0D646809A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=202ad0fd49d38a1acc25daebcfe80458e3179b79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://bugs.busybox.net/show_bug.cgi?id=8621#c0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
