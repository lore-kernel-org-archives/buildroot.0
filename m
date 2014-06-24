From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 14:33:10 -0300
Subject: [Buildroot] [PATCH] crda: bump to version 3.13
Message-ID: <1403631190-9354-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...d-DESTDIR-support-in-install-libreg-rules.patch | 37 ++++++++++++++++++++++
 package/crda/crda.mk                               |  6 ++--
 2 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch

diff --git a/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch b/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch
new file mode 100644
index 0000000..ab25b38
--- /dev/null
+++ b/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch
@@ -0,0 +1,37 @@
+From 2cabb2588da56735369131b709f191453c080be0 Mon Sep 17 00:00:00 2001
+From: "John W. Linville" <linville@tuxdriver.com>
+Date: Fri, 14 Feb 2014 13:58:44 -0500
+Subject: [PATCH 1/4] crda: Add DESTDIR support in install-libreg* rules in
+ Makefile
+
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
+---
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0b2f0d7..1f25509 100644
+--- a/Makefile
++++ b/Makefile
+@@ -120,13 +120,13 @@ $(LIBREG): regdb.h reglib.h reglib.c
+ 
+ install-libreg-headers:
+ 	$(NQ) '  INSTALL  libreg-headers'
+-	$(Q)mkdir -p $(INCLUDE_DIR)
+-	$(Q)cp *.h $(INCLUDE_DIR)/
++	$(Q)mkdir -p $(DESTDIR)/$(INCLUDE_DIR)
++	$(Q)cp *.h $(DESTDIR)/$(INCLUDE_DIR)/
+ 
+ install-libreg:
+ 	$(NQ) '  INSTALL  libreg'
+-	$(Q)mkdir -p $(LIBDIR)
+-	$(Q)cp $(LIBREG) $(LIBDIR)/
++	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
++	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
+ 	$(Q)ldconfig
+ 
+ %.o: %.c regdb.h $(LIBREG)
+-- 
+1.8.5.5
+
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index 01e8684..f3d3e80 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CRDA_VERSION = 1.1.3
-CRDA_SOURCE = crda-$(CRDA_VERSION).tar.bz2
-CRDA_SITE = http://wireless.kernel.org/download/crda
+CRDA_VERSION = 3.13
+CRDA_SOURCE = crda-$(CRDA_VERSION).tar.xz
+CRDA_SITE = $(BR2_KERNEL_MIRROR)/software/network/crda
 CRDA_DEPENDENCIES = host-pkgconf host-python-m2crypto \
 	libnl libgcrypt host-python
 CRDA_LICENSE = ISC
-- 
1.8.5.5
