From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 18:22:42 +0200
Subject: [Buildroot] [git commit] libglib2: bump to 2.28.6
Message-ID: <20110518180430.DAC6583564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a058eedbf57cc5c94ba67ee4e2503a12e01e12fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch libglib2-mkenums-nowarn.patch is removed, since it has been
merged upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2-mkenums-nowarn.patch |   14 --------------
 package/libglib2/libglib2.mk                   |    4 ++--
 2 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100644 package/libglib2/libglib2-mkenums-nowarn.patch

diff --git a/package/libglib2/libglib2-mkenums-nowarn.patch b/package/libglib2/libglib2-mkenums-nowarn.patch
deleted file mode 100644
index d92183e..0000000
--- a/package/libglib2/libglib2-mkenums-nowarn.patch
+++ /dev/null
@@ -1,14 +0,0 @@
----
- gobject/glib-mkenums.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: glib-2.26.0/gobject/glib-mkenums.in
-===================================================================
---- glib-2.26.0.orig/gobject/glib-mkenums.in
-+++ glib-2.26.0/gobject/glib-mkenums.in
-@@ -1,4 +1,4 @@
--#!@PERL_PATH@ -w
-+#!@PERL_PATH@
- 
- use File::Basename;
- use Safe;
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 57facfc..828af21 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -3,8 +3,8 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.26
-LIBGLIB2_VERSION_MINOR = 1
+LIBGLIB2_VERSION_MAJOR = 2.28
+LIBGLIB2_VERSION_MINOR = 6
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
1.7.3.4
