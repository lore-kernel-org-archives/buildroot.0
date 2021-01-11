From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 11 Jan 2021 18:55:20 +0100
Subject: [Buildroot] [PATCH v3 1/1] {linux, linux-headers}: bump 5.{4,
 10}.x 4.{4, 9, 14, 19} series
Message-ID: <20210111175520.839692-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop 5.9 stable (EOL).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2->v3:
* new releases for all supported versions
* fix hash for 5.10 (I used .gz by accident, now use .xz)

NOTE: all these versions contain MUSL toolchain fix a85cbe6159ff ("uapi:
move constants from <linux/kernel.h> to <linux/const.h>").

Kind regards,
Petr

 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 13 ++++++-------
 package/linux-headers/Config.in.host | 17 ++++++-----------
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 92b0543515..7af8e77d4d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index cb702146bd..0b944c3d5f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f9153333e5ce60c9cd9a501fbcb342ba6032b8fdb2cb492115c5595712a19525  linux-5.10.3.tar.xz
-sha256  b0d7abae88e5f91893627c645e680a95c818defd1b4fcaf3e2afb4b2b6b4ab86  linux-5.9.16.tar.xz
-sha256  1de3586d8e7a9a814726610745d80907a267590d2770ec1079ef2875c4984008  linux-5.4.85.tar.xz
+sha256  7767d02c1cb5eb2a8d3c2b15a3f93e85b98baa6e9d93a3b9e3ec0e959d0a690b  linux-5.10.6.tar.xz
+sha256  4b8007c126c7146f020230fe19ce9924ba3b089c228002dea3ef54abba1824b2  linux-5.4.88.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  e52a49ceb639d871478a143c314648c35e22222c317ecdf49866830fea5c3dfc  linux-4.4.248.tar.xz
-sha256  4687268061c9933c298b30d28e4bf1a30dfbab7c0da4bee194968e4f81ffeccf  linux-4.9.248.tar.xz
-sha256  0e1bc32c4842c3bbee3a15454408f528acd4d3c5e83312b93008d5ee2e9a0c79  linux-4.14.212.tar.xz
-sha256  3eeec4e5eb8a129be3536357ecb028fae7d82fac933dcfac0b6089ee398fc5fc  linux-4.19.163.tar.xz
+sha256  ab386137ffae217a2b681d3efa41e8a338cb2ddbd04ffb85e42a93629024a18a  linux-4.4.250.tar.xz
+sha256  9ebdbf45d83efc5ee096e98a9f0b0383ade1ad01645a25a70e6188285aff7197  linux-4.9.250.tar.xz
+sha256  f54296216ace09a1bf81efaa9dbbd4ebbe8631dbf22df9c6f286157db827391e  linux-4.14.214.tar.xz
+sha256  b98ef209321a4e39ce98ca6b8745a2268bdd927fd74e4e2c50bc68d9a637880e  linux-4.19.166.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7b27cee036..c5948a722a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -54,10 +54,6 @@ config BR2_KERNEL_HEADERS_5_4
 	bool "Linux 5.4.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 
-config BR2_KERNEL_HEADERS_5_9
-	bool "Linux 5.9.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
-
 config BR2_KERNEL_HEADERS_5_10
 	bool "Linux 5.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -350,13 +346,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.248"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.248"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.212"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.163"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.85"	if BR2_KERNEL_HEADERS_5_4
-	default "5.9.16"	if BR2_KERNEL_HEADERS_5_9
-	default "5.10.3"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.250"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.250"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.214"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.166"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.88"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.6"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.28.0
