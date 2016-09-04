From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Sep 2016 15:39:32 +0200
Subject: [Buildroot] [git commit] package/jpeg: properly declare providers
Message-ID: <20160904133955.8FBA782103@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35524d3733a5570794b1460bd545ad33bf6b49ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libjpeg and jpeg-turo are providers of the jpeg virtual package, so they
must declare themselves as such.

We do not have any problem, because the dependency is computed from the
Kconfig-defined option BR2_PACKAGE_PROVIDES_JPEG, and we do not check
the Makefile-defined <FOO>_PROVIDES variable.

For the sake of correctness, make both libjpeg and jpeg-turo declare
themselves as providers for the jpeg virtual package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jpeg-turbo/jpeg-turbo.mk | 2 ++
 package/libjpeg/libjpeg.mk       | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 047e925..454b648 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -10,6 +10,8 @@ JPEG_TURBO_SITE = http://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_
 JPEG_TURBO_LICENSE = jpeg-license (BSD-3c-like)
 JPEG_TURBO_LICENSE_FILES = README README-turbo.txt
 JPEG_TURBO_INSTALL_STAGING = YES
+JPEG_TURBO_PROVIDES = jpeg
+
 JPEG_TURBO_CONF_OPTS = --with-jpeg8
 
 ifeq ($(BR2_X86_CPU_HAS_MMX)$(BR2_ARM_CPU_HAS_NEON),y)
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index 14aba61..b8f4bac 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -10,6 +10,7 @@ LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = jpeg-license (BSD-3c-like)
 LIBJPEG_LICENSE_FILES = README
 LIBJPEG_INSTALL_STAGING = YES
+LIBJPEG_PROVIDES = jpeg
 
 define LIBJPEG_REMOVE_USELESS_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom wrjpgcom)
