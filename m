From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:31:38 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] {linux,
 linux-headers}: bump 5.{4, 10}.x 4.{4, 9, 14, 19} series
Message-ID: <20210210191435.2F13081220@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28cc928647aebd6ac0bcbdac427ba06d266ef29e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Stick to 4.4.255 / 4.4.255 even though .256 is ready, as the wraparound of
the minor version may cause problems:

https://lkml.org/lkml/2021/2/5/747
https://cdn.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.4.256

https://lkml.org/lkml/2021/2/5/862
https://cdn.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.9.256

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: stick to 4.{4,9}.255]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b2dad74686978b2f9545295003d3eb5ffc68bb5b)
[Peter: drop 5.10.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index c18240d8b3..4b35626dce 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  b0d7abae88e5f91893627c645e680a95c818defd1b4fcaf3e2afb4b2b6b4ab86  linux-5.9.16.tar.xz
 sha256  4ab4a3f694b7b4cfbe78871eab34c8039ad33692144c45c669827a594da85534  linux-5.8.18.tar.xz
-sha256  d37449403664cc3b1bac96d0d9a199dbe619885cd899c0ae3108843f42e3d522  linux-5.4.93.tar.xz
+sha256  030ae544f346bfa2ce619dd9e17e93d10ec393632d3b6d6cf5d1fc84b914d449  linux-5.4.95.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  661e98b9448cbac948c705fd44cd7d30200422ee1cb02950d142aa99a1b3985a  linux-4.4.253.tar.xz
-sha256  9a5b51a8350201bd38e3ff13909323a6571b4572a7b3caed76e462b07619bc18  linux-4.9.253.tar.xz
-sha256  62a36a25431016d98d0f1cff98be432086c51f86fd79042bd10a867b3a924d11  linux-4.14.217.tar.xz
-sha256  f4e352fe0eb986e5b532b99d9b0725a67046cbb3e5f53fcd5b098cbaeb2ac60a  linux-4.19.171.tar.xz
+sha256  2f3830ed4767b27dc6ead9af5c802eed7258b28c527efe90ce188cc6bd668550  linux-4.4.255.tar.xz
+sha256  afdf2d03c920f6b12f4e207ab18e45fbe2d7f4a61c066eff0d9916fc5d00c118  linux-4.9.255.tar.xz
+sha256  75eecaa731c091fcf3bc2ec914b01d299a447d78041cb66a11a2ab169eb801dd  linux-4.14.219.tar.xz
+sha256  d2fdd236e6f31aa8e939f4a686c95417d8571bde3d091fc6a2535937c144195f  linux-4.19.173.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 935b222265..2b9e064645 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,11 +346,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.253"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.253"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.217"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.171"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.93"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.255"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.255"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.219"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.173"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.95"	if BR2_KERNEL_HEADERS_5_4
 	default "5.8.18"	if BR2_KERNEL_HEADERS_5_8
 	default "5.9.16"	if BR2_KERNEL_HEADERS_5_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
