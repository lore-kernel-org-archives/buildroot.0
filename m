From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 11:36:06 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.2.x series
Message-ID: <20191001093500.7106F85278@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eadf3ccbde98eedfebf1307629c4c980f929404
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 80d32c942a79b2f3c557176fd3c522b669dd3a61)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0e3cabf107..316687b000 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.2.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.2.17" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.65-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 576f263966..366d52e9f0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 0c2061c9edc8ab213b77f23af1d5a018127c2603404498a528651d56a795e575  linux-5.2.16.tar.xz
+sha256 7b3b8ad09ea936b4216dd02c5fc2ef39c8f58935d0a81ab9690f0fc451102df9  linux-5.2.17.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 495c2fead329c2c6b17950faa07ad7406e5aa93560e5e58de93a71197579ee82  linux-4.19.74.tar.xz
-sha256 eb05b5806713263a6d5bfa1e018ad07c3f4b3c6e71032306a94d7113ed594929  linux-4.14.145.tar.xz
-sha256 9be5081cc0fa6b720e6b3e5cb90296f3d857469bb3cda09ff93db00f9e16fd01  linux-4.9.193.tar.xz
-sha256 6afcde68645dbb9ce2fced3672186d80e96eb8c3e1ea7a66b64f619c7d073e8e  linux-4.4.193.tar.xz
+sha256 dd5e7147e1e4501560fba5beb86dae6bf6ba843518ab3d4cad283de77b651b78  linux-4.19.75.tar.xz
+sha256 a3c54b887ea3e679382bd4c0536e6a281b071dab2258bd3ee8af75baef2023f5  linux-4.14.146.tar.xz
+sha256 d5f4bb7584e461f1faa9a3f94c2ad292246fe692b0e992e072dac255f806c2e3  linux-4.9.194.tar.xz
+sha256 d5f4bb7584e461f1faa9a3f94c2ad292246fe692b0e992e072dac255f806c2e3  linux-4.9.194.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 91e648d110..2da8b1dda4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,12 +305,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.193"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.193"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.145"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.74"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.194"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.194"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.146"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.75"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
-	default "5.2.16"	if BR2_KERNEL_HEADERS_5_2
+	default "5.2.17"	if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
