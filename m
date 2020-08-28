From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 21:01:01 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 7}.x series
Message-ID: <20200828190101.6779-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 05727a88a7..7c2ede8ce2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -124,7 +124,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.7.17" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.7.19" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 638947ac9e..fbda638da6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  cc8c3611c9bdcd29266b2606ab6c3a07a32fb64fd7f1cd731100e4eddb565225  linux-5.7.17.tar.xz
-sha256  add2ab2385c40fc9a3dfebe403e56da8500b633dc7dc42cf0c670c61d151a223  linux-5.4.60.tar.xz
+sha256  419c6248b9ae4dfead4599787aecbfd202e88bc4124523adfa6dd2d642b99fe7  linux-5.7.19.tar.xz
+sha256  86f13d050f6389c5a1727fa81510ee8eceac795297bc584f443354609617fea4  linux-5.4.61.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  97e689dd083d780bf7bacdc17c0a9ec9e9be118507dccedf4b77eef9666ce7fc  linux-4.4.233.tar.xz
-sha256  2a6dcab0652ab181820d56b6014235a125cf933e0edf5bdbc038160fa9e7aca5  linux-4.9.233.tar.xz
-sha256  3ea4d0221a071d58703cd346a8a6ef1582a32a8c4565a4919578817444d4fae0  linux-4.14.194.tar.xz
-sha256  a4421dea5333beeaaef81312c6f415330b9e4fda6027f399a1c55f97d3da2114  linux-4.19.141.tar.xz
+sha256  6994dda988e9fb7f5661cf80ff42039016cb0044acd39f830937ba0220296388  linux-4.4.234.tar.xz
+sha256  756f8544d261e8117716c911261690e4fb5491e14c1f4612c83e0986453782e3  linux-4.9.234.tar.xz
+sha256  394f28798670240baacd9e2cce521fbd79f8da5e1fc191695b0e11381445a021  linux-4.14.195.tar.xz
+sha256  6912db1c242d72ce9c8d4ff71982ac935d97690822af5c1c6ec22412b31667a4  linux-4.19.142.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2480fb11c0..a04866d8cb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -334,12 +334,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.233"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.233"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.194"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.141"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.60"	if BR2_KERNEL_HEADERS_5_4
-	default "5.7.17"	if BR2_KERNEL_HEADERS_5_7
+	default "4.4.234"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.234"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.195"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.142"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.61"	if BR2_KERNEL_HEADERS_5_4
+	default "5.7.19"	if BR2_KERNEL_HEADERS_5_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
