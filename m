From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Apr 2019 09:15:58 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.0.x series
Message-ID: <20190429071558.25301-1-peter@korsgaard.com>
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
index 65d4838075..c6f80e993a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.0.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.0.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 4232ba1054..1af2cb110f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 0748b1375bf884db1bddc9ebdc8dcf1c45d828d8ba6839f9f7d8a033b905ba58  linux-5.0.9.tar.xz
+sha256 ea1c1323c2c7e70bebf5463619b543f9bc353730b44ac62d9efadd4fe5625e76  linux-5.0.10.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 b808b508177f9d288d94a3b9df7b01d5eac9fcc1804a794c913b2144de63f2bc  linux-4.19.36.tar.xz
-sha256 b24df2e37faaf2290999c507f9e29de98494f52429bcd35513c5b3e52eaddac2  linux-4.14.113.tar.xz
-sha256 33887b40fc8e0b71f423bb7afe112a4ae190378145f4a3f3892c563b7e43131d  linux-4.9.170.tar.xz
-sha256 c3598c22b7994b3bebc3059e8ab85bc212c53550eb401baab3f29f8d007a043d  linux-4.4.178.tar.xz
+sha256 ecb0b30ec32c0c7d614c394158c7d37099a815507ed62235cca32052d7ff9c65  linux-4.19.37.tar.xz
+sha256 b75e1dcfabc8d18051a07cbf9b60eaee8ac470a2311fed20447fd0d022c19e15  linux-4.14.114.tar.xz
+sha256 431cd992bf74da9851dd5938dbe45ff7577219b84b237ae5e30067d483b57f01  linux-4.9.171.tar.xz
+sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 530289c291..78a14071ff 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -293,12 +293,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.178"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.170"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.113"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.36"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.171"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.114"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.37"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
-	default "5.0.9"		if BR2_KERNEL_HEADERS_5_0
+	default "5.0.10"	if BR2_KERNEL_HEADERS_5_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.11.0
