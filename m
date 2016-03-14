From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 13:12:09 +0100
Subject: [Buildroot] [git commit] linux-headers: add 4.5.x series
Message-ID: <20160314121342.AE03C7FA05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e324200a355f7ae5b89d0bd93d5d9099a6bab32e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f847720..c5be9f5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_4
+	default BR2_KERNEL_HEADERS_4_5
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -80,6 +80,10 @@ choice
 		bool "Linux 4.4.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 
+	config BR2_KERNEL_HEADERS_4_5
+		bool "Linux 4.5.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -101,6 +105,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5
+	bool "4.5.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4
 	bool "4.4.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
@@ -221,4 +229,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
 	default "4.4.5"		if BR2_KERNEL_HEADERS_4_4
+	default "4.5"		if BR2_KERNEL_HEADERS_4_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
