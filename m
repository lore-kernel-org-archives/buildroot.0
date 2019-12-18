From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Dec 2019 10:14:07 +0100
Subject: [Buildroot] [git commit] linux: bump CIP kernel to version
 4.19.88-cip16
Message-ID: <20191218090636.4CA6F8B8C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=843c8a404cbc860e509afe7518e65fa75111d22c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps Linux CIP version to 4.19.88-cip16.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 13bd21a62c..c1feb78529 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,7 +30,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.4)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.82-cip14)"
+	bool "Latest CIP SLTS version (4.19.88-cip16)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -129,8 +129,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.4.2" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.82-cip14" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.72-cip10-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "4.19.88-cip16" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 5eb4307bf5..506dc80370 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -6,3 +6,5 @@ sha256 5da5e16fe08fa506f8f74aa4f17be22b52c0f513e9a3f7e7ae22fc53597ad493  linux-4
 sha256 1df27899a9bc4dd874f3830ab9e7b638f0026dffd67a2e230444e5d2805ccad6  linux-4.9.206.tar.xz
 sha256 0d49ec72e273f6fc7462ad56849b2285f13fd5f4185e8f932a0074fc2eca1bb3  linux-4.14.158.tar.xz
 sha256 c1923b6bd166e6dd07be860c15f59e8273aaa8692bc2a1fce1d31b826b9b3fbe  linux-4.19.88.tar.xz
+# Locally computed
+sha256 6d60ce76bce2e1938f64027d12b1988c95245751feb635adfc551a021d5b3f26  linux-cip-4.19.88-cip16.tar.gz
