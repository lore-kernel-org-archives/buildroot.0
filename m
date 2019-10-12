From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Oct 2019 07:51:55 +0200
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{2, 3}.x series
Message-ID: <20191012055155.24326-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 07e17b8573..db4d49bccb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.3.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.3.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 48567cc036..9fb53ce2e3 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 19541dbb3e0e6ca3acb4e7d6bb95a0af44a9607d2cb3e50c2d3f8894d95b246e  linux-5.3.4.tar.xz
-sha256 de98e4c28e08cd992c3aadc32450b3fa738b6101c509093192bb344f4f41b18a  linux-5.2.19.tar.xz
+sha256 e84021a94784de7bb10e4251fb1a87859a8d1c97bd78fb55ad47ab6ce475ec1f  linux-5.3.6.tar.xz
+sha256 9a8ee3ff75dabffa76141c8dc7529dfbb3ca07888a3708a13f15b412268b3538  linux-5.2.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 612b69cc494f2da1530bacac17291339e272cde7f2a7669e615f565506d5f3a9  linux-4.19.77.tar.xz
-sha256 8fd793688c9d9d4e26fdc175be92b6e638b6a86f4150dd66edecebab0bb85b12  linux-4.14.147.tar.xz
-sha256 54be562a2da16eecd612f641146dc099c1aa05c0fc559c971bdfde161c929d68  linux-4.9.195.tar.xz
-sha256 c2a42e0527c33cd663dde6aceb4c432d75b6e3f9f7ffcd40a07556f8c05734b6  linux-4.4.195.tar.xz
+sha256 f1143564364f278ba0893a7813afc02da6ecef6d5de147bd5011aa3cc1634b34  linux-4.19.79.tar.xz
+sha256 e69dabd2368440ce1650cda0cf043e1ba3f3343f940a43b68e761739fcb3f296  linux-4.14.149.tar.xz
+sha256 e0ab12b04a975630ece2142a1ac15cfe45140b8c3359226b035c15ca7c92c6ef  linux-4.9.196.tar.xz
+sha256 169e3f07701336138905bdedd22a0089b45e2e53b9aa6d2ed6c44f215476a76d  linux-4.4.196.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4a83e7eb71..555a2a1d16 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -309,12 +309,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.195"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.195"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.147"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.77"	if BR2_KERNEL_HEADERS_4_19
-	default "5.2.19"	if BR2_KERNEL_HEADERS_5_2
-	default "5.3.4"		if BR2_KERNEL_HEADERS_5_3
+	default "4.4.196"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.196"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.149"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.79"	if BR2_KERNEL_HEADERS_4_19
+	default "5.2.21"	if BR2_KERNEL_HEADERS_5_2
+	default "5.3.6"		if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
