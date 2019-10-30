From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 10:11:26 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.3.x series
Message-ID: <20191030090449.AADA78DEDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83e6a62dcbd061c2c5945e02377bcbae5661b96a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e59d65073ffc8fc5ad5981719dc4b8fa51b8761c)
[Peter: drop 5.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0fe5b9d3f5..93664f7aaa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.79" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.80" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index e0a017e4b1..fb2f122ca5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 f1143564364f278ba0893a7813afc02da6ecef6d5de147bd5011aa3cc1634b34  linux-4.19.79.tar.xz
-sha256 e69dabd2368440ce1650cda0cf043e1ba3f3343f940a43b68e761739fcb3f296  linux-4.14.149.tar.xz
-sha256 e0ab12b04a975630ece2142a1ac15cfe45140b8c3359226b035c15ca7c92c6ef  linux-4.9.196.tar.xz
-sha256 169e3f07701336138905bdedd22a0089b45e2e53b9aa6d2ed6c44f215476a76d  linux-4.4.196.tar.xz
+sha256 80a9ba764e088aa7fddfef5a97c0236905e291468a37832243b6f3828d36e7ec  linux-4.19.80.tar.xz
+sha256 65c5a4b86b858ba58642f46ae8c983990376d1946e59cc7e054e85b1b7eb57b0  linux-4.14.150.tar.xz
+sha256 553568b6728d505da70efa8247a66ad158e849c8f5f40d715612ef4e9ed14a0c  linux-4.9.197.tar.xz
+sha256 9cf484511e51861486d2eafc7373f9e47f9c1f50a82e30614073b51570a0ee7a  linux-4.4.197.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f8edb77090..6cdecc8bc2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.196"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.196"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.149"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.79"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.197"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.197"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.150"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.80"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
