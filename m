From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  2 Dec 2015 12:27:05 +0100
Subject: [Buildroot] [PATCH 1/2] libgudev: remove systemd dependency
Message-ID: <1449055626-4640-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Since version 3.1.3 eudev doesn't provide internal libgudev,
so this package can now be used as an ordinary stand-alone
package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libgudev/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
index 9b64ffc..4596fa1 100644
--- a/package/libgudev/Config.in
+++ b/package/libgudev/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBGUDEV
 	bool "libgudev"
-	depends on BR2_INIT_SYSTEMD
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
@@ -18,5 +17,4 @@ config BR2_PACKAGE_LIBGUDEV
 
 comment "libgudev needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on BR2_INIT_SYSTEMD
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.1.4
