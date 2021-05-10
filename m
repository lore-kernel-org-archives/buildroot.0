From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 11:27:24 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 11, 12}.x series
Message-ID: <20210510085931.0701086D85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b93c89f24328bb50c9baeed3c0a60e4ab2cec78e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b50cc77a094b26344aead7e1b23672884155b3d9)
[Peter: drop 5.11.x/5.12.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 92c2a09415..2eef1f0838 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.33" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.35" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 81952b2d81..ea0b0bb317 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  933fdbc36371c0f830b7a6a957a559fca2dad1cc0eaa852ef42fb168185b4315  linux-5.10.33.tar.xz
-sha256  5b4724748527a622a886232b5da1471619eb3aa3bb38a11851275eba09989dd2  linux-5.4.115.tar.xz
+sha256  ac37a19d45b77a87e58e3aae8b127a6e7eb85ed7467fc8e58474b387bfd498fd  linux-5.10.35.tar.xz
+sha256  4e989b5775830092e5c76b5cca65ebff862ad0c87d0b58c3a20d415c3d4ec770  linux-5.4.117.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  6817ad26e1621bfad48d08b638f66c5933e89c7c8c00d43195b2e0ae260233eb  linux-4.4.268.tar.xz
 sha256  5b66f6ce0137fb8d81004bcf2f1e3cbe01c38aab74268656c4ba015c1ccd762a  linux-4.9.268.tar.xz
 sha256  1dc19361f6970bc94cc62be066702483db9cbd3d63f3089a8c90dabfced74369  linux-4.14.232.tar.xz
-sha256  717b0e5df07ebbc0575d834e0c15c0e45060e771baa15b705e391ba38bc54389  linux-4.19.189.tar.xz
+sha256  6f9c2aee8553129d2bdbab646bbf7e88c2a5c38c0b1450f2e728831681bfc85d  linux-4.19.190.tar.xz
 # Locally computed
 sha256  9f1de83c5c2bb582a33bd4ee892d45671901cd06af9dc159f0f499f1b5265b20  linux-cip-4.19.182-cip45.tar.gz
 sha256  0eeba6d6ecc45cf8f16458842b64d22e7064b9de9c31c11d1c395b08a47e3855  linux-cip-4.19.165-cip41-rt18.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d03d699091..dd521b4cb6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -349,9 +349,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.268"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.268"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.232"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.189"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.115"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.33"	if BR2_KERNEL_HEADERS_5_10
+	default "4.19.190"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.117"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.35"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
