From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2020 11:39:51 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 6}.x series
Message-ID: <20200602093949.503DF8179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=519bb61c5e2bdf0162018bc43ea112abdd49a908
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e0f5cc8f66c44088cc858ab97e460e7f4d06faf3)
[Peter: drop 5.5.x / 5.6.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7c0bdf1a98..4d18038e92 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.42" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.43" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.118-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.115-cip24-rt9" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index de04b8a026..8c0a7a813b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4e431b7c0266a07b76fdb77f8917ad681f0fa34ffba0eb8a172b67f7ef57bc31  linux-5.4.42.tar.xz
+sha256  2667b90a42d42557aca9e3d37bba1b4e71809b9523958e6870ada311c4790744  linux-5.4.43.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  ef76687254eea1a379fbbf0b2b7fdde9450608e6402822d73873a352ecf568d1  linux-4.4.224.tar.xz
-sha256  df6d07e99513f9afadd7d44c471f44c56fccc9e4c984a1ba4b988f053a13c949  linux-4.9.224.tar.xz
-sha256  ab9bea577cfe59fb2f502ce4d6130bfb49163ef969364adc3d36a65721d64a4d  linux-4.14.181.tar.xz
-sha256  d5d9001879d7a77309dca203656490326d26b068b7b0b9d8003548dba8fdad00  linux-4.19.124.tar.xz
+sha256  49474956a6149c16cbcba862d1f4db54835a32d336063c75094f669f1c34c65e  linux-4.4.225.tar.xz
+sha256  e547748c548b0f55f665bc78cfec322e7b96f41527b5e4b5d79430fdaa57c3e8  linux-4.9.225.tar.xz
+sha256  671d1f1d5ad0ae74fb21ee70a5544400e7d6270098d3f8b134484ded2c3e5b90  linux-4.14.182.tar.xz
+sha256  9843f40efb37491770688810d153d0779daed8eb097773a0de5abf2cb0d1bd7e  linux-4.19.125.tar.xz
 # Locally computed
 sha256  ea53913813cb5a9069608532b327de7a7ed0fdc8fed8c6f10cd55d1ac6a58ffb  linux-cip-4.19.118-cip25.tar.gz
 sha256  7f0a0db0e1cfb14053523f4432f1ad1468b5bd42305b44905c4b103466c8d655  linux-cip-4.19.115-cip24-rt9.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 44bd13f0e4..901e626eb2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -318,11 +318,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.224"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.224"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.181"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.124"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.42"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.225"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.225"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.182"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.125"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.43"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
