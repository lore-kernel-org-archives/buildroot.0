From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 14:48:46 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19, 20}.x / 5.0.x series
Message-ID: <20190329134850.2855588335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99298ec02d7207deb2c1a5634464123ec37191f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Notice: 4.20.x is now EOL.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop 5.0.x bump]
(cherry picked from commit 198b4cff10aa7e25bac28b54721638119e8fd1f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 037a2f023e..160f0c6311 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.25" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.32" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.171-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index d7ddd1c877..e1678107b6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 1cf544308195250805e0731c716691bea4c1ed29e03e6f9ae5be6dc16785a504  linux-4.20.12.tar.xz
-sha256 7ec71d90d6e96e6f741676d157ac06f30c75be4eaf1649143a3c8b7d4f919731  linux-4.19.25.tar.xz
-sha256 7aa43e34e4c9e5965da29cef5ae196e06006f8c0d1d65fd755a2f197f0796a11  linux-4.14.103.tar.xz
-sha256 c09af067af62d299f5e33c279968de58c88fb7c59bd05e8f3bb460f611f60515  linux-4.9.160.tar.xz
-sha256 27da5401aa691762f3361c143f453877f499c02ea6c9c743b09538cb1af1c75d  linux-4.4.176.tar.xz
+sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
+sha256 a326d1154324aee3dd9a25ac44bc4ce7242ded097d4ca2e4c131e6f32918e7d9  linux-4.19.32.tar.xz
+sha256 3764f165f779568745f1468d8f7e1db65d94eae9cd8d1350f4fe003a0fd88ee0  linux-4.14.109.tar.xz
+sha256 b8f87c087cbc35d35d55cae1c0c7e47c8d20226d241697bf5d4c0c524439baeb  linux-4.9.166.tar.xz
+sha256 521721c47f580f7adb4a66c9ee9f5e2fda4b9a0f86d4d7f3e888ba0b53edc0bf  linux-4.4.177.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 15574689fa..0ead7e538f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,11 +287,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.176"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.160"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.103"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.25"	if BR2_KERNEL_HEADERS_4_19
-	default "4.20.12"	if BR2_KERNEL_HEADERS_4_20
+	default "4.4.177"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.166"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.109"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.32"	if BR2_KERNEL_HEADERS_4_19
+	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
