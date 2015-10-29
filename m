From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Oct 2015 23:23:17 +1030
Subject: [Buildroot] [PATCH] package/kexec-lite: update to latest version
Message-ID: <1446123197-9392-1-git-send-email-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jeremy Kerr <jk@ozlabs.org>

Upstream now supports little endian, so enable for little-endian
powerpc.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/kexec-lite/Config.in     | 2 +-
 package/kexec-lite/kexec-lite.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index ede5cba..fcc0d88 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KEXEC_LITE
 	bool "kexec-lite"
-	depends on BR2_powerpc || BR2_powerpc64
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	depends on !BR2_STATIC_LIBS # dtc, elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index 7e3c8d3..27bc204 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_LITE_VERSION = fb8543fea3beb0522b5a63a74ea1a845dbd7b954
+KEXEC_LITE_VERSION = 783fb4a811d0b0f8cc2ed68fa7872dcad56a3944
 KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
 KEXEC_LITE_LICENSE = GPLv2+
 KEXEC_LITE_DEPENDENCIES = elfutils dtc
-- 
2.6.2
