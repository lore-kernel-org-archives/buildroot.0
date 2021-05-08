From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat,  8 May 2021 23:07:02 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.19.x / 5.{4, 10,
 11, 12}.x series
Message-ID: <20210508210702.24898-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7f1d9e3342..02c6ba0400 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.12.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 517cdf4c9b..e24e02b30e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  7d0df6f2bf2384d68d0bd8e1fe3e071d64364dcdc6002e7b5c87c92d48fac366  linux-5.12.tar.xz
-sha256  41dd9e533e0387e41e9d17244e3b4f3fe6fdff2f82b4198ee363552f0b6ad4a3  linux-5.11.17.tar.xz
-sha256  933fdbc36371c0f830b7a6a957a559fca2dad1cc0eaa852ef42fb168185b4315  linux-5.10.33.tar.xz
-sha256  5b4724748527a622a886232b5da1471619eb3aa3bb38a11851275eba09989dd2  linux-5.4.115.tar.xz
+sha256  8c98b9996d15fdb779a866c6a4c7c9b9e63374cb7105a5a59e9bcf8df02ef70d  linux-5.12.2.tar.xz
+sha256  5aee19ad466b5bbbde642077f42bfaafff4e612296bdd7946faa01d917472b4b  linux-5.11.19.tar.xz
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
index e4ddeee346..3d8fb1ab5b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -365,11 +365,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.268"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.268"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.232"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.189"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.115"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.33"	if BR2_KERNEL_HEADERS_5_10
-	default "5.11.17"	if BR2_KERNEL_HEADERS_5_11
-	default "5.12"		if BR2_KERNEL_HEADERS_5_12
+	default "4.19.190"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.117"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.35"	if BR2_KERNEL_HEADERS_5_10
+	default "5.11.19"	if BR2_KERNEL_HEADERS_5_11
+	default "5.12.2"	if BR2_KERNEL_HEADERS_5_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
