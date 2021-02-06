From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Feb 2021 12:53:19 +0100
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4,
 10}.x 4.{4, 9, 14, 19} series
Message-ID: <20210206115319.1442990-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please note that the bump of kernel 4.4 and 4.9 to 4.x.256 can cause
problems:

https://lkml.org/lkml/2021/2/5/747
https://cdn.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.4.256

https://lkml.org/lkml/2021/2/5/862
https://cdn.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.9.256

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 267b113532..f0515632e5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 52d2066081..5be6795b6b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  02ef2b56b00fc5145701c603a5235e1265772e40d488a936b27ba65fe78e710f  linux-5.10.11.tar.xz
-sha256  d37449403664cc3b1bac96d0d9a199dbe619885cd899c0ae3108843f42e3d522  linux-5.4.93.tar.xz
+sha256  06698c0ce35ceefa9b79ceb108ec7fb86de05f51fe615f3ae5cc82e293dfe1f2  linux-5.10.13.tar.xz
+sha256  030ae544f346bfa2ce619dd9e17e93d10ec393632d3b6d6cf5d1fc84b914d449  linux-5.4.95.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  661e98b9448cbac948c705fd44cd7d30200422ee1cb02950d142aa99a1b3985a  linux-4.4.253.tar.xz
-sha256  9a5b51a8350201bd38e3ff13909323a6571b4572a7b3caed76e462b07619bc18  linux-4.9.253.tar.xz
-sha256  62a36a25431016d98d0f1cff98be432086c51f86fd79042bd10a867b3a924d11  linux-4.14.217.tar.xz
-sha256  f4e352fe0eb986e5b532b99d9b0725a67046cbb3e5f53fcd5b098cbaeb2ac60a  linux-4.19.171.tar.xz
+sha256  486d2a6ee0175c795ff94eb1fb98612650577a29ebeecd32d85b56008977fbfc  linux-4.4.256.tar.xz
+sha256  c48b11c9ca1312632ac3e039be43d975cdac31ba9e78d94b0afb37532ad91497  linux-4.9.256.tar.xz
+sha256  75eecaa731c091fcf3bc2ec914b01d299a447d78041cb66a11a2ab169eb801dd  linux-4.14.219.tar.xz
+sha256  d2fdd236e6f31aa8e939f4a686c95417d8571bde3d091fc6a2535937c144195f  linux-4.19.173.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b47ac8bb44..9dd41e1dad 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,12 +346,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.253"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.253"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.217"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.171"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.93"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.11"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.256"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.256"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.219"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.173"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.95"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.13"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.29.2
