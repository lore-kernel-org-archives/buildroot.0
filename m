From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Oct 2019 10:20:10 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{2, 3}.x series
Message-ID: <20191029091346.29A8C8CA4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d75c93fdb220b82b4b393dc64b5dee26facf178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 32042f42cb1706f57033d47c203f7abfb6abd21a)
[Peter: drop 5.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e343c4a41d..0fe5b9d3f5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.77" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.79" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index f5f2b7698d..e0a017e4b1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 612b69cc494f2da1530bacac17291339e272cde7f2a7669e615f565506d5f3a9  linux-4.19.77.tar.xz
-sha256 8fd793688c9d9d4e26fdc175be92b6e638b6a86f4150dd66edecebab0bb85b12  linux-4.14.147.tar.xz
-sha256 54be562a2da16eecd612f641146dc099c1aa05c0fc559c971bdfde161c929d68  linux-4.9.195.tar.xz
-sha256 c2a42e0527c33cd663dde6aceb4c432d75b6e3f9f7ffcd40a07556f8c05734b6  linux-4.4.195.tar.xz
+sha256 f1143564364f278ba0893a7813afc02da6ecef6d5de147bd5011aa3cc1634b34  linux-4.19.79.tar.xz
+sha256 e69dabd2368440ce1650cda0cf043e1ba3f3343f940a43b68e761739fcb3f296  linux-4.14.149.tar.xz
+sha256 e0ab12b04a975630ece2142a1ac15cfe45140b8c3359226b035c15ca7c92c6ef  linux-4.9.196.tar.xz
+sha256 169e3f07701336138905bdedd22a0089b45e2e53b9aa6d2ed6c44f215476a76d  linux-4.4.196.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 02c23947c2..f8edb77090 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.195"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.195"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.147"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.77"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.196"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.196"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.149"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.79"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
