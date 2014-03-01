From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 19:43:22 +0100
Subject: [Buildroot] [git commit] package/linux-headers: select appropriate
	'AT_LEAST_XXX' header version
Message-ID: <20140301193723.4C1FD96DFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88d0bca0c103f1e8f2e0006948e0cf4860a35a21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select the appropriate BR2_TOOLCHAIN_HEADERS_AT_LEAST_XXX options for the
internal toolchain backend.

For the manualy-specified version, we bring up the choice that sets the
_AT_LEAST_XXX symbols.

[Thomas: rename symbols from BR2_PACKAGE_HOST_LINUX_HEADERS_<version>
to BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_<version> to clearly indicate
that they are used to specify the version of custom headers.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |   82 ++++++++++++++++++++++++++++++++++
 1 files changed, 82 insertions(+), 0 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fcecd62..8d306bd 100644
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
@@ -65,6 +76,77 @@ config BR2_DEFAULT_KERNEL_VERSION
 	  Specify the version you want to use.
 	  E.G.: 3.6.10
 
+choice
+	bool "Custom kernel headers series"
+	depends on BR2_KERNEL_HEADERS_VERSION
+	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
+	help
+	  Set to the kernel headers series you manually set above.
+
+	  This is used to hide/show some packages that have strict
+	  requirements on the version of kernel headers.
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13
+	bool "3.13.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12
+	bool "3.12.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_11
+	bool "3.11.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10
+	bool "3.10.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9
+	bool "3.9.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8
+	bool "3.8.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_7
+	bool "3.7.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_6
+	bool "3.6.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_5
+	bool "3.5.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4
+	bool "3.4.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_3
+	bool "3.3.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_2
+	bool "3.2.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_1
+	bool "3.1.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0
+	bool "3.0.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
+	bool "2.6.x"
+
+endchoice
+
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
