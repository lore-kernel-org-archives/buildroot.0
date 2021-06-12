From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Jun 2021 13:43:42 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 10, 11, 12}.x series
Message-ID: <20210612114342.10118-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c893c8dc82..035699663c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.12.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.12.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6a103e31a9..d7493545ef 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  5a60feee8492732a6aa8c46b9412563959945b4d7b0d27223f15ede2f84b6873  linux-5.12.4.tar.xz
-sha256  366ba5bb00be28b604aac630c4f64301063892f27353b299177c396af0ad877f  linux-5.11.21.tar.xz
-sha256  a8d5e3309dafc484eb70f94747a6efffa29a79bae651ae126333e913c00be077  linux-5.10.37.tar.xz
-sha256  71e7decf1e8149a8aed88d30df4f2a62a6c6b168111de6b261685ac7c0ecb2a0  linux-5.4.119.tar.xz
+sha256  c8d499fc53ed14838994ec2f51591ae40d64cce68559cd897be8acbeeee7630f  linux-5.12.10.tar.xz
+sha256  11027c6114eb916edbcc37897226fb6263b2931911d2d5093550473ce1a57600  linux-5.11.22.tar.xz
+sha256  83b81e433ba2f8ee143064fb163699ee857e26dd789006bc1e9edf1ccd0bd403  linux-5.10.43.tar.xz
+sha256  17ee750a4aeb1c883d721e730d1f7e2855124585e2f47766864a1359a7ebe33c  linux-5.4.125.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  6817ad26e1621bfad48d08b638f66c5933e89c7c8c00d43195b2e0ae260233eb  linux-4.4.268.tar.xz
-sha256  5b66f6ce0137fb8d81004bcf2f1e3cbe01c38aab74268656c4ba015c1ccd762a  linux-4.9.268.tar.xz
-sha256  1dc19361f6970bc94cc62be066702483db9cbd3d63f3089a8c90dabfced74369  linux-4.14.232.tar.xz
-sha256  6f9c2aee8553129d2bdbab646bbf7e88c2a5c38c0b1450f2e728831681bfc85d  linux-4.19.190.tar.xz
+sha256  d13fa552be602825c443fcca90d6bdd72f4ebef809889ef015dba4593d3224ab  linux-4.4.272.tar.xz
+sha256  f8bf0c390ae40ca736e104f10f744446bc534bf87ba1b6dbb2b7c9a8bece1058  linux-4.9.272.tar.xz
+sha256  e4eae297a6fefefd8ce4781d98178a7c1ee51ca0a4c8a7e46e61b121fbab8b2a  linux-4.14.236.tar.xz
+sha256  aaaebdccf599f77148fe170642fa7dc2452cf994b5cbbb4d39cab9e7f4058896  linux-4.19.194.tar.xz
 # Locally computed
 sha256  9f1de83c5c2bb582a33bd4ee892d45671901cd06af9dc159f0f499f1b5265b20  linux-cip-4.19.182-cip45.tar.gz
 sha256  0eeba6d6ecc45cf8f16458842b64d22e7064b9de9c31c11d1c395b08a47e3855  linux-cip-4.19.165-cip41-rt18.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b68567deeb..8eb12c545c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -362,14 +362,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.268"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.268"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.232"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.190"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.119"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.37"	if BR2_KERNEL_HEADERS_5_10
-	default "5.11.21"	if BR2_KERNEL_HEADERS_5_11
-	default "5.12.4"	if BR2_KERNEL_HEADERS_5_12
+	default "4.4.272"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.272"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.236"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.194"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.125"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.43"	if BR2_KERNEL_HEADERS_5_10
+	default "5.11.22"	if BR2_KERNEL_HEADERS_5_11
+	default "5.12.10"	if BR2_KERNEL_HEADERS_5_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
