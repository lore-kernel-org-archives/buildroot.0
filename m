From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon,  9 Nov 2020 22:33:04 +0100
Subject: [Buildroot] [PATCH v2 2/2] linux: bump CIP RT kernel to version
 4.19.152-cip37-rt16
In-Reply-To: <20201109213304.2549190-1-angelo@amarulasolutions.com>
References: <20201109213304.2549190-1-angelo@amarulasolutions.com>
Message-ID: <20201109213304.2549190-2-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps Linux CIP RT to version 4.19.152-cip37-rt16

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1->v2:
* Fixing hash

 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2c69b842f3..b6c5c02a5e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -50,7 +50,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.132-cip30-rt12)"
+	bool "Latest CIP RT SLTS version (4.19.152-cip37-rt16)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -126,8 +126,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.9" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 99bda363df..f4fedfcb5a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -9,7 +9,7 @@ sha256  5d404a0224a34b5379f1871cc46825487d557c2660459d2b5c3cd4871d699a38  linux-
 sha256  f2f709ef086a4d8cb3c15a857daa44dfecf1b88d7d7c53c980fb180f6dccbace  linux-4.19.150.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
-sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
+sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.25.1
