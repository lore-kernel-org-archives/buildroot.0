From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  2 Feb 2013 07:24:35 -0300
Subject: [Buildroot] [PATCH] nuttcp: needs mmu
Message-ID: <1359800675-17494-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b8c019a5701377a1e134d01ac0bae5fe34dc975f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nuttcp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nuttcp/Config.in b/package/nuttcp/Config.in
index fb6d3b1..eea88fd 100644
--- a/package/nuttcp/Config.in
+++ b/package/nuttcp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NUTTCP
 	bool "nuttcp"
+	depends on BR2_USE_MMU # fork()
 	help
 	  nuttcp is a TCP/UDP network testing tool, much like iperf
 
-- 
1.7.12.4
