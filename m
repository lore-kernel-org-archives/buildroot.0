From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 11:51:48 +0100
Subject: [Buildroot] [git commit] syslinux: bump to version 4.06
Message-ID: <20130324105116.878B09B257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c12b0672264dc8c7ef0039d0c2aa6a58d6ae9bfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Price <daniel.price@gmail.com>
Tested-by: Will Moore <will.moore@beraninstruments.com>
Tested-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/syslinux/syslinux-build-fix-for-uuid.patch |   15 ---------------
 boot/syslinux/syslinux.mk                       |    2 +-
 2 files changed, 1 insertions(+), 16 deletions(-)

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
 
