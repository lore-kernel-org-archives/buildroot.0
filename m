From: Lucas Zampar Bernardi <lucas.zampar@gmail.com>
Date: Tue, 25 Feb 2014 10:22:08 -0300
Subject: [Buildroot] [PATCH] Added support for linux headers for testing
	versions to build cross-compile tools
Message-ID: <1393334528-10441-1-git-send-email-lucas.zampar@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lucas Zampar Bernardi <lucas@writesys.com.br>


This patch add support to buildroot compile an internal cross-compiler using linux hearders with releases candidates versions (testing).
---
 package/linux-headers/linux-headers.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 086e5d5..d6e9dbb 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -13,6 +13,12 @@ LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
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
