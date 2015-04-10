From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 10 Apr 2015 21:57:54 +0200
Subject: [Buildroot] [PATCH 1/1] linux-headers: add support for 4.x versions
Message-ID: <1428695874-27584-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/linux-headers/linux-headers.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index d770927..ca68a5b 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -10,8 +10,10 @@
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
-else
+else ifeq ($(findstring x3.,x$(LINUX_HEADERS_VERSION)),x3.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
+else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
+LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 
-- 
1.9.1
