From: Daniel Price <daniel.price@gmail.com>
Date: Tue, 19 Mar 2013 15:21:38 -0700
Subject: [Buildroot] [PATCH] syslinux: bump to version 4.06
Message-ID: <1363731698-15414-1-git-send-email-daniel.price@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Price <daniel.price@gmail.com>
---
 boot/syslinux/syslinux-build-fix-for-uuid.patch |   15 ---------------
 boot/syslinux/syslinux.mk                       |    2 +-
 2 files changed, 1 insertions(+), 16 deletions(-)
 delete mode 100644 boot/syslinux/syslinux-build-fix-for-uuid.patch

diff --git a/boot/syslinux/syslinux-build-fix-for-uuid.patch b/boot/syslinux/syslinux-build-fix-for-uuid.patch
deleted file mode 100644
index 04ff562..0000000
--- a/boot/syslinux/syslinux-build-fix-for-uuid.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Author: Micah Gersten <micahg@ubuntu.com>
-Description: Fix build failure with --as-needed (Closes: #654838).
-
-diff -Naurp syslinux.orig/utils/Makefile syslinux/utils/Makefile
---- syslinux.orig/utils/Makefile       2011-12-23 14:53:26.653571511 +0100
-+++ syslinux/utils/Makefile    2012-01-22 18:55:03.849466924 +0100
-@@ -51,7 +51,7 @@ isohdpfx.c: $(ISOHDPFX) isohdpfxarray.pl
- 	$(PERL) isohdpfxarray.pl $(ISOHDPFX) > $@
-
- isohybrid: isohybrid.o isohdpfx.o
--	$(CC) $(LDFLAGS) -luuid -o $@ $^
-+	$(CC) $(LDFLAGS) -o $@ $^ -luuid
-
- gethostip: gethostip.o
- 	$(CC) $(LDFLAGS) -o $@ $^
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index f63f2e0..046bdc3 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SYSLINUX_VERSION = 4.05
+SYSLINUX_VERSION = 4.06
 SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
 SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
 
-- 
1.7.6.5
