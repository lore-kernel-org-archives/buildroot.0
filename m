From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Nov 2013 08:17:53 -0300
Subject: [Buildroot] [PATCH] mdadm: needs mmu
Message-ID: <1385032673-301-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/52c/52cc56df2aa278d92141918de74833d7e4fd3d47/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mdadm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdadm/Config.in b/package/mdadm/Config.in
index c513348..e0d606b 100644
--- a/package/mdadm/Config.in
+++ b/package/mdadm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MDADM
 	bool "mdadm"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Utility for managing Linux Software RAID arrays.
 
-- 
1.8.3.2
