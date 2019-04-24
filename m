From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 21:16:00 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.0.x series
Message-ID: <20190424191119.0D54F826D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=707529b7f7d7a80018cae5fec795dd36cc06fa8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8013f2b42a..65d4838075 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.0.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.0.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 993cccdcfb..4232ba1054 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 16e177662b9fc7255bfc51018513979f6effcbe52e459c543aa83a5b15ef54ec  linux-5.0.7.tar.xz
+sha256 0748b1375bf884db1bddc9ebdc8dcf1c45d828d8ba6839f9f7d8a033b905ba58  linux-5.0.9.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 dd795e2a1fddbee5b03c3bb55a1926829cc08df4fdcabce62dda717ba087b8cc  linux-4.19.34.tar.xz
-sha256 f8197d56553f864d1d2e97abbe4fca50f8ab5e72089c292d22f0e4395340a6e8  linux-4.14.111.tar.xz
-sha256 4d451c21effad77de323edc9bfeae095aa1faed1a801ef427d66f5763bef091e  linux-4.9.168.tar.xz
+sha256 b808b508177f9d288d94a3b9df7b01d5eac9fcc1804a794c913b2144de63f2bc  linux-4.19.36.tar.xz
+sha256 b24df2e37faaf2290999c507f9e29de98494f52429bcd35513c5b3e52eaddac2  linux-4.14.113.tar.xz
+sha256 33887b40fc8e0b71f423bb7afe112a4ae190378145f4a3f3892c563b7e43131d  linux-4.9.170.tar.xz
 sha256 c3598c22b7994b3bebc3059e8ab85bc212c53550eb401baab3f29f8d007a043d  linux-4.4.178.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 91b8411b32..530289c291 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -294,11 +294,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.178"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.168"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.111"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.34"	if BR2_KERNEL_HEADERS_4_19
+	default "4.9.170"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.113"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.36"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
-	default "5.0.7"		if BR2_KERNEL_HEADERS_5_0
+	default "5.0.9"		if BR2_KERNEL_HEADERS_5_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
