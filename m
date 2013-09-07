From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 07 Sep 2013 14:04:26 +0800
Subject: [Buildroot] [PATCH] socketcand: needs mmu
Message-ID: <1378533866.18257.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/socketcand/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/socketcand/Config.in b/package/socketcand/Config.in
index 72315c0..b836f55 100644
--- a/package/socketcand/Config.in
+++ b/package/socketcand/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SOCKETCAND
 	bool "socketcand"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Socketcand is a daemon that provides access to CAN interfaces
 	  on a machine via a network interface.
-- 
1.8.1.2
