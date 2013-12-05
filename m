From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Dec 2013 18:20:54 +0100
Subject: [Buildroot] [PATCH 11/16] glibc: add microblaze internal toolchain
In-Reply-To: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386264059-14057-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Spenser Gilliland <spenser@gillilanding.com>

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/glibc.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index eb29143..96de02a 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,6 +4,17 @@
 #
 ################################################################################
 
+ifeq ($(BR2_microblaze),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
+GLIBC_VERSION = 7f0bcce417c47aefad06ddfec7cd4ced3a4e10ff
+GLIBC_SITE = $(call github,Xilinx,eglibc,$(GLIBC_VERSION))
+GLIBC_SRC_SUBDIR = .
+else
+GLIBC_VERSION = b86835ca92a1942ed08d8b5ee47498e711feaddb
+GLIBC_SITE = $(call github,Xilinx,glibc,$(GLIBC_VERSION))
+GLIBC_SRC_SUBDIR = .
+endif
+else
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
 GLIBC_VERSION = 2.18-svnr23787
 GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
@@ -15,6 +26,7 @@ GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
 GLIBC_SRC_SUBDIR = .
 endif
+endif
 
 GLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
 GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
-- 
1.8.1.2
