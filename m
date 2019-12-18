From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Dec 2019 10:14:45 +0100
Subject: [Buildroot] [git commit] linux: bump CIP RT kernel to version
 4.19.82-cip14-rt5
Message-ID: <20191218090636.54DA58B91A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75b13a77d08169e33c884683c8df22ad25a1b08b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps Linux CIP RT version to 4.19.82-cip14-rt5.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c1feb78529..77f3f248d8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -49,7 +49,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.72-cip10-rt4)"
+	bool "Latest CIP RT SLTS version (4.19.82-cip14-rt5)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -129,8 +129,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.4.2" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.72-cip10-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default "4.19.88-cip16" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.82-cip14-rt5" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 506dc80370..940c85bd42 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -8,3 +8,4 @@ sha256 0d49ec72e273f6fc7462ad56849b2285f13fd5f4185e8f932a0074fc2eca1bb3  linux-4
 sha256 c1923b6bd166e6dd07be860c15f59e8273aaa8692bc2a1fce1d31b826b9b3fbe  linux-4.19.88.tar.xz
 # Locally computed
 sha256 6d60ce76bce2e1938f64027d12b1988c95245751feb635adfc551a021d5b3f26  linux-cip-4.19.88-cip16.tar.gz
+sha256 74ec782e11344e5c5db8e48899b464e296ef37acfb43ce7dfb01c09ea8d3e959  linux-cip-4.19.82-cip14-rt5.tar.gz
