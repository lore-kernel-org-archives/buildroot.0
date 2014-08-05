From: arnaud at intelibre.fr <arnaud@intelibre.fr>
Date: Tue,  5 Aug 2014 13:16:41 +0200
Subject: [Buildroot] [PATCH 1/1] espeak: bump to version 1.48.04
Message-ID: <1407237401-22711-1-git-send-email-arnaud@intelibre.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnaud Aujon <arnaud@intelibre.fr>

* Bump to latest upstream version 1.48.04
* Remove patch as applied upstream

Signed-off-by: Arnaud Aujon <arnaud@intelibre.fr>
---
 package/espeak/espeak-01-do-not-compil-when-install.patch | 15 ---------------
 package/espeak/espeak.mk                                  |  4 ++--
 2 files changed, 2 insertions(+), 17 deletions(-)
 delete mode 100644 package/espeak/espeak-01-do-not-compil-when-install.patch

diff --git a/package/espeak/espeak-01-do-not-compil-when-install.patch b/package/espeak/espeak-01-do-not-compil-when-install.patch
deleted file mode 100644
index 983cd1c..0000000
--- a/package/espeak/espeak-01-do-not-compil-when-install.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Makefile: do not execute the rule "all" when executing "install"
-
-signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
-===================================================================
---- espeak-1.47.11-source.orig/src/Makefile
-+++ espeak-1.47.11-source/src/Makefile
-@@ -131,7 +131,7 @@
- 	rm -f $(BIN2_NAME)
- 	rm -f $(LIB_NAME)*
- 
--install: all
-+install:
- 	# Create directories
- 	rm -rf $(DESTDIR)$(DATADIR)
- 	$(MKDIR) $(DESTDIR)$(BINDIR)
diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index 571b730..9c32752 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -4,8 +4,8 @@
 #
 ###############################################################################
 
-ESPEAK_VERSION_MAJOR = 1.47
-ESPEAK_VERSION = $(ESPEAK_VERSION_MAJOR).11
+ESPEAK_VERSION_MAJOR = 1.48
+ESPEAK_VERSION = $(ESPEAK_VERSION_MAJOR).04
 ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION)-source.zip
 ESPEAK_SITE = http://downloads.sourceforge.net/project/espeak/espeak/espeak-$(ESPEAK_VERSION_MAJOR)
 ESPEAK_LICENSE = GPLv3+
-- 
1.9.3
