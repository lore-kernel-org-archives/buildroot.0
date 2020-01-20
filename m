From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2020 20:02:14 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.4.x series
Message-ID: <20200120185402.1AD3882DE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20286d494ade6a92c4b7065a11f4e4fce6b8bf14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 41384f84a1..14b76205e4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.94-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.90-cip16-rt6" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 04e2362c28..560bdfc704 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 f23c0218a5e3b363bb5a880972f507bb4dc4a290a787a7da08be07ea12042edd  linux-5.4.10.tar.xz
+sha256 49fb29d96d7e7c1d7e6082701bd26bfddd0fbc87a796fb6ba6258bc5fd386ad7  linux-5.4.13.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 5899ff2a85e2b84607148349fd8e646f94399655caf0e4e55d1eb0567e48520e  linux-4.4.208.tar.xz
-sha256 b7ad1c9841d671d026c55a4c91c77205f8b488ca5f980f838591c68662e0525a  linux-4.9.208.tar.xz
-sha256 eb29cc9cfd54158789064b3d6e5b3eab108facec048b8d405a63e9863329b049  linux-4.14.163.tar.xz
-sha256 c62a10a75a7c4213e41287040e7c7509b7d42117d6830feb7dfe505949fa7467  linux-4.19.94.tar.xz
+sha256 da02389a9c39284dca01b7ba48e845be3dd5ce0fed0b5f30150d8d303429e7dd  linux-4.4.210.tar.xz
+sha256 a0915203836d02cc3cd70252904700412c4a409737a81b392465fb70d7625313  linux-4.9.210.tar.xz
+sha256 8bb2bf811a2092933a2386a4e679cd0c88de979c10fbb463d8142add4e577c00  linux-4.14.166.tar.xz
+sha256 8fb2a328e05e545274e721cf84baaf612b9330febc6f581b9ead81eaf41496da  linux-4.19.97.tar.xz
 # Locally computed
 sha256 6d60ce76bce2e1938f64027d12b1988c95245751feb635adfc551a021d5b3f26  linux-cip-4.19.88-cip16.tar.gz
 sha256 74ec782e11344e5c5db8e48899b464e296ef37acfb43ce7dfb01c09ea8d3e959  linux-cip-4.19.82-cip14-rt5.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6b6fe028c5..ee3a8fe1ba 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -309,11 +309,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.208"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.208"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.163"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.94"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.10"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.210"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.210"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.166"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.97"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.13"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
