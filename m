From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Jun 2011 12:26:28 +0200
Subject: [Buildroot] [git commit] kernel-headers: add 2.6.39.x,
	use as default
Message-ID: <20110609105206.6AAF185AA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0d0c5269db65bcbb3ce9cd91b6fb468a112ad791
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 6bf73cd..4c551a2 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_38
+	default BR2_KERNEL_HEADERS_2_6_39
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -27,6 +27,9 @@ choice
 	config BR2_KERNEL_HEADERS_2_6_38
 		bool "Linux 2.6.38.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_39
+		bool "Linux 2.6.39.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -47,5 +50,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
+	default "2.6.39.1"	if BR2_KERNEL_HEADERS_2_6_39
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4
