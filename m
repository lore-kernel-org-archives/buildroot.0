From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 08:41:46 +0200
Subject: [Buildroot] [git commit] glibc: remove redundant version logic
Message-ID: <20140602064241.C73D29CE6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ec6bc5137af4d862c81ceb97abf2511846367f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 990a46fdec6a (glibc: move version handling to Config.in) we use
Config.in version strings. Remove glibc.mk duplicate.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d465665..a0077d2 100644
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
 
