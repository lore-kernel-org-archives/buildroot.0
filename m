From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:35:15 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] {linux,
 linux-headers}: bump 5.{4, 10, 11, 12}.x series
Message-ID: <20210517210900.4452F83A58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c25dd7eda5e8b5163586af2d5b30fe8d289e2978
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ab6dbf1c9f0f01684030fd7272179b126ba43e8c)
[Peter: drop 5.11.x/5.12.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2eef1f0838..4dd82ee639 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.35" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.37" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ea0b0bb317..dd4842dd51 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  ac37a19d45b77a87e58e3aae8b127a6e7eb85ed7467fc8e58474b387bfd498fd  linux-5.10.35.tar.xz
-sha256  4e989b5775830092e5c76b5cca65ebff862ad0c87d0b58c3a20d415c3d4ec770  linux-5.4.117.tar.xz
+sha256  a8d5e3309dafc484eb70f94747a6efffa29a79bae651ae126333e913c00be077  linux-5.10.37.tar.xz
+sha256  71e7decf1e8149a8aed88d30df4f2a62a6c6b168111de6b261685ac7c0ecb2a0  linux-5.4.119.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  6817ad26e1621bfad48d08b638f66c5933e89c7c8c00d43195b2e0ae260233eb  linux-4.4.268.tar.xz
 sha256  5b66f6ce0137fb8d81004bcf2f1e3cbe01c38aab74268656c4ba015c1ccd762a  linux-4.9.268.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dd521b4cb6..31191186b3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -350,8 +350,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.268"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.232"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.190"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.117"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.35"	if BR2_KERNEL_HEADERS_5_10
+	default "5.4.119"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.37"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
