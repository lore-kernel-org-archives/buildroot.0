From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 20 Apr 2012 16:34:46 +0200
Subject: [Buildroot] [PATCH] kexec: update to kexec-tools 2.0.3
Message-ID: <1334932486-6346-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop kexec-fix-linker-options.patch as this has been fixed upstream.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/kexec/kexec-fix-linker-options.patch |   15 ---------------
 package/kexec/kexec.mk                       |    2 +-
 2 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 package/kexec/kexec-fix-linker-options.patch

diff --git a/package/kexec/kexec-fix-linker-options.patch b/package/kexec/kexec-fix-linker-options.patch
deleted file mode 100644
index 7bd5f1d..0000000
--- a/package/kexec/kexec-fix-linker-options.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Fix compilation with gcc 4.6 by correcting the way that linker options
-are passed to gcc.
-
-Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---- kexec-2.0.2/purgatory/Makefile.orig	2011-09-26 14:16:44.256595912 +0200
-+++ kexec-2.0.2/purgatory/Makefile	2011-09-26 14:17:01.606621357 +0200
-@@ -56,7 +56,7 @@
- 			-I$(srcdir)/include \
- 			-I$(shell $(CC) -print-file-name=include)
- $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
--			--no-undefined -nostartfiles -nostdlib -nodefaultlibs \
-+			-Wl,-no-undefined -nostartfiles -nostdlib -nodefaultlibs \
- 			-e purgatory_start -r
- 
- $(PURGATORY): $(PURGATORY_OBJS)
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index ed01494..ef99dfb 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -3,7 +3,7 @@
 # kexec
 #
 #############################################################
-KEXEC_VERSION = 2.0.2
+KEXEC_VERSION = 2.0.3
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.bz2
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 
-- 
1.7.9.5
