From: Ubaldo Porcheddu <ubaldo@eja.it>
Date: Tue, 23 Oct 2018 10:23:15 +0000
Subject: [Buildroot] [PATCH 1/1] Add version 4.19 support
Message-ID: <1540290195-2322-1-git-send-email-ubaldo@eja.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
---
 package/linux-headers/Config.in.host | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cdf639a..4520041 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -60,6 +60,10 @@ config BR2_KERNEL_HEADERS_4_18
 	bool "Linux 4.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 
+config BR2_KERNEL_HEADERS_4_19
+	bool "Linux 4.19.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -129,6 +133,10 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18
 	bool "4.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19
+	bool "4.19.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17
 	bool "4.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
-- 
1.9.1
