From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 12 Nov 2013 11:31:43 -0600
Subject: [Buildroot] [PATCH v2 3/5] glibc: add microblaze internal toolchain
In-Reply-To: <1384277505-11503-1-git-send-email-spenser@gillilanding.com>
References: <1384277505-11503-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1384277505-11503-4-git-send-email-spenser@gillilanding.com>
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
index 2e7fe82..91ad29e 100644
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
