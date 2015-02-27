From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 16:14:27 +0100
Subject: [Buildroot] [git commit] linux: add support for 4.x versions
Message-ID: <20150227154450.3C89E7FA39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0e44a348a922236884f4fdf2e739583d04b7a70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 29f59e8..0b8c912 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -25,12 +25,14 @@ LINUX_SITE_METHOD = hg
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
-# to use the $(word) function. We support versions such as 3.1,
+# to use the $(word) function. We support versions such as 4.0, 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
 ifeq ($(findstring x2.6.,x$(LINUX_VERSION)),x2.6.)
 LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
-else
+else ifeq ($(findstring x3.,x$(LINUX_VERSION)),x3.)
 LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
+else ifeq ($(findstring x4.,x$(LINUX_VERSION)),x4.)
+LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
 endif
 # release candidates are in testing/ subdir
 ifneq ($(findstring -rc,$(LINUX_VERSION)),)
