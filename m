From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 07 Sep 2013 10:45:20 +0800
Subject: [Buildroot] [PATCH] netplug: needs mmu
Message-ID: <1378521920.14639.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/netplug/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netplug/Config.in b/package/netplug/Config.in
index 5c9bca6..593c08a 100644
--- a/package/netplug/Config.in
+++ b/package/netplug/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETPLUG
 	bool "netplug"
+	depends on BR2_USE_MMU # fork()
 	help
 	  A Linux daemon that manages network interfaces in
 	  response to network cables being plugged in and out.
-- 
1.8.1.2
