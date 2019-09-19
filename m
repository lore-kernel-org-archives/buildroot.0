From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Sep 2019 21:52:00 +0200
Subject: [Buildroot] [PATCH] package/ytree: uses fork(), needs MMU
Message-ID: <20190919195200.17397-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  login.c:(.text+0x546): undefined reference to `fork'

[1] http://autobuild.buildroot.net/results/bcbd0b826d5af1d429c23255d63dce6c7080085e

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ytree/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ytree/Config.in b/package/ytree/Config.in
index 4eca9c7e10..3ac9283a56 100644
--- a/package/ytree/Config.in
+++ b/package/ytree/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_YTREE
 	bool "ytree"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Ytree - a (curses-based) file manager similar to DOS Xtree(tm)
--
2.23.0
