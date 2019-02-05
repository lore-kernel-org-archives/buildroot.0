From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 17:33:18 +0100
Subject: [Buildroot] [git commit] linux: bump Linux CIP to version
 v4.4.171-cip30
Message-ID: <20190205163304.0FCC58445C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb26b85b90bd84af38f54fa5464d30cedd4967af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps the Linux CIP version to v4.4.171-cip30 and updates the
download url to the new official one.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 linux/linux.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8b04471008..a1cdea102d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.19)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.154-cip28)"
+	bool "Latest CIP SLTS version (v4.4.171-cip30)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -123,7 +123,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.19.18" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.171-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.mk b/linux/linux.mk
index 62068106e0..8c21bad067 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -30,7 +30,7 @@ else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = svn
 else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
-LINUX_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/bwh/linux-cip.git
+LINUX_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git
 else ifneq ($(findstring -rc,$(LINUX_VERSION)),)
 # Since 4.12-rc1, -rc kernels are generated from cgit. This also works for
 # older -rc kernels.
