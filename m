From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 00:14:00 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.1.x series
Message-ID: <20190706221233.1C4CB88F5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8ad14b1fd21cb9b5685233f33904fde97714162
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit abc782c0b3be3b4d5346a23ac46b8417ff8a900c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0bc9612551..bc11fe9b4e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.1.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.1.15" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 497e8e4d6f..4e86ed3bbc 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 11fd93207290272389ad284b8b042041d088fbee0ed5798e933bf8e91697d219  linux-5.1.11.tar.xz
+sha256 e8a128702680cea9f37c44bbeb456ea1c2ef1ae1eba0e05dcfc11d7d6cdc1399  linux-5.1.15.tar.xz
 sha256 98d307a546c95a215dee675ffa4b63c2a7a29e7af839f0d8dfb96dbb61aac2d7  linux-5.0.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 266ee655620c3689ae94761970d6827fffc919760caf815427ad22730ba4381e  linux-4.19.52.tar.xz
-sha256 d7464c2379cdee46548ae9f848671f4669d4003af4034f3f738f2f0511ec75b3  linux-4.14.127.tar.xz
-sha256 b16e12681a0638368479d73a9b1b8e9407c1ae4b7ae52fdf236d9e5657999695  linux-4.9.182.tar.xz
-sha256 c409d88f61cd9a37cbba36d5d9c8162263eb1e5c9380efaf880a3ec10cd88527  linux-4.4.182.tar.xz
+sha256 7326943215b9496f302e95892457a63d9a77e0446e99dd7bade6b425bc966bdf  linux-4.19.56.tar.xz
+sha256 19f6404c30f4a9a1fe3315b902676b6d63a470be5d55cf2a0e47983c643c8ff5  linux-4.14.131.tar.xz
+sha256 6543232fc082485c1088830b9456e1a6e511239e4bf98817b0166ee62cafc3ca  linux-4.4.184.tar.xz
+sha256 033114d5350525dede995d31b596c31b0e26db8d77a0a1c53d36cdc36ead9faf  linux-4.9.184.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2bdce9b7f8..c04910d1de 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -297,12 +297,12 @@ endchoice
 
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
 	default "5.0.21"	if BR2_KERNEL_HEADERS_5_0
-	default "5.1.11"	if BR2_KERNEL_HEADERS_5_1
+	default "5.1.15"	if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
