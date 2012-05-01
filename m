From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 13:57:09 +0200
Subject: [Buildroot] [git commit] cups: cleanup python support
Message-ID: <20120501121323.72D7A96C3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=650e8e2f5cba420f546e59103286496ac62b34eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CFLAGS handling isn't needed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/cups.mk |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index c19ae0c..7f1f52e 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -10,7 +10,6 @@ CUPS_SITE = http://ftp.easysw.com/pub/cups/$(CUPS_VERSION)
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
-CUPS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(CUPS_CFLAGS)"
 CUPS_CONF_OPT = --without-perl \
 		--without-java \
 		--disable-gnutls \
@@ -36,12 +35,10 @@ else
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-	CUPS_CONF_ENV +=	ac_cv_path_python=$(STAGING_DIR)/usr/bin/python
-	CUPS_CONF_OPT +=	--with-python
-	CUPS_DEPENDENCIES +=	python
+	CUPS_CONF_OPT += --with-python
+	CUPS_DEPENDENCIES += python
 else
-	CUPS_CONF_OPT +=	--without-python
+	CUPS_CONF_OPT += --without-python
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS_PDFTOPS),y)
