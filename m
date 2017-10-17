From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 17 Oct 2017 13:11:33 +0200
Subject: [Buildroot] [PATCH 1/1] cups: bump version to 2.2.5
Message-ID: <20171017111133.31950-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/cups/0003-Sanitize-the-installation-process.patch | 8 ++++----
 package/cups/cups.hash                                    | 2 +-
 package/cups/cups.mk                                      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cups/0003-Sanitize-the-installation-process.patch b/package/cups/0003-Sanitize-the-installation-process.patch
index f1128daa2d..75a68487c6 100644
--- a/package/cups/0003-Sanitize-the-installation-process.patch
+++ b/package/cups/0003-Sanitize-the-installation-process.patch
@@ -37,18 +37,18 @@ index 3afef0a..3e4f1bd 100644
  # Installation programs...
  #
  
--INSTALL_BIN	=	$(LIBTOOL) $(INSTALL) -c -m @CUPS_EXE_FILE_PERM@ @INSTALL_STRIP@
+-INSTALL_BIN	=	@LIBTOOL_INSTALL@ $(INSTALL) -c -m @CUPS_EXE_FILE_PERM@ @INSTALL_STRIP@
 -INSTALL_COMPDATA =	$(INSTALL) -c -m 444 @INSTALL_GZIP@
-+INSTALL_BIN	=	$(LIBTOOL) $(INSTALL) -c -m 755
++INSTALL_BIN	=	@LIBTOOL_INSTALL@ $(INSTALL) -c -m 755
 +INSTALL_COMPDATA =	$(INSTALL) -c -m 644 @INSTALL_GZIP@
  INSTALL_CONFIG	=	$(INSTALL) -c -m @CUPS_CONFIG_FILE_PERM@
 -INSTALL_DATA	=	$(INSTALL) -c -m 444
 +INSTALL_DATA	=	$(INSTALL) -c -m 644
  INSTALL_DIR	=	$(INSTALL) -d
--INSTALL_LIB	=	$(LIBTOOL) $(INSTALL) -c -m @CUPS_EXE_FILE_PERM@ @INSTALL_STRIP@
+-INSTALL_LIB	=	@LIBTOOL_INSTALL@ $(INSTALL) -c -m @CUPS_EXE_FILE_PERM@ @INSTALL_STRIP@
 -INSTALL_MAN	=	$(INSTALL) -c -m 444
 -INSTALL_SCRIPT	=	$(INSTALL) -c -m @CUPS_EXE_FILE_PERM@
-+INSTALL_LIB	=	$(LIBTOOL) $(INSTALL) -c -m 755
++INSTALL_LIB	=	@LIBTOOL_INSTALL@ $(INSTALL) -c -m 755
 +INSTALL_MAN	=	$(INSTALL) -c -m 644
 +INSTALL_SCRIPT	=	$(INSTALL) -c -m 755
  
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index f9eed42df1..d4f20b60db 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,2 +1,2 @@
 # Locally calculated:
-sha256 596d4db72651c335469ae5f37b0da72ac9f97d73e30838d787065f559dea98cc  cups-2.2.4-source.tar.gz
+sha256 a8795e2aa54dcfbdc9ff254a770f0d7154e35c981bca5b3369050c5193ab5a21  cups-2.2.5-source.tar.gz
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index f5e2a3f217..0726d8a37f 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.2.4
+CUPS_VERSION = 2.2.5
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = GPL-2.0, LGPL-2.0
-- 
2.11.0
