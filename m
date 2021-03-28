From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Mar 2021 22:01:15 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] {linux,
 linux-headers}: bump 5.{4, 10, 11}.x 4.{4, 9, 14, 19} series
Message-ID: <20210328200448.5EAEE860C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f82ec65bcae7ce7d354e6c8f2646188f9b7248bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ddfac826aea915a95a4ad64e7b8e8af93c5620c3)
[Peter: drop 5.11.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5b3a626871..efed7d88ca 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.19" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.25" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6ab7a6989e..34cd6df98f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  27e7bbb0de7f0acc29c3c2e0a70c9a5fafc5fcf250993ce48713f809862ab4d6  linux-5.10.19.tar.xz
-sha256  4e118c072dbe3209ddeaff32ecc558f7e809d54e661550342079f1ee76d9349d  linux-5.4.101.tar.xz
+sha256  930ae76b9a3b64b98802849aca332d17a706f20595de21e1ae729b55ee461add  linux-5.10.25.tar.xz
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
index 2ddee289df..caf8af67a8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,12 +346,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.258"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.258"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.222"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.177"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.101"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.19"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.262"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.262"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.226"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.182"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.107"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.25"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
