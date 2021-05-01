From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 May 2021 13:14:43 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 10, 11}.x series
Message-ID: <20210501115434.1BA79865D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c63cec39008803c5bfc287c0ba5e033e5e875c9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bcf5fba0863befcf0e4da152acdbcefeed5c9e80)
[Peter: drop 5.11.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index fdfd22889e..2ee5b700d3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.25" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.32" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0d2db68882..86078b9ea7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  930ae76b9a3b64b98802849aca332d17a706f20595de21e1ae729b55ee461add  linux-5.10.25.tar.xz
-sha256  1c3cef545f366b56332c11c28d074c9d9148c28059a970ec8710826652237560  linux-5.4.107.tar.xz
+sha256  644f8e326e4cb8eac65f0874774c09ccf91cbe0b55eb8438c1e8711d3d07d7ba  linux-5.10.32.tar.xz
+sha256  be98f087cb58f23bc5edb8ee80a4794a569d48049d75b1a8eaef9f80fede9557  linux-5.4.114.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  d270c529910aefa70f7eeaafe313588b9949cfde33a5553bd4cd1a1249c4e97b  linux-4.4.262.tar.xz
-sha256  b22e764095362d9e63d76375db838d9372474ba5cbe6132c9a8b07f7533f07ff  linux-4.9.262.tar.xz
-sha256  7adc041af81424ff8d68affe3005fa9e5babc4e84e0b07e4effdf54225ba9426  linux-4.14.226.tar.xz
-sha256  05db750ba01ad557bef50835c253894fad9fb0db2224f0e803b25e2ff7ab2365  linux-4.19.182.tar.xz
+sha256  44f3b35848cc07bba91e845b8d232af4ed48dc8855751820c8f405aa5d1266e2  linux-4.4.267.tar.xz
+sha256  983b9afe69df31de8984d40a88afec38d617322d6521ef714db36b3e56220a60  linux-4.9.267.tar.xz
+sha256  573b79adee3490a8dd82f663bb187218288c99cd2613fd9f69edf915f91e6682  linux-4.14.231.tar.xz
+sha256  b09cf1f026b1260bae6480d98c471958eff3ad64b65e59e64a6852f678050077  linux-4.19.188.tar.xz
 # Locally computed
 sha256  9f1de83c5c2bb582a33bd4ee892d45671901cd06af9dc159f0f499f1b5265b20  linux-cip-4.19.182-cip45.tar.gz
 sha256  0eeba6d6ecc45cf8f16458842b64d22e7064b9de9c31c11d1c395b08a47e3855  linux-cip-4.19.165-cip41-rt18.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index caf8af67a8..8c01b32179 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,12 +346,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.262"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.262"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.226"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.182"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.107"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.25"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.267"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.267"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.231"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.188"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.114"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.32"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
