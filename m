From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 20:59:31 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.2.x series
Message-ID: <20190925185935.BB6918F4B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03aadc8759434d2f994ae7bc4fcaed8789b030fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dc82013bf59bbf1280f525b3296d6cd597ad4f2a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2bd2d859d5..b268ee8c99 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.2.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.2.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.65-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 133a55377e..41dfd52296 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 0c2a831f993dc8a8a8e1ca4186b467de72ff173c6f5855e2aab70f6f7fb033f9  linux-5.2.11.tar.xz
+sha256 c64d36477fee6a864a734ec417407768e60040a13f144c33208fa9622fd0ce8c  linux-5.2.14.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 c091760b520a4e4a4c7034a8329cc2689a0ea3f81a377b694ed196d623e2d987  linux-4.19.69.tar.xz
-sha256 0bb9f0812326ec4554de1bea02628840e03b6664b5abfd9d8510049e43203a17  linux-4.14.141.tar.xz
-sha256 fe8a1ca080a462de6832762ba8b71410b828f0e52c1e11d3c46d83e9ac1e0a16  linux-4.9.190.tar.xz
-sha256 fec8c8549a3775b922cecad74a6409b33520a669d451dc51ad47d69c2543c2e5  linux-4.4.190.tar.xz
+sha256 f9fcb6b3bd29115ac55fc154e300c3dce2044502732f6842ad6c25e6f9f51f6d  linux-4.19.72.tar.xz
+sha256 2534f2f03cb937700a03dd85dcf1cb6e6f46fdd29d489580cc3183d6c0643d93  linux-4.14.143.tar.xz
+sha256 7a1a300cce70a4fd0d49b7fff7b1673159b61c4040c5a7c08ea333a7cb328d54  linux-4.9.192.tar.xz
+sha256 2fba918dd21e421b4e0fd57dac052ba65f9947320892d960f093419561988a3b  linux-4.4.192.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 00df32f740..ec951eef5d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,12 +305,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.190"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.190"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.141"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.69"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.192"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.192"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.143"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.72"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
-	default "5.2.11"	if BR2_KERNEL_HEADERS_5_2
+	default "5.2.14"	if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
