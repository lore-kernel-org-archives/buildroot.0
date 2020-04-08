From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 15:45:46 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 5, 6}.x series
Message-ID: <20200408133829.1ACEE8DF9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3136ae1b275b18403d6a2d9a26269b5f9818293
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 79c640e2e0d15e430a94915f48826b955f83cb63)
[Peter: drop 5.5.x / 5.6.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 718b209335..43fcbea157 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.27" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.30" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 91d9aeb4fc..0c3daa432d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  19b9cd362d647f2529c5ffc02ede52ac6b517eb685481b9cd00f7de3d30dec6b  linux-5.4.27.tar.xz
+sha256  11dd78f701bce619d90d3b2ee597601716c48087e159c890c1decd7b90349def  linux-5.4.30.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  fdeac4c05fcca993927fdce51446b4f81725f54e753fea02b0b2dacf3d64526f  linux-4.4.217.tar.xz
-sha256  6fb2a54602ebf750a39ba9750dc8d3bc34308518647f5bd2f562dee4d2566819  linux-4.9.217.tar.xz
-sha256  4c223ca3565d4267b403f7432860d87c8301767eb654d046d268782b18155189  linux-4.14.174.tar.xz
-sha256  24c2b11cc0ed57a90de776436efc21dd4345583b1a25d92ed49e71031fc73e7a  linux-4.19.112.tar.xz
+sha256  ea68cb8e9fa255bb1d0402c5aa8f26984f9b1c8607ff3bed5d3284109167f063  linux-4.4.218.tar.xz
+sha256  df3a6e615ec4c57b04775e9c018c67045223ac662e696d28fd37baa5114349cd  linux-4.9.218.tar.xz
+sha256  cb440ac5d20071dcb482e5062958514064b0c5a8375c92653062ea201ae0222c  linux-4.14.175.tar.xz
+sha256  1e40a0dc6afc95a259f97b80d5f5ef8f89e2ee49e993ba6844e2bc55de361f0e  linux-4.19.114.tar.xz
 # Locally computed
 sha256  18f9ddba0b777d1942d6c81877ba97c4bcd08488e2c409e57dcce866b9de5fc2  linux-cip-4.19.98-cip19.tar.gz
 sha256  7d5aeb67da41dc66ef28621ef994ef4403e8b1f5c3df38b1843da20972444280  linux-cip-4.19.98-cip19-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 00a796fb93..8a12889ec0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -318,11 +318,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.217"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.217"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.174"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.112"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.27"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.218"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.218"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.175"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.114"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.30"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
