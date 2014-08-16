From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Aug 2014 12:50:37 +0200
Subject: [Buildroot] [git commit] linux-headers: mark EOL versions deprecated
Message-ID: <20140816105052.B4B779D44A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91050c8e659e5269d1dc6eecf297a4135a6f473a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Follow the upstream EOL cycle and mark 3.0, 3.11, 3.13 and 3.15
as deprecated for 2014.08.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1f2094a..b2554ab 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -13,6 +13,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_0
 		bool "Linux 3.0.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2014_08
 		depends on !BR2_arc
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
@@ -37,6 +38,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_11
 		bool "Linux 3.11.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2014_08
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
 
 	config BR2_KERNEL_HEADERS_3_12
@@ -45,6 +47,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_13
 		bool "Linux 3.13.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2014_08
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 
 	config BR2_KERNEL_HEADERS_3_14
@@ -53,6 +56,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_15
 		bool "Linux 3.15.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2014_08
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 
 	config BR2_KERNEL_HEADERS_3_16
