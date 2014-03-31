From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Mar 2014 22:06:17 +0200
Subject: [Buildroot] [PATCH 04/16] flex: Version bump 2.5.39
In-Reply-To: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396296389-28821-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- upstream fixed Makefile.in, flex-prog-ar.patch is unneeded now

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/flex/flex-prog-ar.patch |   11 -----------
 package/flex/flex.mk            |    2 +-
 2 files changed, 1 insertion(+), 12 deletions(-)
 delete mode 100644 package/flex/flex-prog-ar.patch

diff --git a/package/flex/flex-prog-ar.patch b/package/flex/flex-prog-ar.patch
deleted file mode 100644
index e0626ff..0000000
--- a/package/flex/flex-prog-ar.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -rup flex-2.5.33.orig/Makefile.in flex-2.5.33/Makefile.in
---- flex-2.5.33.orig/Makefile.in	2007-01-18 17:29:25.000000000 +0100
-+++ flex-2.5.33/Makefile.in	2007-01-18 18:28:22.000000000 +0100
-@@ -105,7 +105,6 @@ am__installdirs = "$(DESTDIR)$(libdir)"
- 	"$(DESTDIR)$(includedir)"
- libLIBRARIES_INSTALL = $(INSTALL_DATA)
- LIBRARIES = $(lib_LIBRARIES)
--AR = ar
- ARFLAGS = cru
- libfl_a_AR = $(AR) $(ARFLAGS)
- libfl_a_LIBADD =
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 17f651b..2373d04 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLEX_VERSION = 2.5.37
+FLEX_VERSION = 2.5.39
 FLEX_SITE = http://download.sourceforge.net/project/flex
 FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
-- 
1.7.10.4
