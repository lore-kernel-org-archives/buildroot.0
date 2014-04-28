From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Apr 2014 16:41:40 -0300
Subject: [Buildroot] [PATCH] lsof: needs mmu
Message-ID: <1398714100-10545-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f03/f03fd887cfb353149d88c97afa380bd95d6315f1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lsof/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index cc7512c..820cbf7 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LSOF
 	bool "lsof"
+	depends on BR2_USE_MMU # fork()
 	help
 	  lsof (LiSt Open Files)
 	  The lsof tool lists information about files opened by
-- 
1.8.3.2
