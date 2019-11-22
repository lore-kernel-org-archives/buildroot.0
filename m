From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 22 Nov 2019 06:29:08 +0100
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.3.x series
Message-ID: <20191122052908.12657-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a78a1761c9..17b16d94ec 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.3.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.3.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 79de759161..d50aaa0bc4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 6e7156946d1d72e24786d09a47511e44c3abe5d4da757f4f68f2da482880aeb7  linux-5.3.11.tar.xz
+sha256 53bff6f89dca19f928043fb0d3434bfb4b6abbb1bf18b907cb731188bdac97a0  linux-5.3.12.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 868b4a92619cb00ab142a20a67f000525b9605820d1b66faa4a183133eac0660  linux-4.19.84.tar.xz
-sha256 86de4a24379a78d67fc08b2e249ccf7b689eb6c37fbe329fc3dfbe8ab4300603  linux-4.14.154.tar.xz
-sha256 383fd43bd35251636232912ad52fbc844e3c8ab792cadb62b4aefe000bacbd88  linux-4.9.201.tar.xz
-sha256 a78a85c4fb0c0835b01933765c984ab5ab190eac1d521338fb88b03a49641388  linux-4.4.201.tar.xz
+sha256 fdacceeae22d1a0467cae50c15e6e754bfb8bb8e8010623df0d8fd78f4adb929  linux-4.4.202.tar.xz
+sha256 8108ec1cd10fc40821c84e9f087dba10b1767aad66596f4a36925faef55e4ebf  linux-4.9.202.tar.xz
+sha256 77d61979556b81c95b81452fa10e1fe9368cbe2f9f80a13e4669b0464722e481  linux-4.14.155.tar.xz
+sha256 7bf435970aeeafd46263f49730087a61c4858d8b8fc5a4002ceac971b45f4fb7  linux-4.19.85.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3c232b3218..191e387de0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,11 +305,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.201"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.201"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.154"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.84"	if BR2_KERNEL_HEADERS_4_19
-	default "5.3.11"	if BR2_KERNEL_HEADERS_5_3
+	default "4.4.202"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.202"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.155"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.85"	if BR2_KERNEL_HEADERS_4_19
+	default "5.3.12"	if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
