From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  2 Jun 2014 06:42:04 +0300
Subject: [Buildroot] [PATCH] glibc: remove redundant version logic
Message-ID: <22d4afc12d7eb01dc41b9ac5e4cb3e25867d0073.1401680524.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 990a46fdec6a (glibc: move version handling to Config.in) we use
Config.in version strings. Remove glibc.mk duplicate.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/glibc/glibc.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d4656654e0d6..a0077d252181 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,19 +4,18 @@
 #
 ################################################################################
 
+GLIBC_VERSION = $(call qstrip,$(BR2_GLIBC_VERSION_STRING))
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
-GLIBC_VERSION = $(if $(BR2_EGLIBC_VERSION_2_19),2.19-svnr25243,2.18-svnr23787)
 GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
 GLIBC_SOURCE = eglibc-$(GLIBC_VERSION).tar.bz2
 GLIBC_SRC_SUBDIR = libc
 else
-GLIBC_VERSION = $(if $(BR2_GLIBC_VERSION_2_19),2.19,2.18)
 GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
 GLIBC_SRC_SUBDIR = .
 endif
 
-GLIBC_VERSION = $(call qstrip,$(BR2_GLIBC_VERSION_STRING))
 GLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
 GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
 
-- 
2.0.0.rc2
