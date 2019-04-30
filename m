From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 13:14:54 +0200
Subject: [Buildroot] [git commit] package/subversion: fix build with NLS
Message-ID: <20190430111513.7592183D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cad1fe1ff240b97a47a4eda99252a171136977c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/098a05b397ba1b05df561b6872b39e17a2bf27df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/subversion.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index db7e36a638..0e26cfd4be 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -9,7 +9,14 @@ SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
 SUBVERSION_LICENSE = Apache-2.0
 SUBVERSION_LICENSE_FILES = LICENSE
-SUBVERSION_DEPENDENCIES = host-pkgconf apr apr-util expat zlib sqlite
+SUBVERSION_DEPENDENCIES = \
+	host-pkgconf \
+	apr \
+	apr-util \
+	expat \
+	zlib \
+	sqlite \
+	$(TARGET_NLS_DEPENDENCIES)
 SUBVERSION_AUTORECONF = YES
 SUBVERSION_CONF_OPTS = \
 	--with-expat=$(STAGING_DIR)/usr/include:$(STAGING_DIR)/usr/lib: \
@@ -22,5 +29,6 @@ SUBVERSION_CONF_OPTS = \
 	--without-sasl \
 	--without-gnome-keyring \
 	--without-libmagic
+SUBVERSION_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
