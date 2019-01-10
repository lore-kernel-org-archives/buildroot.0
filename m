From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jan 2019 08:32:21 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14, 19,
 20}.x series
Message-ID: <20190110073727.521438B468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78f0c1fe4a3d7f621707c20eeee16dc77b4a1a15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9a4d46e534..932aa62991 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.20" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.20.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 6467d8abca..c8401d4ec6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 ad0823183522e743972382df0aa08fb5ae3077f662b125f1e599b0b2aaa12438  linux-4.20.tar.xz
-sha256 f50a77fc40e13fc406791346fa91926394205874cd50246c7c2374006bacc0c2  linux-4.19.13.tar.xz
-sha256 6a587c8b4160918efa082b0c2eda8c2db0f50d8814ad1d1ac94be1edf66ca6a9  linux-4.14.91.tar.xz
-sha256 6067151b0225a8de1ab79abc9be7bae237eaca0cd838eb26684169560d88a994  linux-4.9.148.tar.xz
+sha256 45096f1ffbfbb4cdeef6eecfa6ca7eabbf534f04645fd0d849564a58ddd2198f  linux-4.20.1.tar.xz
+sha256 24326849dd5120186d8db165ad4410bf0eb28ef07a20141acbad49f125f71c46  linux-4.19.14.tar.xz
+sha256 5f9f1faba9a47e406de9b207d45a00d41d45e11615971ec9ef9493654cd745ad  linux-4.14.92.tar.xz
+sha256 165bd3b42e8f99e62238f711d2c0100ad411bc69588c65fb3a22c190dc35d783  linux-4.9.149.tar.xz
 sha256 06f1b080332251628727e42d21b4530035f03f00d75432199b2548172b1650a9  linux-4.4.169.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 907725093d..e94d28419a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -286,10 +286,10 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.169"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.148"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.91"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.13"	if BR2_KERNEL_HEADERS_4_19
-	default "4.20"		if BR2_KERNEL_HEADERS_4_20
+	default "4.9.149"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.92"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.14"	if BR2_KERNEL_HEADERS_4_19
+	default "4.20.1"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
