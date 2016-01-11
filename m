From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2016 17:33:22 +0100
Subject: [Buildroot] [git commit] linux-headers: add 4.4.x series
Message-ID: <20160111163526.A55A3826C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6a09cf401fc8215adeccb2500d4c4611638dd66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 141811b..6abf731 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_4_3
+	default BR2_KERNEL_HEADERS_4_4
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -76,6 +76,10 @@ choice
 		bool "Linux 4.3.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 
+	config BR2_KERNEL_HEADERS_4_4
+		bool "Linux 4.4.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -97,6 +101,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4
+	bool "4.4.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3
 	bool "4.3.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
@@ -213,4 +221,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.1.15"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.3"		if BR2_KERNEL_HEADERS_4_3
+	default "4.4"		if BR2_KERNEL_HEADERS_4_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
