From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 15:35:51 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.2.x series
Message-ID: <20190930133040.989438362C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf76ef6c317fbec4e5bed1a5789fd15ec00b858f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 893b9b662cb26eb4b972b339780db46e3e2c29f8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index b268ee8c99..0e3cabf107 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.2.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.2.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.65-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 41dfd52296..576f263966 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 c64d36477fee6a864a734ec417407768e60040a13f144c33208fa9622fd0ce8c  linux-5.2.14.tar.xz
+sha256 0c2061c9edc8ab213b77f23af1d5a018127c2603404498a528651d56a795e575  linux-5.2.16.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 f9fcb6b3bd29115ac55fc154e300c3dce2044502732f6842ad6c25e6f9f51f6d  linux-4.19.72.tar.xz
-sha256 2534f2f03cb937700a03dd85dcf1cb6e6f46fdd29d489580cc3183d6c0643d93  linux-4.14.143.tar.xz
-sha256 7a1a300cce70a4fd0d49b7fff7b1673159b61c4040c5a7c08ea333a7cb328d54  linux-4.9.192.tar.xz
-sha256 2fba918dd21e421b4e0fd57dac052ba65f9947320892d960f093419561988a3b  linux-4.4.192.tar.xz
+sha256 495c2fead329c2c6b17950faa07ad7406e5aa93560e5e58de93a71197579ee82  linux-4.19.74.tar.xz
+sha256 eb05b5806713263a6d5bfa1e018ad07c3f4b3c6e71032306a94d7113ed594929  linux-4.14.145.tar.xz
+sha256 9be5081cc0fa6b720e6b3e5cb90296f3d857469bb3cda09ff93db00f9e16fd01  linux-4.9.193.tar.xz
+sha256 6afcde68645dbb9ce2fced3672186d80e96eb8c3e1ea7a66b64f619c7d073e8e  linux-4.4.193.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ec951eef5d..91e648d110 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,12 +305,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.192"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.192"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.143"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.72"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.193"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.193"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.145"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.74"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
-	default "5.2.14"	if BR2_KERNEL_HEADERS_5_2
+	default "5.2.16"	if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
