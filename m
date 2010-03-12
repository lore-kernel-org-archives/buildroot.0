From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Mar 2010 23:19:57 +0100
Subject: [Buildroot] [git commit master] toolchain: add 2.6.33 kernel headers
Message-ID: <20100312225108.1B7077639D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b00a1a70b5ca5f370ee108ddf5326d766a6b897e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                            |    3 ++-
 toolchain/kernel-headers/Config.in |    7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8a2c8a0..a8f890e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,7 @@
 2010.05, Not yet released
 
-	Toolchain: uClibc 0.9.30.3, older 0.9.30.x removed.
+	Toolchain: uClibc 0.9.30.3, older 0.9.30.x removed. 2.6.33
+	kernel headers.
 
 	X.org updated to 7.5.
 
diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 2c1c8e2..15cdd4e 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -38,10 +38,14 @@ choice
 
 	config BR2_KERNEL_HEADERS_2_6_31
 		bool "Linux 2.6.31.x kernel headers"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_2_6_32
 		bool "Linux 2.6.32.x kernel headers"
+		depends on BR2_DEPRECATED || BR2_RECENT
+
+	config BR2_KERNEL_HEADERS_2_6_33
+		bool "Linux 2.6.33.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
@@ -72,5 +76,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.12"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6.32.9"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.33"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.6.3.3
