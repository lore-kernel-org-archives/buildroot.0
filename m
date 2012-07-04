From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Wed, 4 Jul 2012 14:04:54 +0100
Subject: [Buildroot] [PATCH] syslinux: bump to 4.05
Message-ID: <CAJkQPOm7x8898X-bjDhN+LRN_EY8wR46WWj7hZmFOD0Q8YiASA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* bump syslinux from 4.04 to 4.05
* add patch to fix build problem with 4.05, see
http://old.nabble.com/syslinux-fails-to-build-td34112447.html

Signed-off-by: Aras Vaichas <aras.vaichas@gmail.com>
---
 syslinux-build-fix-for-uuid.patch |   15 +++++++++++++++
 syslinux.mk                         |    2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)
diff -Naur a/boot/syslinux/syslinux-build-fix-for-uuid.patch
b/boot/syslinux/syslinux-build-fix-for-uuid.patch
--- a/boot/syslinux/syslinux-build-fix-for-uuid.patch   1970-01-01
01:00:00.000000000 +0100
+++ b/boot/syslinux/syslinux-build-fix-for-uuid.patch   2012-07-04
13:19:05.263191733 +0100
@@ -0,0 +1,15 @@
+Author: Micah Gersten <micahg@ubuntu.com>
+Description: Fix build failure with --as-needed (Closes: #654838).
+
+diff -Naurp syslinux.orig/utils/Makefile syslinux/utils/Makefile
+--- syslinux.orig/utils/Makefile       2011-12-23 14:53:26.653571511 +0100
++++ syslinux/utils/Makefile    2012-01-22 18:55:03.849466924 +0100
+@@ -51,7 +51,7 @@ isohdpfx.c: $(ISOHDPFX) isohdpfxarray.pl
+       $(PERL) isohdpfxarray.pl $(ISOHDPFX) > $@
+
+ isohybrid: isohybrid.o isohdpfx.o
+-      $(CC) $(LDFLAGS) -luuid -o $@ $^
++      $(CC) $(LDFLAGS) -o $@ $^ -luuid
+
+ gethostip: gethostip.o
+       $(CC) $(LDFLAGS) -o $@ $^
diff -Naur a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
--- a/boot/syslinux/syslinux.mk 2012-07-04 13:01:21.650250091 +0100
+++ b/boot/syslinux/syslinux.mk 2012-07-04 11:25:35.169427290 +0100
@@ -4,7 +4,7 @@
 #
 #############################################################

-SYSLINUX_VERSION = 4.04
+SYSLINUX_VERSION = 4.05
 SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
 SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
