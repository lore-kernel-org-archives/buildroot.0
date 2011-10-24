From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 24 Oct 2011 17:48:28 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump to version 3.0.7 and
	add version 3.1
Message-ID: <20111024205039.D22C08EC52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19e022a92f268d924f0c718ec89eb4bde29065ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    8 ++++++--
 toolchain/kernel-headers/kernel-headers.mk         |    2 +-
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index b827ec5..8be9186 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_0
+	default BR2_KERNEL_HEADERS_3_1
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -33,6 +33,9 @@ choice
 	config BR2_KERNEL_HEADERS_3_0
 		bool "Linux 3.0.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_1
+		bool "Linux 3.1.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -54,6 +57,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.4"		if BR2_KERNEL_HEADERS_3_0
+	default "3.0.7"		if BR2_KERNEL_HEADERS_3_0
+	default "3.1"		if BR2_KERNEL_HEADERS_3_1
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 044fcf9..72c6007 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -29,7 +29,7 @@ LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL)$(SUBLEVEL)$(EXTRAVERSION)
 ifeq ($(findstring x2.6.,x$(DEFAULT_KERNEL_HEADERS)),x2.6.)
 LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 else
-LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v3.0/
+LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
 endif
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
diff --git a/toolchain/kernel-headers/linux-3.0.4-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.7-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.4-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.7-headers_install-fix-__packed-in-exported-kernel-head.patch
