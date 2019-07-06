From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 00:11:10 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.1.x series
Message-ID: <20190706221237.A0A4388431@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a7421468192a8e67824f32fd48130d5b837a6a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop 5.1.x bump]
(cherry picked from commit abc782c0b3be3b4d5346a23ac46b8417ff8a900c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9ff8069f6e..0f04962ee5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.52" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.56" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index dc1a916d03..6d02218926 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 266ee655620c3689ae94761970d6827fffc919760caf815427ad22730ba4381e  linux-4.19.52.tar.xz
-sha256 d7464c2379cdee46548ae9f848671f4669d4003af4034f3f738f2f0511ec75b3  linux-4.14.127.tar.xz
-sha256 b16e12681a0638368479d73a9b1b8e9407c1ae4b7ae52fdf236d9e5657999695  linux-4.9.182.tar.xz
-sha256 c409d88f61cd9a37cbba36d5d9c8162263eb1e5c9380efaf880a3ec10cd88527  linux-4.4.182.tar.xz
+sha256 7326943215b9496f302e95892457a63d9a77e0446e99dd7bade6b425bc966bdf  linux-4.19.56.tar.xz
+sha256 19f6404c30f4a9a1fe3315b902676b6d63a470be5d55cf2a0e47983c643c8ff5  linux-4.14.131.tar.xz
+sha256 6543232fc082485c1088830b9456e1a6e511239e4bf98817b0166ee62cafc3ca  linux-4.4.184.tar.xz
+sha256 033114d5350525dede995d31b596c31b0e26db8d77a0a1c53d36cdc36ead9faf  linux-4.9.184.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 52f7d843fe..9b3111c519 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.182"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.182"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.127"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.52"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.184"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.184"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.131"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.56"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
