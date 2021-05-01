From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 May 2021 14:19:12 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 10, 11}.x series
Message-ID: <20210501115434.D4C5C86732@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ee0c8ef861872985cf91829347f012f4d5979cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 607e7fd7a83390b107c2f4a05efaafa02dad9a53)
[Peter: drop 5.11.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2ee5b700d3..92c2a09415 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.32" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.33" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 86078b9ea7..81952b2d81 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  644f8e326e4cb8eac65f0874774c09ccf91cbe0b55eb8438c1e8711d3d07d7ba  linux-5.10.32.tar.xz
-sha256  be98f087cb58f23bc5edb8ee80a4794a569d48049d75b1a8eaef9f80fede9557  linux-5.4.114.tar.xz
+sha256  933fdbc36371c0f830b7a6a957a559fca2dad1cc0eaa852ef42fb168185b4315  linux-5.10.33.tar.xz
+sha256  5b4724748527a622a886232b5da1471619eb3aa3bb38a11851275eba09989dd2  linux-5.4.115.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  44f3b35848cc07bba91e845b8d232af4ed48dc8855751820c8f405aa5d1266e2  linux-4.4.267.tar.xz
-sha256  983b9afe69df31de8984d40a88afec38d617322d6521ef714db36b3e56220a60  linux-4.9.267.tar.xz
-sha256  573b79adee3490a8dd82f663bb187218288c99cd2613fd9f69edf915f91e6682  linux-4.14.231.tar.xz
-sha256  b09cf1f026b1260bae6480d98c471958eff3ad64b65e59e64a6852f678050077  linux-4.19.188.tar.xz
+sha256  6817ad26e1621bfad48d08b638f66c5933e89c7c8c00d43195b2e0ae260233eb  linux-4.4.268.tar.xz
+sha256  5b66f6ce0137fb8d81004bcf2f1e3cbe01c38aab74268656c4ba015c1ccd762a  linux-4.9.268.tar.xz
+sha256  1dc19361f6970bc94cc62be066702483db9cbd3d63f3089a8c90dabfced74369  linux-4.14.232.tar.xz
+sha256  717b0e5df07ebbc0575d834e0c15c0e45060e771baa15b705e391ba38bc54389  linux-4.19.189.tar.xz
 # Locally computed
 sha256  9f1de83c5c2bb582a33bd4ee892d45671901cd06af9dc159f0f499f1b5265b20  linux-cip-4.19.182-cip45.tar.gz
 sha256  0eeba6d6ecc45cf8f16458842b64d22e7064b9de9c31c11d1c395b08a47e3855  linux-cip-4.19.165-cip41-rt18.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8c01b32179..d03d699091 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,12 +346,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.267"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.267"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.231"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.188"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.114"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.32"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.268"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.268"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.232"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.189"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.115"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.33"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
