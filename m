From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 11 Jan 2017 11:56:11 -0800
Subject: [Buildroot] [PATCH] linux-headers: Account for LINUX_OVERRIDE_SRCDIR
Message-ID: <20170111195611.837-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the value of LINUX_OVERRIDE_SRCDIR as override directory when
BR2_KERNEL_HEADERS_AS_KERNEL is specified.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/linux-headers/linux-headers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 0900778..197efb4 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -10,6 +10,7 @@
 ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
 
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_HEADERS_OVERRIDE_SRCDIR = $(LINUX_OVERRIDE_SRCDIR)
 
 # Compute LINUX_HEADERS_SOURCE and LINUX_HEADERS_SITE from the configuration
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
-- 
2.9.3
