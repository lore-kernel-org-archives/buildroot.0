From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Mar 2020 23:32:26 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.4.x series
Message-ID: <20200305222029.A8A9C8F5CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b4635ea6385e7dfde1dda039eed79e2f10ea63b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 20286d494ade6a92c4b7065a11f4e4fce6b8bf14)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6c1d172be5..dcefbd6996 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.94" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.97" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 7d72e43573..97cfafffb2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 5899ff2a85e2b84607148349fd8e646f94399655caf0e4e55d1eb0567e48520e  linux-4.4.208.tar.xz
-sha256 b7ad1c9841d671d026c55a4c91c77205f8b488ca5f980f838591c68662e0525a  linux-4.9.208.tar.xz
-sha256 eb29cc9cfd54158789064b3d6e5b3eab108facec048b8d405a63e9863329b049  linux-4.14.163.tar.xz
-sha256 c62a10a75a7c4213e41287040e7c7509b7d42117d6830feb7dfe505949fa7467  linux-4.19.94.tar.xz
+sha256 da02389a9c39284dca01b7ba48e845be3dd5ce0fed0b5f30150d8d303429e7dd  linux-4.4.210.tar.xz
+sha256 a0915203836d02cc3cd70252904700412c4a409737a81b392465fb70d7625313  linux-4.9.210.tar.xz
+sha256 8bb2bf811a2092933a2386a4e679cd0c88de979c10fbb463d8142add4e577c00  linux-4.14.166.tar.xz
+sha256 8fb2a328e05e545274e721cf84baaf612b9330febc6f581b9ead81eaf41496da  linux-4.19.97.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6241c80820..ae3ea7b286 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.208"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.208"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.163"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.94"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.210"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.210"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.166"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.97"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
