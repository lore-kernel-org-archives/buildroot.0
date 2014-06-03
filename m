From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Jun 2014 16:10:03 +0300
Subject: [Buildroot] [PATCH] smcroute: needs MMU
Message-ID: <29cc396d3df1992c2073e7d9f7836e155533c7ca.1401801003.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/9ce/9ce921dc00bcabcddd260916d0f7c44b62029df1/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/smcroute/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/smcroute/Config.in b/package/smcroute/Config.in
index df42db33d789..c244cb934585 100755
--- a/package/smcroute/Config.in
+++ b/package/smcroute/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SMCROUTE
 	bool "smcroute"
 	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	help
 	  SMCRoute is a command line tool to manipulate the multicast
 	  routes of a UNIX kernel. It supports both IPv4 and IPv6 multicast
@@ -13,3 +14,4 @@ config BR2_PACKAGE_SMCROUTE
 
 comment "smcroute needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
+	depends on BR2_USE_MMU
-- 
2.0.0.rc2
