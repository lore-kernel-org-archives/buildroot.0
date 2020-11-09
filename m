From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon,  9 Nov 2020 22:33:03 +0100
Subject: [Buildroot] [PATCH v2 1/2] linux: bump CIP kernel to version
 4.19.152-cip37
Message-ID: <20201109213304.2549190-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps Linux CIP to version 4.19.152-cip37

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1->v2:
* Fixing hash
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5e8390647a..2c69b842f3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.9)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.132-cip30)"
+	bool "Latest CIP SLTS version (4.19.152-cip37)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -126,8 +126,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.9" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 4b76398c5d..99bda363df 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -8,7 +8,7 @@ sha256  b1eaf60b771ec4df0546d2b7539e164355008ea2f680a0642ae430e9cb134a3f  linux-
 sha256  5d404a0224a34b5379f1871cc46825487d557c2660459d2b5c3cd4871d699a38  linux-4.14.200.tar.xz
 sha256  f2f709ef086a4d8cb3c15a857daa44dfecf1b88d7d7c53c980fb180f6dccbace  linux-4.19.150.tar.xz
 # Locally computed
-sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
+sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
 
 # Licenses hashes
-- 
2.25.1
