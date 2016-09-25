From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Sep 2016 13:32:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: depends
	on BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20160925113232.1303-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses __sync_val_compare_and_swap_4 & __sync_bool_compare_and_swap_4.

Fixes
http://autobuild.buildroot.net/results/ecc/ecc083ffc00e05e15390b630c57d398fbe2356e0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 5715a56..665be21 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU # fork()
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
-- 
2.9.3
