From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Jun 2019 13:57:33 +0200
Subject: [Buildroot] [PATCH 4/4] package/linux-headers: drop support for 5.x
 headers
In-Reply-To: <20190618115733.28551-1-peter@korsgaard.com>
References: <20190618115733.28551-1-peter@korsgaard.com>
Message-ID: <20190618115733.28551-4-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 5.0.x series is now EOL and vulnerable to the "TCP SACK PANIC" issue.
Drop support for it in linux-headers.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2b8dc3b1ee..9d54026899 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -160,6 +160,13 @@ config BR2_KERNEL_HEADERS_4_20
 	  Version 4.20.x of the Linux kernel headers are no longer
 	  maintained upstream and are now removed.
 
+config BR2_KERNEL_HEADERS_5_0
+	bool "kernel headers version 5.0.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.0.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 comment "Legacy options removed in 2019.05"
 
 config BR2_CSKY_DSP
diff --git a/linux/linux.hash b/linux/linux.hash
index 497e8e4d6f..205441dc25 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 11fd93207290272389ad284b8b042041d088fbee0ed5798e933bf8e91697d219  linux-5.1.11.tar.xz
-sha256 98d307a546c95a215dee675ffa4b63c2a7a29e7af839f0d8dfb96dbb61aac2d7  linux-5.0.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 266ee655620c3689ae94761970d6827fffc919760caf815427ad22730ba4381e  linux-4.19.52.tar.xz
 sha256 d7464c2379cdee46548ae9f848671f4669d4003af4034f3f738f2f0511ec75b3  linux-4.14.127.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 38ee0a6ac2..adf342fce0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -49,10 +49,6 @@ config BR2_KERNEL_HEADERS_4_19
 	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
-config BR2_KERNEL_HEADERS_5_0
-	bool "Linux 5.0.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
-
 config BR2_KERNEL_HEADERS_5_1
 	bool "Linux 5.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
@@ -305,7 +301,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.182"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.127"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.52"	if BR2_KERNEL_HEADERS_4_19
-	default "5.0.21"	if BR2_KERNEL_HEADERS_5_0
 	default "5.1.11"	if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.11.0
