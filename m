From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 10:05:03 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 5, 6}.x series
Message-ID: <20200508080227.8328B90FE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3788e762d802ed6d61f65e7bf757f046592b627b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Notice: 5.5.x is now EOL, so should be dropped at the next version bump.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: drop 5.5.x / 5.6.x bump]
(cherry picked from commit 72a6e50da9585d632e70c3f668857f45601088fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c367b33378..bdf3c26326 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.31" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.35" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index f6bad5c8ec..3226a2fafb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  a11083f8f809887f6a0f8d4467532385b99418f17998fe6e837807491c276eeb  linux-5.4.31.tar.xz
+sha256  e16bd5f7284a80a41328bf712e1136b0adf5b71cc0bd263efa7cac75539806d4  linux-5.4.35.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  ea68cb8e9fa255bb1d0402c5aa8f26984f9b1c8607ff3bed5d3284109167f063  linux-4.4.218.tar.xz
-sha256  df3a6e615ec4c57b04775e9c018c67045223ac662e696d28fd37baa5114349cd  linux-4.9.218.tar.xz
-sha256  cb440ac5d20071dcb482e5062958514064b0c5a8375c92653062ea201ae0222c  linux-4.14.175.tar.xz
-sha256  1e40a0dc6afc95a259f97b80d5f5ef8f89e2ee49e993ba6844e2bc55de361f0e  linux-4.19.114.tar.xz
+sha256  4e98b51c2e3a8fd069dc941b9cb68594f84ea767c2927e93255e1151c5c2fdd6  linux-4.4.219.tar.xz
+sha256  6b17238cced3e1c2753d6d5b4f662bd347d4651f07c35506b849eb10aea7bc44  linux-4.9.219.tar.xz
+sha256  bcae0956baaeb55dab5bad0401873fbc5baaa7fbe957ea6d27a5ab241cec5ca2  linux-4.14.176.tar.xz
+sha256  89749365f9dafa6c62cc5e920a7e532ed4aad9ab766fb436423b153ffbc08c96  linux-4.19.118.tar.xz
 # Locally computed
 sha256  18f9ddba0b777d1942d6c81877ba97c4bcd08488e2c409e57dcce866b9de5fc2  linux-cip-4.19.98-cip19.tar.gz
 sha256  7d5aeb67da41dc66ef28621ef994ef4403e8b1f5c3df38b1843da20972444280  linux-cip-4.19.98-cip19-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fde769e6a3..598d5a8853 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -318,11 +318,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.218"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.218"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.175"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.114"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.31"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.219"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.219"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.176"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.118"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.35"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
