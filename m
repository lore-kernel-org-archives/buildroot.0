From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 18:08:53 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] {linux,
 linux-headers}: bump 5.{4, 10}.x 4.{4, 9, 14, 19} series
Message-ID: <20210128200058.2D386812DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5fe4ec31fbb32becee88ec8c19953467ce58312
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6943c84d9c27f6ac890ffb720a62932be0f4f358)
[Peter: drop 5.10.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index f0d1029b95..5e03228e34 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  b0d7abae88e5f91893627c645e680a95c818defd1b4fcaf3e2afb4b2b6b4ab86  linux-5.9.16.tar.xz
 sha256  4ab4a3f694b7b4cfbe78871eab34c8039ad33692144c45c669827a594da85534  linux-5.8.18.tar.xz
-sha256  268dd5177b6df1867d4ed2452ffb11a016d955c43aba5e07940886f347ab0aaf  linux-5.4.89.tar.xz
+sha256  c0937ff98824c4b14cfea68a04340e0beb3c00f1cc02984daf2f3bdf542394fd  linux-5.4.92.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  0679c8c31f40a35efd63d9c7a6a73dd2496c0cae5e3a4591c57e6dce38a7b68e  linux-4.4.251.tar.xz
-sha256  ef4dcbbeb118c02c704581314832dc2a6912622946766bcede7ca3edbf1f960d  linux-4.9.251.tar.xz
-sha256  9a844e290c61b39dd23df507ba1d9c2b2b4365e5993a978b19f1eb5610b926da  linux-4.14.215.tar.xz
-sha256  312c67677c75adc4324078c5afb11411df379d5573ad0a429b3f4919f26bed01  linux-4.19.167.tar.xz
+sha256  661e98b9448cbac948c705fd44cd7d30200422ee1cb02950d142aa99a1b3985a  linux-4.4.253.tar.xz
+sha256  9a5b51a8350201bd38e3ff13909323a6571b4572a7b3caed76e462b07619bc18  linux-4.9.253.tar.xz
+sha256  62a36a25431016d98d0f1cff98be432086c51f86fd79042bd10a867b3a924d11  linux-4.14.217.tar.xz
+sha256  dd0d0264f8ef4363d0080054fd344470a73f07aca2cd673e91bf6e77fbe25b4a  linux-4.19.170.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 78a19f0c6a..3d24001f4a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,11 +346,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.251"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.251"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.215"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.167"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.89"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.253"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.253"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.217"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.170"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.92"	if BR2_KERNEL_HEADERS_5_4
 	default "5.8.18"	if BR2_KERNEL_HEADERS_5_8
 	default "5.9.16"	if BR2_KERNEL_HEADERS_5_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
