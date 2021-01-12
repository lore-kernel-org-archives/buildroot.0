From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2021 22:06:34 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] {linux,
 linux-headers}: bump 5.{4, 10}.x 4.{4, 9, 14, 19} series
Message-ID: <20210112205125.4E3268263C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=478b6ae274a06f008cc4b9a92bf32fa311600240
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Peter: add Config.in.legacy handling for 5.9]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 54584d233b965a7442253b06c738bbb6f1b58fa5)
[Peter: drop 5.10.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index dd74f7cc08..1f4d895639 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  b0d7abae88e5f91893627c645e680a95c818defd1b4fcaf3e2afb4b2b6b4ab86  linux-5.9.16.tar.xz
 sha256  4ab4a3f694b7b4cfbe78871eab34c8039ad33692144c45c669827a594da85534  linux-5.8.18.tar.xz
-sha256  1de3586d8e7a9a814726610745d80907a267590d2770ec1079ef2875c4984008  linux-5.4.85.tar.xz
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
index c8e3f5bcfe..0cad15067d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,11 +346,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.248"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.248"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.212"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.163"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.85"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.250"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.250"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.214"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.166"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.88"	if BR2_KERNEL_HEADERS_5_4
 	default "5.8.18"	if BR2_KERNEL_HEADERS_5_8
 	default "5.9.16"	if BR2_KERNEL_HEADERS_5_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
