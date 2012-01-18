From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:55 +0100
Subject: [Buildroot] [git commit] libxslt: cleanup
Message-ID: <20120118150408.1C67C90386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db8fcd04ba94ce8b2916c624a8231d6505beb301
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

get rid of unused EXTRA variables.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxslt/libxslt.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index fec85f0..2a1730e 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -8,18 +8,18 @@ LIBXSLT_VERSION = 1.1.26
 LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
 LIBXSLT_INSTALL_STAGING = YES
 
+LIBXSLT_CONF_OPT = --with-gnu-ld --without-debug \
+		--without-python --with-libxml-prefix=$(STAGING_DIR)/usr/
+
+LIBXSLT_DEPENDENCIES = libxml2
+
 # If we have enabled libgcrypt then use it, else disable crypto support.
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-LIBXSLT_DEPENDENCIES_EXTRA=libgcrypt
+LIBXSLT_DEPENDENCIES += libgcrypt
 else
-LIBXSLT_XTRA_CONF_OPT = --without-crypto
+LIBXSLT_CONF_OPT = --without-crypto
 endif
 
-LIBXSLT_CONF_OPT = --with-gnu-ld $(LIBXSLT_XTRA_CONF_OPT) --without-debug \
-		--without-python --with-libxml-prefix=$(STAGING_DIR)/usr/
-
-LIBXSLT_DEPENDENCIES = libxml2 $(LIBXSLT_DEPENDENCIES_EXTRA)
-
 HOST_LIBXSLT_CONF_OPT = --without-debug --without-python --without-crypto
 
 HOST_LIBXSLT_DEPENDENCIES = host-libxml2
