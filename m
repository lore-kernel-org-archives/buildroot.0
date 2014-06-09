From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:49:40 +0200
Subject: [Buildroot] [git commit] linux-headers: add 3.15.x series
Message-ID: <20140609125032.B922D9C516@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=338cc8ffd03d3809f3a0dae582aa0af67b86b2f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d22b1ce..8b55954 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_14
+	default BR2_KERNEL_HEADERS_3_15
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -56,6 +56,10 @@ choice
 		bool "Linux 3.14.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
+	config BR2_KERNEL_HEADERS_3_15
+		bool "Linux 3.15.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -77,6 +81,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15
+	bool "3.15.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14
 	bool "3.14.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
@@ -154,4 +162,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.12.21"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.6"	if BR2_KERNEL_HEADERS_3_14
+	default "3.15"		if BR2_KERNEL_HEADERS_3_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
