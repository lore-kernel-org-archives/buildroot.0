From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 14:55:55 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.4.x series
Message-ID: <20200307134349.B7B088FB69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=523ab1037b9ec159e979206787bcffea025ee571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6f6118ec3a4ff911283c25ce90f98cb695ede542)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index dcefbd6996..d9f785219a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.97" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.99" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 97cfafffb2..e44084396c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 da02389a9c39284dca01b7ba48e845be3dd5ce0fed0b5f30150d8d303429e7dd  linux-4.4.210.tar.xz
-sha256 a0915203836d02cc3cd70252904700412c4a409737a81b392465fb70d7625313  linux-4.9.210.tar.xz
-sha256 8bb2bf811a2092933a2386a4e679cd0c88de979c10fbb463d8142add4e577c00  linux-4.14.166.tar.xz
-sha256 8fb2a328e05e545274e721cf84baaf612b9330febc6f581b9ead81eaf41496da  linux-4.19.97.tar.xz
+sha256 77df6c3c5c512516db444264242cef5370550ed58ef3f198632858b917f9d8b8  linux-4.4.211.tar.xz
+sha256 2597608d5d974cfdc015eaf6a4197b36f19d722b8a309b57e741fb02e311b1be  linux-4.9.211.tar.xz
+sha256 db5777d3a12a85bc8c130b7b250bab2283f9d964b725e5de3c216b495eeb31fe  linux-4.14.168.tar.xz
+sha256 8dbc21f994af9dc3468da4e934a641b457a57cf125d1a8e8f95fe488edd5b5ab  linux-4.19.99.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ae3ea7b286..ee381dde74 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.210"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.210"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.166"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.97"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.211"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.211"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.168"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.99"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
