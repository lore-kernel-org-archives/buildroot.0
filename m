From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 11 Oct 2013 09:33:18 -0500
Subject: [Buildroot] [PATCH 3/5] glibc: add microblaze internal toolchain
In-Reply-To: <1381502000-1995-1-git-send-email-spenser@gillilanding.com>
References: <1381502000-1995-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1381502000-1995-4-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/glibc/glibc.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4dd2e63..f4ac466 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,6 +4,17 @@
 #
 ################################################################################
 
+ifeq ($(BR2_microblaze),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
+GLIBC_VERSION = 7f0bcce417c47aefad06ddfec7cd4ced3a4e10ff
+GLIBC_SITE = http://github.com/Xilinx/eglibc/tarball/$(GLIBC_VERSION)
+GLIBC_SRC_SUBDIR = .
+else
+GLIBC_VERSION = b86835ca92a1942ed08d8b5ee47498e711feaddb
+GLIBC_SITE = http://github.com/Xilinx/glibc/tarball/$(GLIBC_VERSION)
+GLIBC_SRC_SUBDIR = .
+endif
+else
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
 GLIBC_VERSION = 2.17-svnr22064
 GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
@@ -15,6 +26,7 @@ GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
 GLIBC_SRC_SUBDIR = .
 endif
+endif
 
 GLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
 GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
-- 
1.7.1
