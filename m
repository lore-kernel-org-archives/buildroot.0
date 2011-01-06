From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jan 2011 08:44:11 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: add 2.6.37
Message-ID: <20110106090647.271DE8B388@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2ae7ac337f98f84e1862b655b414517b53794522
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 63b69b0..6401400 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,8 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_36
-
+	default BR2_KERNEL_HEADERS_2_6_37
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -41,6 +40,9 @@ choice
 	config BR2_KERNEL_HEADERS_2_6_36
 		bool "Linux 2.6.36.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_37
+		bool "Linux 2.6.37.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -64,5 +66,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.34.7"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.9"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.2"	if BR2_KERNEL_HEADERS_2_6_36
+	default "2.6.37"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.2.2
