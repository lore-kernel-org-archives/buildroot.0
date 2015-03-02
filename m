From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2015 22:27:26 -0000
Subject: [Buildroot] [git commit] linux-headers: add 3.19.x series
Message-ID: <20150302222715.C52408057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a3e710a5e86836bdccd46bfb740b10e5d129242
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2755f2f..4f0a211 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_18
+	default BR2_KERNEL_HEADERS_3_19
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -67,6 +67,10 @@ choice
 		bool "Linux 3.18.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 
+	config BR2_KERNEL_HEADERS_3_19
+		bool "Linux 3.19.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -88,6 +92,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19
+	bool "3.19.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18
 	bool "3.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
@@ -183,4 +191,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.6"	if BR2_KERNEL_HEADERS_3_18
+	default "3.19"		if BR2_KERNEL_HEADERS_3_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
