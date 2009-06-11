From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Jun 2009 12:26:16 +0200
Subject: [Buildroot] [git commit] toolchain/kernel-headers: add 2.6.30
Message-ID: <20090611111352.A7DC17782E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=223750fba2133cfef44b4f9f946bc5464ad986be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index cde510e..bed340e 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_29
+	default BR2_KERNEL_HEADERS_2_6_30
 
 	help
 	  Select the version of kernel header files you wish to use.
@@ -38,10 +38,14 @@ choice
 
 	config BR2_KERNEL_HEADERS_2_6_28
 		bool "Linux 2.6.28.x kernel headers"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_2_6_29
 		bool "Linux 2.6.29.x kernel headers"
+		depends on BR2_DEPRECATED || BR2_RECENT
+
+	config BR2_KERNEL_HEADERS_2_6_30
+		bool "Linux 2.6.30.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Linux 2.6 snapshot"
@@ -63,5 +67,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.27.24"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.4"	if BR2_KERNEL_HEADERS_2_6_29
+	default "2.6.30"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
-- 
1.6.0.6
