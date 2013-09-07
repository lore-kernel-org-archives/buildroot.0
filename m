From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 07 Sep 2013 11:46:07 +0800
Subject: [Buildroot] [PATCH] noip: needs mmu
Message-ID: <1378525567.15225.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/noip/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/noip/Config.in b/package/noip/Config.in
index 02039dd..aea5deb 100644
--- a/package/noip/Config.in
+++ b/package/noip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NOIP
 	bool "noip"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Dynamic DNS update client for no-ip.com
 
-- 
1.8.1.2
