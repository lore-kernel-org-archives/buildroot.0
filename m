From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:04:26 +0100
Subject: [Buildroot] [git commit] linux-headers: nios2: Prevent selecting
	unsupported versions
Message-ID: <20150302222719.C69B4807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f50341edbbdd9f70a3c8905cc1e5be5a2647b49b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Versions older than Linux v3.19 do not support the Nios-II architecture
so disable them.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4f0a211..1e206ce 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -14,57 +14,66 @@ choice
 	config BR2_KERNEL_HEADERS_3_0
 		bool "Linux 3.0.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2014_08
-		depends on !BR2_arc
+		depends on !BR2_arc && !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
-		depends on !BR2_arc
+		depends on !BR2_arc && !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
-		depends on !BR2_arc
+		depends on !BR2_arc && !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 
 	config BR2_KERNEL_HEADERS_3_10
 		bool "Linux 3.10.x kernel headers"
+		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 
 	config BR2_KERNEL_HEADERS_3_11
 		bool "Linux 3.11.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2014_08
+		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
 
 	config BR2_KERNEL_HEADERS_3_12
 		bool "Linux 3.12.x kernel headers"
+		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 
 	config BR2_KERNEL_HEADERS_3_13
 		bool "Linux 3.13.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2014_08
+		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 
 	config BR2_KERNEL_HEADERS_3_14
 		bool "Linux 3.14.x kernel headers"
+		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
 	config BR2_KERNEL_HEADERS_3_15
 		bool "Linux 3.15.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2014_08
+		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 
 	config BR2_KERNEL_HEADERS_3_16
 		bool "Linux 3.16.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2015_02
+		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 
 	config BR2_KERNEL_HEADERS_3_17
 		bool "Linux 3.17.x kernel headers"
+		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 	config BR2_KERNEL_HEADERS_3_18
 		bool "Linux 3.18.x kernel headers"
+		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 
 	config BR2_KERNEL_HEADERS_3_19
