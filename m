From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 16 May 2017 10:32:13 +0300
Subject: [Buildroot] [PATCH] Revert "libcdio: disable on ARC,
	triggers a toolchain bug"
Message-ID: <20170516073213.9321-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 459f7302df8cdc45aa0f7f2581ebb6f05fb6432a.

libcdio building is fixed for ARC in
2b360bd547f1 "gcc: arc-2017.03-rc2: Fix "unrecognized supposed constant" error"

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 package/libcdio/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libcdio/Config.in b/package/libcdio/Config.in
index 531af3bb93..fdc001ec40 100644
--- a/package/libcdio/Config.in
+++ b/package/libcdio/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LIBCDIO
 	bool "libcdio"
 	depends on BR2_USE_MMU # fork()
-	# ARC toolchain issue
-	depends on !BR2_arc
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The GNU Compact Disc Input and Control library.
-- 
2.11.0
