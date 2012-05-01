From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 14:05:27 +0200
Subject: [Buildroot] [git commit] cups: bump version
Message-ID: <20120501121323.905C896C3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fac43bd78498fb92561a6f11bc999a044f06c749
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For newer versions than 1.3.x, the patches will need to be reworked.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/cups-no-tests-man.patch |   13 -------------
 package/cups/cups.mk                 |    2 +-
 2 files changed, 1 insertions(+), 14 deletions(-)

diff --git a/package/cups/cups-no-tests-man.patch b/package/cups/cups-no-tests-man.patch
deleted file mode 100644
index 567c801..0000000
--- a/package/cups/cups-no-tests-man.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- cups-1.3.5/Makefile	2007-12-06 15:09:39.000000000 -0500
-+++ cups-1.3.5/Makefile	2008-02-09 21:53:03.000000000 -0500
-@@ -19,8 +19,8 @@ include Makedefs
- # Directories to make...
- #
- 
--DIRS	=	cups backend berkeley cgi-bin filter locale man monitor \
--		notifier $(PDFTOPS) scheduler systemv test \
-+DIRS	=	cups backend berkeley cgi-bin filter locale monitor \
-+		notifier $(PDFTOPS) scheduler systemv \
- 		$(PHPDIR) \
- 		conf data doc $(FONTS) ppd templates
- 
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index b953a4b..1508b6e 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 1.3.9
+CUPS_VERSION = 1.3.11
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
 CUPS_SITE = http://ftp.easysw.com/pub/cups/$(CUPS_VERSION)
 CUPS_INSTALL_STAGING = YES
