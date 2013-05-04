From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 23:24:02 +0200
Subject: [Buildroot] [git commit] kernel-headers: Add support for ARC kernel
	headers
Message-ID: <20130504212452.A9B9399573@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40b17f808240cb05fe251026cc7c5abdc29e3ab7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also make sure that older kernels are not selected for ARC.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                           |    1 +
 toolchain/kernel-headers/Config.in |   14 +++++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 5b690f0..1692a36 100644
--- a/Makefile
+++ b/Makefile
@@ -238,6 +238,7 @@ ARCH:=$(call qstrip,$(BR2_ARCH))
 
 KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
+	-e s/arc.*/arc/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
 	-e s/aarch64/arm64/ \
 	-e s/bfin/blackfin/ \
diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 6ec39c0..a6135e3 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -17,35 +17,39 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_0
 		bool "Linux 3.0.x kernel headers"
+		depends on !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_1
 		bool "Linux 3.1.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
+		depends on !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_3
 		bool "Linux 3.3.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
+		depends on !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_5
 		bool "Linux 3.5.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_6
 		bool "Linux 3.6.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_7
 		bool "Linux 3.7.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_8
 		bool "Linux 3.8.x kernel headers"
+		depends on !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_9
 		bool "Linux 3.9.x kernel headers"
