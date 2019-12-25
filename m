From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 18:05:59 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{3, 4}.x series
Message-ID: <20191225165901.3D0D38E361@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3c2f84029735cca635227d68ca60d914902ff65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ce0f527950b4d698de4f3f36276ec14cd49e1b89)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0f14b8e3a0..3fd9d92460 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.3.15" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.3.18" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 022df9c302..f9c29dfb45 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 cec8aaea89feac4a3555f1e4b90000244ff7c5e7640db242a7de796a006d1197  linux-5.3.15.tar.xz
+sha256 20f14917c4f33122cfa12963a7d3180fe6f4685cacfe984553b2b5b4ad20638c  linux-5.3.18.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 5da5e16fe08fa506f8f74aa4f17be22b52c0f513e9a3f7e7ae22fc53597ad493  linux-4.4.206.tar.xz
 sha256 1df27899a9bc4dd874f3830ab9e7b638f0026dffd67a2e230444e5d2805ccad6  linux-4.9.206.tar.xz
-sha256 0d49ec72e273f6fc7462ad56849b2285f13fd5f4185e8f932a0074fc2eca1bb3  linux-4.14.158.tar.xz
-sha256 c1923b6bd166e6dd07be860c15f59e8273aaa8692bc2a1fce1d31b826b9b3fbe  linux-4.19.88.tar.xz
+sha256 e8d42d3a1b85d180141e9bc11c4a0e87f8a413c0e989b0f24c1b7c40f8a826f2  linux-4.14.159.tar.xz
+sha256 29d86c0a6daf169ec0b4b42a12f8d55dc894c52bd901f876f52a05906a5cf7fd  linux-4.19.90.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 11f73652d8..ecb450e0ed 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -307,9 +307,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.206"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.206"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.158"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.88"	if BR2_KERNEL_HEADERS_4_19
-	default "5.3.15"	if BR2_KERNEL_HEADERS_5_3
+	default "4.14.159"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.90"	if BR2_KERNEL_HEADERS_4_19
+	default "5.3.18"	if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
