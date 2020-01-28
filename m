From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 16:32:20 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.4.x series
Message-ID: <20200128153221.11755-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 14b76205e4..ae5b1860a6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.15" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.94-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.90-cip16-rt6" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 560bdfc704..ddeb7194ce 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 49fb29d96d7e7c1d7e6082701bd26bfddd0fbc87a796fb6ba6258bc5fd386ad7  linux-5.4.13.tar.xz
+sha256 6407222f850f685b346011bd696a3216d5df0f37e0184099100d2724396d94b1  linux-5.4.15.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 da02389a9c39284dca01b7ba48e845be3dd5ce0fed0b5f30150d8d303429e7dd  linux-4.4.210.tar.xz
-sha256 a0915203836d02cc3cd70252904700412c4a409737a81b392465fb70d7625313  linux-4.9.210.tar.xz
-sha256 8bb2bf811a2092933a2386a4e679cd0c88de979c10fbb463d8142add4e577c00  linux-4.14.166.tar.xz
-sha256 8fb2a328e05e545274e721cf84baaf612b9330febc6f581b9ead81eaf41496da  linux-4.19.97.tar.xz
+sha256 77df6c3c5c512516db444264242cef5370550ed58ef3f198632858b917f9d8b8  linux-4.4.211.tar.xz
+sha256 2597608d5d974cfdc015eaf6a4197b36f19d722b8a309b57e741fb02e311b1be  linux-4.9.211.tar.xz
+sha256 db5777d3a12a85bc8c130b7b250bab2283f9d964b725e5de3c216b495eeb31fe  linux-4.14.168.tar.xz
+sha256 8dbc21f994af9dc3468da4e934a641b457a57cf125d1a8e8f95fe488edd5b5ab  linux-4.19.99.tar.xz
 # Locally computed
 sha256 6d60ce76bce2e1938f64027d12b1988c95245751feb635adfc551a021d5b3f26  linux-cip-4.19.88-cip16.tar.gz
 sha256 74ec782e11344e5c5db8e48899b464e296ef37acfb43ce7dfb01c09ea8d3e959  linux-cip-4.19.82-cip14-rt5.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ee3a8fe1ba..a8dca5d09a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -309,11 +309,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.210"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.210"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.166"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.97"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.13"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.211"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.211"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.168"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.99"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.15"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
