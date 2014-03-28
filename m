From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Mar 2014 19:23:57 -0300
Subject: [Buildroot] [PATCH] mtools: needs mmu
Message-ID: <1396045437-14376-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/915/91531e06646b7453248be5c7ca22101edd42d641/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mtools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtools/Config.in b/package/mtools/Config.in
index c471d77..5865223 100644
--- a/package/mtools/Config.in
+++ b/package/mtools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MTOOLS
 	bool "mtools"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	help
 	  Mtools is a collection of utilities to access MS-DOS disks from
 	  Unix without mounting them. It supports Win'95 style long file
-- 
1.8.3.2
