From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2015 10:17:35 +0200
Subject: [Buildroot] [git commit] linux-headers: add 4.2.x series
Message-ID: <20150901083109.5CC287FA68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d9d533dca1812cc2616646153410fdafa7f1ff9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 61eca21..1ee3ef9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_4_1
+	default BR2_KERNEL_HEADERS_4_2
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -91,6 +91,10 @@ choice
 		bool "Linux 4.1.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
 
+	config BR2_KERNEL_HEADERS_4_2
+		bool "Linux 4.2.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -112,6 +116,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2
+	bool "4.2.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1
 	bool "4.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
@@ -222,4 +230,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.5"		if BR2_KERNEL_HEADERS_4_1
+	default "4.2"		if BR2_KERNEL_HEADERS_4_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
