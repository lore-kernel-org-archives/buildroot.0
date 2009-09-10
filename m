From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Sep 2009 10:32:45 +0200
Subject: [Buildroot] [git commit master] kernel-headers: add 2.6.31
Message-ID: <20090910083412.79E287773A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a2994caa17189cb9a414ea0d82ad3d8eb79d4cf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 828ba0c..2768190 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_30
+	default BR2_KERNEL_HEADERS_2_6_31
 
 	help
 	  Select the version of kernel header files you wish to use.
@@ -30,10 +30,14 @@ choice
 
 	config BR2_KERNEL_HEADERS_2_6_29
 		bool "Linux 2.6.29.x kernel headers"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_2_6_30
 		bool "Linux 2.6.30.x kernel headers"
+		depends on BR2_DEPRECATED || BR2_RECENT
+
+	config BR2_KERNEL_HEADERS_2_6_31
+		bool "Linux 2.6.31.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Linux 2.6 snapshot"
@@ -53,5 +57,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.6"	if BR2_KERNEL_HEADERS_2_6_30
+	default "2.6.31"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
-- 
1.6.3.3
