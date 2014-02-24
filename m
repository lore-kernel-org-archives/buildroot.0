From: Lucas Zampar Bernardi <lucas.zampar@gmail.com>
Date: Mon, 24 Feb 2014 19:58:52 -0300
Subject: [Buildroot] [PATCH] Added support for linux headers for testing
	versions to
Message-ID: <530BCEAC.5080605@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add support to build a buildroot toolchain using a testing 
version of linux kernel headers.


 From f8f0f306b9970a3b39774a43b7b47aad8692673d Mon Sep 17 00:00:00 2001
From: Lucas Zampar Bernardi <lucas@writesys.com.br>
Date: Mon, 24 Feb 2014 19:54:30 -0300
Subject: [PATCH] Added support for linux headers for testing versions to
  build cross-compile tools

---
  package/linux-headers/linux-headers.mk |    6 ++++++
  1 file changed, 6 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk 
b/package/linux-headers/linux-headers.mk
index 086e5d5..d6e9dbb 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -13,6 +13,12 @@ LINUX_HEADERS_SITE = 
$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
  else
  LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
  endif
+
+# release candidates are in testing/ subdir
+ifneq ($(findstring -rc,$(LINUX_HEADERS_VERSION)),)
+LINUX_HEADERS_SITE := $(LINUX_HEADERS_SITE)testing/
+endif
+
  LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz

  LINUX_HEADERS_INSTALL_STAGING = YES
-- 
1.7.9.5
