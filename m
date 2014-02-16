From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Feb 2014 18:27:22 +0100
Subject: [Buildroot] [PATCH 03/10] package/linux-headers: select appropriate
	'AT_LEAST_XXX' header version
In-Reply-To: <cover.1392571021.git.yann.morin.1998@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
Message-ID: <94dd7d99bafacf64d4b2497b01de76472f4c9a70.1392571021.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Select the appropriate BR2_TOOLCHAIN_HEADERS_AT_LEAST_XXX options for the
internal toolchain backend.

The custom and snapshot options do not select anything:
  - snapshot is for a 2.6 kernel (BR2_DEFAULT_KERNEL_HEADERS="2.6" in this
    case)
  - we provide most of post-3.x kernel versions
  - custom and snapshot are thus to select a version before 3.0

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/linux-headers/Config.in.host | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ea104f5..0dd7c24 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -17,42 +17,53 @@ choice
 	config BR2_KERNEL_HEADERS_3_0
 		bool "Linux 3.0.x kernel headers"
 		depends on !BR2_arc
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
 		depends on !BR2_arc
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
 		depends on !BR2_arc
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 
 	config BR2_KERNEL_HEADERS_3_6
 		bool "Linux 3.6.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2013_05 && !BR2_arc
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
 
 	config BR2_KERNEL_HEADERS_3_7
 		bool "Linux 3.7.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2013_05 && !BR2_arc
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 
 	config BR2_KERNEL_HEADERS_3_8
 		bool "Linux 3.8.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2013_08 && !BR2_arc
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
 
 	config BR2_KERNEL_HEADERS_3_9
 		bool "Linux 3.9.x kernel headers"
 		depends on BR2_DEPRECATED_SINCE_2013_11
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 
 	config BR2_KERNEL_HEADERS_3_10
 		bool "Linux 3.10.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 
 	config BR2_KERNEL_HEADERS_3_11
 		bool "Linux 3.11.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
 
 	config BR2_KERNEL_HEADERS_3_12
 		bool "Linux 3.12.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 
 	config BR2_KERNEL_HEADERS_3_13
 		bool "Linux 3.13.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
-- 
1.8.1.2
