From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2021 18:04:54 +0100
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4,
 10}.x 4.{4, 9, 14, 19} series
Message-ID: <20210123170454.1647832-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fix subject

 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4010a9def8..77254204ed 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 938c0eddf2..e9b6825c2b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4cbf6e09f90f2ae7160432c884d5a2aeb9d33a07ca7f50eb7d80f427706ffabe  linux-5.10.7.tar.xz
-sha256  268dd5177b6df1867d4ed2452ffb11a016d955c43aba5e07940886f347ab0aaf  linux-5.4.89.tar.xz
+sha256  60ed866fa951522a5255ea37ec3ac2006d3f3427d4783a13ef478464f37cdb19  linux-5.10.10.tar.xz
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
index 0eefaeb777..311999e7fa 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,12 +346,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.251"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.251"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.215"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.167"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.89"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.7"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.253"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.253"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.217"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.170"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.92"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.10"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.29.2
