From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 24 May 2019 18:03:21 -0600
Subject: [Buildroot] [PATCH 1/1] linux: add support for Linux 5.1
Message-ID: <20190525000321.126498-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5f2c81a3a0..7f4f0441a3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.0)"
+	bool "Latest version (5.1)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.19.13-cip1)"
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.0.17" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.1.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 19dfa19fec..23e584bc09 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 b0f53e12daf8e710992151333edeb7d7da3d935a6aa3db8360681f7d05a6aaa2  linux-5.1.3.tar.xz
+sha256 5c6d65faba54652b3ab4cfcb2f3be88d53478a2cd24d0f1cdd9344c7aad1e7f9  linux-5.1.4.tar.xz
 sha256 ab37029bdc9a4e3fc5dc2cc6f6e8f506a62fa42f68e50897c24fc9dbba789629  linux-5.0.17.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 707642e993775618a5afa039b1058fa49f1c0faada46e8cdcb976241bca6b288  linux-4.19.44.tar.xz
-- 
2.20.1
