From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 22:31:44 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.0.x series
Message-ID: <20190414202935.78AE581597@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1d65493591d9f7699e4a7de2a00f8acdb292e4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ab5fbbd640a05076c0799d966f46409b70bf9b0e)
[Peter: drop 5.0.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 160f0c6311..87d7bd6264 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.32" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.34" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.171-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index e1678107b6..6c8209039b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 a326d1154324aee3dd9a25ac44bc4ce7242ded097d4ca2e4c131e6f32918e7d9  linux-4.19.32.tar.xz
-sha256 3764f165f779568745f1468d8f7e1db65d94eae9cd8d1350f4fe003a0fd88ee0  linux-4.14.109.tar.xz
-sha256 b8f87c087cbc35d35d55cae1c0c7e47c8d20226d241697bf5d4c0c524439baeb  linux-4.9.166.tar.xz
-sha256 521721c47f580f7adb4a66c9ee9f5e2fda4b9a0f86d4d7f3e888ba0b53edc0bf  linux-4.4.177.tar.xz
+sha256 dd795e2a1fddbee5b03c3bb55a1926829cc08df4fdcabce62dda717ba087b8cc  linux-4.19.34.tar.xz
+sha256 f8197d56553f864d1d2e97abbe4fca50f8ab5e72089c292d22f0e4395340a6e8  linux-4.14.111.tar.xz
+sha256 4d451c21effad77de323edc9bfeae095aa1faed1a801ef427d66f5763bef091e  linux-4.9.168.tar.xz
+sha256 c3598c22b7994b3bebc3059e8ab85bc212c53550eb401baab3f29f8d007a043d  linux-4.4.178.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0ead7e538f..90c2a0b42b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.177"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.166"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.109"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.32"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.178"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.168"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.111"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.34"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
