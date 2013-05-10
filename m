From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 10 May 2013 19:36:50 +0200
Subject: [Buildroot] [PATCH v2 1/1] linux.mk: change the linux tarball
	compression to xz
In-Reply-To: <1368207410-9626-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1368207410-9626-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1368207410-9626-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 linux/linux.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index d375cf0..7ac147c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -3,6 +3,7 @@
 # Linux kernel target
 #
 ###############################################################################
+
 LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPLv2
 LINUX_LICENSE_FILES = COPYING
@@ -16,7 +17,7 @@ else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
 LINUX_SITE_METHOD = git
 else
-LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
+LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
-- 
1.7.9.5
