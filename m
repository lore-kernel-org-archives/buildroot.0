From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Apr 2020 17:19:34 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.4.x series
Message-ID: <20200406150559.BCC2482261@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4762644078e264d938232b743e47567ad6b74fd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit caaee4fd66a111a3c58840a0d01b2812d70a2e90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7d1cc576d7..72230f1a61 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.23" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.27" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index c8ddabde86..91d9aeb4fc 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  3f28aacdf5deddfdf80bb949884699b96053a3548dc3434552d30dc0bc781eca  linux-5.4.23.tar.xz
+sha256  19b9cd362d647f2529c5ffc02ede52ac6b517eb685481b9cd00f7de3d30dec6b  linux-5.4.27.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  28bcd3d4201da9feefdf3bcd65c516dd674acbbf45681ce3c7d784c53b33fe03  linux-4.4.215.tar.xz
-sha256  236f2f47853700f22b9925cb17917d97ff7120fcc8110ec827c5a030a8129f48  linux-4.9.215.tar.xz
-sha256  2318a1ab937580a079351ed20557c336a3d95b664f667b14e3ba49e3271b217a  linux-4.14.172.tar.xz
-sha256  654bac198d38e03e7bff9e2642b01f498dc0fa5d06198edd14bc30fe7fbf0240  linux-4.19.107.tar.xz
+sha256  fdeac4c05fcca993927fdce51446b4f81725f54e753fea02b0b2dacf3d64526f  linux-4.4.217.tar.xz
+sha256  6fb2a54602ebf750a39ba9750dc8d3bc34308518647f5bd2f562dee4d2566819  linux-4.9.217.tar.xz
+sha256  4c223ca3565d4267b403f7432860d87c8301767eb654d046d268782b18155189  linux-4.14.174.tar.xz
+sha256  24c2b11cc0ed57a90de776436efc21dd4345583b1a25d92ed49e71031fc73e7a  linux-4.19.112.tar.xz
 # Locally computed
 sha256  18f9ddba0b777d1942d6c81877ba97c4bcd08488e2c409e57dcce866b9de5fc2  linux-cip-4.19.98-cip19.tar.gz
 sha256  7d5aeb67da41dc66ef28621ef994ef4403e8b1f5c3df38b1843da20972444280  linux-cip-4.19.98-cip19-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3fd8010a04..00a796fb93 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -318,11 +318,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.215"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.215"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.172"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.107"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.23"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.217"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.217"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.174"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.112"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.27"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
