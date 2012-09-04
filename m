From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Sep 2012 13:13:10 +0200
Subject: [Buildroot] [git commit] kernel-headers: add 3.5.x, remove 2.6.36.x
Message-ID: <20120904134540.27ECC9950C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1da12bd37274ce75fe869c656dd74240ba72d798
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And deprecate 2.6.38.x.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index d23e5e6..403ab3e 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_4
+	default BR2_KERNEL_HEADERS_3_5
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -15,16 +15,13 @@ choice
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_6_36
-		bool "Linux 2.6.36.x kernel headers"
-		depends on BR2_DEPRECATED
-
 	config BR2_KERNEL_HEADERS_2_6_37
 		bool "Linux 2.6.37.x kernel headers"
 		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_2_6_38
 		bool "Linux 2.6.38.x kernel headers"
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_2_6_39
 		bool "Linux 2.6.39.x kernel headers"
@@ -44,6 +41,9 @@ choice
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_5
+		bool "Linux 3.5.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -60,7 +60,6 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
@@ -69,5 +68,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.28"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
 	default "3.4.10"	if BR2_KERNEL_HEADERS_3_4
+	default "3.5.3"		if BR2_KERNEL_HEADERS_3_5
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
