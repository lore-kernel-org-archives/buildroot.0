From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 17:22:35 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] linux: bump Linux CIP to
 version v4.4.171-cip30
Message-ID: <20190218162302.EE65680FA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f267c07967e84c004c7e3df9ed2e46c081e23e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

This patch bumps the Linux CIP version to v4.4.171-cip30 and updates the
download url to the new official one.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fb26b85b90bd84af38f54fa5464d30cedd4967af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 linux/linux.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index efce31c7e1..e9272237c6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,7 +33,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.18)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.154-cip28)"
+	bool "Latest CIP SLTS version (v4.4.171-cip30)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -121,7 +121,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.18.20" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.171-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.mk b/linux/linux.mk
index bc688fca92..ce0b371734 100644
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
