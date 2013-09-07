From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 07 Sep 2013 15:44:45 +0800
Subject: [Buildroot] [PATCH] libtirpc: needs threads
Message-ID: <1378539885.24773.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/250/25008a6f0a854e1e29a3340536eef817eeb5752e/

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/libtirpc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index b9db5aa..a2dadce 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBTIRPC
 	# used instead of libtirpc.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
 		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Libtirpc is a port of Sun's Transport-Independent RPC
 	  library to Linux.
-- 
1.8.1.2
