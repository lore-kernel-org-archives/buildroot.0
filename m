From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 11:12:39 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10}.x series
Message-ID: <20210129101240.618-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 91d33cb5cb..267b113532 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index e9b6825c2b..52d2066081 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  60ed866fa951522a5255ea37ec3ac2006d3f3427d4783a13ef478464f37cdb19  linux-5.10.10.tar.xz
-sha256  c0937ff98824c4b14cfea68a04340e0beb3c00f1cc02984daf2f3bdf542394fd  linux-5.4.92.tar.xz
+sha256  02ef2b56b00fc5145701c603a5235e1265772e40d488a936b27ba65fe78e710f  linux-5.10.11.tar.xz
+sha256  d37449403664cc3b1bac96d0d9a199dbe619885cd899c0ae3108843f42e3d522  linux-5.4.93.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  661e98b9448cbac948c705fd44cd7d30200422ee1cb02950d142aa99a1b3985a  linux-4.4.253.tar.xz
 sha256  9a5b51a8350201bd38e3ff13909323a6571b4572a7b3caed76e462b07619bc18  linux-4.9.253.tar.xz
 sha256  62a36a25431016d98d0f1cff98be432086c51f86fd79042bd10a867b3a924d11  linux-4.14.217.tar.xz
-sha256  dd0d0264f8ef4363d0080054fd344470a73f07aca2cd673e91bf6e77fbe25b4a  linux-4.19.170.tar.xz
+sha256  f4e352fe0eb986e5b532b99d9b0725a67046cbb3e5f53fcd5b098cbaeb2ac60a  linux-4.19.171.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 311999e7fa..b47ac8bb44 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -349,9 +349,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.253"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.253"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.217"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.170"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.92"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.10"	if BR2_KERNEL_HEADERS_5_10
+	default "4.19.171"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.93"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.11"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
