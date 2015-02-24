From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 24 Feb 2015 14:40:46 +0100
Subject: [Buildroot] [PATCH 1/1] linux: add support for 4.x versions.
Message-ID: <1424785246-21219-1-git-send-email-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 linux/linux.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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
-- 
2.0.5
