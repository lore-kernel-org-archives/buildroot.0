From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 2 Oct 2012 08:48:33 +0200
Subject: [Buildroot] [git commit] kernel-headers: add 3.6 kernel
Message-ID: <20121002065915.E111C99795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1344dbbd43587847c61ceb32dd17d282199104d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And deprecate 2.6.39.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 4059074..7e6cc43 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_5
+	default BR2_KERNEL_HEADERS_3_6
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -25,6 +25,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_2_6_39
 		bool "Linux 2.6.39.x kernel headers"
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_3_0
 		bool "Linux 3.0.x kernel headers"
@@ -44,6 +45,9 @@ choice
 	config BR2_KERNEL_HEADERS_3_5
 		bool "Linux 3.5.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_6
+		bool "Linux 3.6.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -69,5 +73,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
 	default "3.4.11"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.4"		if BR2_KERNEL_HEADERS_3_5
+	default "3.6"		if BR2_KERNEL_HEADERS_3_6
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
