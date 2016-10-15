From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 23:14:45 +0200
Subject: [Buildroot] [git commit] linux-headers: remove deprecated version
	4.2 and 4.3
Message-ID: <20161015211550.5412E80262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=133466f5f23a6550fd136170d841c58c6581a63c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We will remove BR2_DEPRECATED, so remove this deprecated package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 20 ++++++++++++++++++++
 package/linux-headers/Config.in.host | 12 ------------
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5e65d7b..76365e6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,26 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_KERNEL_HEADERS_4_3
+	bool "kernel headers version 4.3.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_1
+	select BR2_LEGACY
+	help
+	  Version 4.3.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.1.x of the headers have been automatically
+	  selected in your configuration.
+
+config BR2_KERNEL_HEADERS_4_2
+	bool "kernel headers version 4.2.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_1
+	select BR2_LEGACY
+	help
+	  Version 4.2.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.1.x of the headers have been automatically
+	  selected in your configuration.
+
 config BR2_PACKAGE_KODI_ADDON_XVDR
 	bool "kodi-addon-xvdr removed"
 	select BR2_LEGACY
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ebb869b..60578b8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -60,16 +60,6 @@ choice
 		bool "Linux 4.1.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
 
-	config BR2_KERNEL_HEADERS_4_2
-		bool "Linux 4.2.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2016_02
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
-
-	config BR2_KERNEL_HEADERS_4_3
-		bool "Linux 4.3.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2016_05
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
-
 	config BR2_KERNEL_HEADERS_4_4
 		bool "Linux 4.4.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
@@ -242,8 +232,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.34"	if BR2_KERNEL_HEADERS_4_1
-	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
-	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
 	default "4.4.24"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
