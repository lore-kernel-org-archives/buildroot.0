From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 23:13:58 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.4.x series
Message-ID: <20200310220137.C12EA9088D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c9075b70913b83548452a66ee02c1f5601c3412
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e5e84823bbfef69504511cb32741432c7b834707)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8aafaafef0..681ccf8404 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.101" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.102" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index d180a055ad..43a8baa585 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 47e6c22722917d3609c430392b7549267c1f097ddae9dc0e7f071a6ea4c7a357  linux-4.4.212.tar.xz
-sha256 ade738a606c9b52ecf764e94b4e77116caa3a2b8abd30f4534d220ac6894be30  linux-4.9.212.tar.xz
-sha256 d88ea97993c56b1fa0b0a05061bcde476c6be4fc3bb2de8bd97a8f8ff7278249  linux-4.14.169.tar.xz
-sha256 be26156abdb38ac0576a34a235ef456bb8ca67fbbe56fc6649b8d069159f8bc4  linux-4.19.101.tar.xz
+sha256  d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
+sha256  00f73c3c7a2beebf5832422c81a037b05ca1217d5f4f6cbcc49284bf7fb2bcb2  linux-4.4.213.tar.xz
+sha256  af85ff764670c2a934ee5b2590437d8e3ab32b1a0b8d51358f36c6bbf6c5eb64  linux-4.9.213.tar.xz
+sha256  940a63247d11476daea6d114a9599be0eb68eeb2e295fe279e0f3312af1e17c3  linux-4.14.170.tar.xz
+sha256  302e8388dd7b49d1b779225cf865af74b9837d1e955b1b290fdd71baf97ce015  linux-4.19.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bdd762b2c8..f735e30438 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.212"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.212"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.169"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.101"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.213"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.213"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.170"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.102"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
