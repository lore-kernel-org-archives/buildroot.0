From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 22:14:55 +0200
Subject: [Buildroot] [git commit] linux-headers: add 4.0.x series
Message-ID: <20150413201514.385FD80776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53e36065c7fb4f1725cb8013ccd0aeae8db22f8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1bfde7d..ec3b8b1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_19
+	default BR2_KERNEL_HEADERS_4_0
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -81,6 +81,10 @@ choice
 		bool "Linux 3.19.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
 
+	config BR2_KERNEL_HEADERS_4_0
+		bool "Linux 4.0.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -102,6 +106,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0
+	bool "4.0.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19
 	bool "3.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
@@ -202,4 +210,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.11"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.3"	if BR2_KERNEL_HEADERS_3_19
+	default "4.0"		if BR2_KERNEL_HEADERS_4_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
