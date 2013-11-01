From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Fri,  1 Nov 2013 13:59:01 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: Add --without-ncurses to
	host-util-linux config
Message-ID: <1383307141-27007-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ncurses not necessary when building host-util-linux.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/util-linux/util-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 4db1e52..a694f3d 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -84,7 +84,7 @@ HOST_UTIL_LINUX_CONF_OPT += \
 	--disable-login --disable-mount --disable-partx \
 	--disable-pivot_root --disable-rename --disable-schedutils \
 	--disable-su --disable-switch_root --disable-unshare \
-	--disable-uuidd --disable-wall
+	--disable-uuidd --disable-wall --without-ncurses
 
 # Avoid building the tools if they are disabled since we can't install on
 # a per-directory basis.
-- 
1.8.3.2
