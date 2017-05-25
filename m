From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 May 2017 15:54:24 +0200
Subject: [Buildroot] [git commit] Revert "libcdio: disable on ARC,
	triggers a toolchain bug"
Message-ID: <20170525135716.296F281F6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c1d080c2dc75fb021ace02472c8db0f2538e481
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 459f7302df8cdc45aa0f7f2581ebb6f05fb6432a.

libcdio building is fixed for ARC in
2b360bd547f1 "gcc: arc-2017.03-rc2: Fix "unrecognized supposed constant" error"

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcdio/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libcdio/Config.in b/package/libcdio/Config.in
index 531af3b..fdc001e 100644
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
