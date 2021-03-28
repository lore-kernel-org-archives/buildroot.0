From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Mar 2021 22:08:53 +0200
Subject: [Buildroot] [git commit branch/2020.11.x] {linux,
 linux-headers}: bump 5.{4, 10, 11}.x 4.{4, 9, 14, 19} series
Message-ID: <20210328200352.257B5888A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fafbf921d2f75d775a118f71785f5e4aca91c25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ddfac826aea915a95a4ad64e7b8e8af93c5620c3)
[Peter: drop 5.10.x/5.11.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index b727ef180c..447b87c180 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  b0d7abae88e5f91893627c645e680a95c818defd1b4fcaf3e2afb4b2b6b4ab86  linux-5.9.16.tar.xz
 sha256  4ab4a3f694b7b4cfbe78871eab34c8039ad33692144c45c669827a594da85534  linux-5.8.18.tar.xz
-sha256  4e118c072dbe3209ddeaff32ecc558f7e809d54e661550342079f1ee76d9349d  linux-5.4.101.tar.xz
+sha256  1c3cef545f366b56332c11c28d074c9d9148c28059a970ec8710826652237560  linux-5.4.107.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  0c41611ae151b80723eb68c75f8a3366756f93e8748ab0892255344f38d76665  linux-4.4.258.tar.xz
-sha256  d478f8e069f6d8b86b0a69f99252ea9e7cd7070bf6bdd0e9b3773ee418e5c8cd  linux-4.9.258.tar.xz
-sha256  734082b03d9f8e43b123b0061f08045b70c34e3a4b09f8a8da6a287686dac744  linux-4.14.222.tar.xz
-sha256  ac0eb3794e01eac66bea3ab39b8776dadf15c418ddc534ccfd95a0270302357d  linux-4.19.177.tar.xz
+sha256  d270c529910aefa70f7eeaafe313588b9949cfde33a5553bd4cd1a1249c4e97b  linux-4.4.262.tar.xz
+sha256  b22e764095362d9e63d76375db838d9372474ba5cbe6132c9a8b07f7533f07ff  linux-4.9.262.tar.xz
+sha256  7adc041af81424ff8d68affe3005fa9e5babc4e84e0b07e4effdf54225ba9426  linux-4.14.226.tar.xz
+sha256  05db750ba01ad557bef50835c253894fad9fb0db2224f0e803b25e2ff7ab2365  linux-4.19.182.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f90c5c8219..8d90d34815 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,11 +346,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.258"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.258"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.222"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.177"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.101"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.262"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.262"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.226"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.182"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.107"	if BR2_KERNEL_HEADERS_5_4
 	default "5.8.18"	if BR2_KERNEL_HEADERS_5_8
 	default "5.9.16"	if BR2_KERNEL_HEADERS_5_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
