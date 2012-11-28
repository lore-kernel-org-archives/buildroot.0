From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:23 +0100
Subject: [Buildroot] [PATCH 24/51] package/qemu: fix host-qemu variable names
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-25-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the upcoming introduction of qemu-on-target, we need to properly
separate the variables used for the host qemu, from the variables
used for the target qemu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk |   25 ++++++++++++++-----------
 1 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 36d855e..64be5c7 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -13,7 +13,10 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #       the non-(L)GPL license texts are specified in the affected
 #       individual source files.
 
-QEMU_DEPENDENCIES = host-pkgconf zlib libglib2
+#-------------------------------------------------------------
+# Host-qemu
+
+HOST_QEMU_DEPENDENCIES = host-pkgconf zlib libglib2
 
 #       BR ARCH         qemu
 #       -------         ----
@@ -44,20 +47,20 @@ QEMU_DEPENDENCIES = host-pkgconf zlib libglib2
 #       sh64            not supported
 #       sparc           sparc
 
-QEMU_ARCH = $(ARCH)
-ifeq ($(QEMU_ARCH),i486)
-    QEMU_ARCH = i386
+HOST_QEMU_ARCH = $(ARCH)
+ifeq ($(HOST_QEMU_ARCH),i486)
+    HOST_QEMU_ARCH = i386
 endif
-ifeq ($(QEMU_ARCH),i586)
-    QEMU_ARCH = i386
+ifeq ($(HOST_QEMU_ARCH),i586)
+    HOST_QEMU_ARCH = i386
 endif
-ifeq ($(QEMU_ARCH),i686)
-    QEMU_ARCH = i386
+ifeq ($(HOST_QEMU_ARCH),i686)
+    HOST_QEMU_ARCH = i386
 endif
-ifeq ($(QEMU_ARCH),powerpc)
-    QEMU_ARCH = ppc
+ifeq ($(HOST_QEMU_ARCH),powerpc)
+    HOST_QEMU_ARCH = ppc
 endif
-HOST_QEMU_TARGETS=$(QEMU_ARCH)-linux-user
+HOST_QEMU_TARGETS=$(HOST_QEMU_ARCH)-linux-user
 
 define HOST_QEMU_CONFIGURE_CMDS
 	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure   \
-- 
1.7.2.5
