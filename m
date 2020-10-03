From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 23:03:46 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 8}.x series
Message-ID: <20201003205343.A9D478E1BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1332032d63a82e831d50d8140a7b4cf420936de1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a6e8e8fae7b30b5b449ec8ab12f20d5fb80181ca)
[Peter: drop 5.8.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 190d03e570..a645995b84 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.63" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.69" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ee94afc7fe..fbd4704b59 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  e0260dae0da01163b1a3289ad9c5cc6ee4226720e199e8a1d982e24efda7ffc0  linux-5.4.63.tar.xz
+sha256  a8b31d716b397303a183e42ad525ff2871024a43e3ea530d0fdf73b7f9d27da7  linux-5.4.69.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  0dfb86052e7405692e29f8db2f5b480ed972d93b615ffb24d4607d33d29eb770  linux-4.4.235.tar.xz
-sha256  e625a6212695efe5deeab5844e47404841fb1bf755f85eba818614c2ff580cc3  linux-4.9.235.tar.xz
-sha256  5e61b2f58d4c930c3567821aeeb6f688554dca61454646d54711bfc9abc7b09a  linux-4.14.196.tar.xz
-sha256  2a4335c66f0ea8cc49d89ab25e5e00d75fcb33fe638d5584855598b4b8f3038d  linux-4.19.143.tar.xz
+sha256  067814035c17e77dee84076dcc06a95eb675344cd926b7b79a16b80fee593364  linux-4.4.238.tar.xz
+sha256  b1eaf60b771ec4df0546d2b7539e164355008ea2f680a0642ae430e9cb134a3f  linux-4.9.238.tar.xz
+sha256  5d404a0224a34b5379f1871cc46825487d557c2660459d2b5c3cd4871d699a38  linux-4.14.200.tar.xz
+sha256  d9cdcb9a66942a56b91c8d4b273d15a3c5b8e59fad44b79e03362cfffaa62a00  linux-4.19.149.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8385a06962..cb6e58e6f1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -318,11 +318,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.235"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.235"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.196"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.143"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.63"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.238"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.238"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.200"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.149"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.69"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
