From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 15:00:50 +0200
Subject: [Buildroot] [PATCH v3 11/11] kernel-headers: Add support for ARC
	kernel headers
In-Reply-To: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
References: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1367499650-29869-12-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also make sure that older kernels are not selected for ARC.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 Makefile                           |    1 +
 toolchain/kernel-headers/Config.in |   14 +++++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 97804ff..ce7530f 100644
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
index 12c53d8..aff69d9 100644
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
-- 
1.7.0.4
