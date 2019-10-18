From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Oct 2019 05:59:54 +0200
Subject: [Buildroot] [PATCH 2/2] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.3.x series
In-Reply-To: <20191018035954.8275-1-bernd.kuhls@t-online.de>
References: <20191018035954.8275-1-bernd.kuhls@t-online.de>
Message-ID: <20191018035954.8275-2-bernd.kuhls@t-online.de>
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
index db4d49bccb..35c2829e42 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.3.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.3.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 7ef711e1ed..5c57b5ad32 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 e84021a94784de7bb10e4251fb1a87859a8d1c97bd78fb55ad47ab6ce475ec1f  linux-5.3.6.tar.xz
+sha256 c6c9714e21531c825c306b107bc6f6c7bfa2d5270a14bad170f8de5a73d34802  linux-5.3.7.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 f1143564364f278ba0893a7813afc02da6ecef6d5de147bd5011aa3cc1634b34  linux-4.19.79.tar.xz
-sha256 e69dabd2368440ce1650cda0cf043e1ba3f3343f940a43b68e761739fcb3f296  linux-4.14.149.tar.xz
-sha256 e0ab12b04a975630ece2142a1ac15cfe45140b8c3359226b035c15ca7c92c6ef  linux-4.9.196.tar.xz
-sha256 169e3f07701336138905bdedd22a0089b45e2e53b9aa6d2ed6c44f215476a76d  linux-4.4.196.tar.xz
+sha256 80a9ba764e088aa7fddfef5a97c0236905e291468a37832243b6f3828d36e7ec  linux-4.19.80.tar.xz
+sha256 65c5a4b86b858ba58642f46ae8c983990376d1946e59cc7e054e85b1b7eb57b0  linux-4.14.150.tar.xz
+sha256 553568b6728d505da70efa8247a66ad158e849c8f5f40d715612ef4e9ed14a0c  linux-4.9.197.tar.xz
+sha256 9cf484511e51861486d2eafc7373f9e47f9c1f50a82e30614073b51570a0ee7a  linux-4.4.197.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5e4df4c9e9..9992ab5b5a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,11 +305,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.196"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.196"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.149"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.79"	if BR2_KERNEL_HEADERS_4_19
-	default "5.3.6"		if BR2_KERNEL_HEADERS_5_3
+	default "4.4.197"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.197"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.150"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.80"	if BR2_KERNEL_HEADERS_4_19
+	default "5.3.7"		if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
