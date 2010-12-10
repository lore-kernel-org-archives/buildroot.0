From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 10 Dec 2010 10:47:42 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: bump 2.6.32.x /
	2.6.36.x stable versions
Message-ID: <20101210094813.198A38E23D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=862c928ce5e5161afdd4c359dcb6c74155244a82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in                                    |    4 ++--
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...types-for-headers-exported-to-user-space.patch} |    0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.32.26-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.27-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/linux/Config.in b/linux/Config.in
index f10b34c..7b781a4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -22,7 +22,7 @@ choice
 	default BR2_LINUX_KERNEL_2_6_36
 
 config BR2_LINUX_KERNEL_2_6_36
-	bool "2.6.36.1"
+	bool "2.6.36.2"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -60,7 +60,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "2.6.36.1" if BR2_LINUX_KERNEL_2_6_36
+	default "2.6.36.2" if BR2_LINUX_KERNEL_2_6_36
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 5bba7a6..63b69b0 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -59,10 +59,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.26"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.32.27"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6.34.7"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.9"	if BR2_KERNEL_HEADERS_2_6_35
-	default "2.6.36.1"	if BR2_KERNEL_HEADERS_2_6_36
+	default "2.6.36.2"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.32.26-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.27-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.26-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.27-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.2.2
