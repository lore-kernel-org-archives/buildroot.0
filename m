From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Jun 2015 18:19:50 +0200
Subject: [Buildroot] [git commit] linux-headers: add 4.1.x series
Message-ID: <20150622162014.549B1800FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f8bd6be9f63ff415da67646dd858faef4a92fe0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9bad7f0..059075c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_4_0
+	default BR2_KERNEL_HEADERS_4_1
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -86,6 +86,10 @@ choice
 		bool "Linux 4.0.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 
+	config BR2_KERNEL_HEADERS_4_1
+		bool "Linux 4.1.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -107,6 +111,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1
+	bool "4.1.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0
 	bool "4.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
@@ -212,4 +220,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.15"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.5"		if BR2_KERNEL_HEADERS_4_0
+	default "4.1"		if BR2_KERNEL_HEADERS_4_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
