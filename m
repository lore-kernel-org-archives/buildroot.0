From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Apr 2018 19:56:51 +0200
Subject: [Buildroot] [PATCH 1/1] ncmpc: fix build with ncursesw
Message-ID: <20180401175651.2010-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set curses to ncurses as ncurses and ncursesw are the same package in
buildroot. Otherwise, build will fail when trying to find
ncursesw/curses.h or ncursesw.h.

Fixes:
 - http://autobuild.buildroot.net/results/c5bb5f978602896179ff9c58ecf4ced40bb96b57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/ncmpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 0c9dfd4658..6bce627562 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -14,6 +14,7 @@ NCMPC_LICENSE_FILES = COPYING
 
 NCMPC_CONF_OPTS += \
 	--prefix=/usr \
+	-Dcurses=ncurses \
 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
 
-- 
2.14.1
