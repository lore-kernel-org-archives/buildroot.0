From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 15:14:06 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.0.x series
Message-ID: <20190407131021.E06E38A531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab5fbbd640a05076c0799d966f46409b70bf9b0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d617e28e15..d683aa9560 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.0.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.0.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.171-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 3476605fb3..993cccdcfb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 5fbd807bf2aa0a80a0bf165692d89aaf3463d03043419b0a9b104f55f12c94d0  linux-5.0.5.tar.xz
+sha256 16e177662b9fc7255bfc51018513979f6effcbe52e459c543aa83a5b15ef54ec  linux-5.0.7.tar.xz
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
index 2cd17d05ce..91b8411b32 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -293,12 +293,12 @@ endchoice
 
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
-	default "5.0.5"		if BR2_KERNEL_HEADERS_5_0
+	default "5.0.7"		if BR2_KERNEL_HEADERS_5_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
