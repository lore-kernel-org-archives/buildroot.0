From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 09:46:53 +0200
Subject: [Buildroot] [git commit] linux-headers: add 3.16.x series
Message-ID: <20140804074718.7958F9D367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76fe6fdebad3c95c18d5948ce5ba3dad62d0d45d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7b55fdf..0af5974 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_15
+	default BR2_KERNEL_HEADERS_3_16
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -55,6 +55,10 @@ choice
 		bool "Linux 3.15.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 
+	config BR2_KERNEL_HEADERS_3_16
+		bool "Linux 3.16.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -76,6 +80,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16
+	bool "3.16.x"
+	select BR2_PACKAGE_HEADERS_AT_LEAST_3_16
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15
 	bool "3.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
@@ -157,4 +165,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.15"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.8"	if BR2_KERNEL_HEADERS_3_15
+	default "3.16"		if BR2_KERNEL_HEADERS_3_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
