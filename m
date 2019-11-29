From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 16:37:28 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.3.x series
Message-ID: <20191129152940.16F6F8295B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7909b057ef98ebe09563ee85a8e401dde2be4532
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2e5d631f8f170ccd67338ae99d0a23ed74a4d3ca)
[Peter: drop 5.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e5de09c8c9..57eb9c8710 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.84" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.85" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 2dc7b75291..efda7941bf 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 868b4a92619cb00ab142a20a67f000525b9605820d1b66faa4a183133eac0660  linux-4.19.84.tar.xz
-sha256 86de4a24379a78d67fc08b2e249ccf7b689eb6c37fbe329fc3dfbe8ab4300603  linux-4.14.154.tar.xz
-sha256 383fd43bd35251636232912ad52fbc844e3c8ab792cadb62b4aefe000bacbd88  linux-4.9.201.tar.xz
-sha256 a78a85c4fb0c0835b01933765c984ab5ab190eac1d521338fb88b03a49641388  linux-4.4.201.tar.xz
+sha256 fdacceeae22d1a0467cae50c15e6e754bfb8bb8e8010623df0d8fd78f4adb929  linux-4.4.202.tar.xz
+sha256 8108ec1cd10fc40821c84e9f087dba10b1767aad66596f4a36925faef55e4ebf  linux-4.9.202.tar.xz
+sha256 77d61979556b81c95b81452fa10e1fe9368cbe2f9f80a13e4669b0464722e481  linux-4.14.155.tar.xz
+sha256 7bf435970aeeafd46263f49730087a61c4858d8b8fc5a4002ceac971b45f4fb7  linux-4.19.85.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1d155be136..92c724bd65 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.201"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.201"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.154"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.84"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.202"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.202"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.155"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.85"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
