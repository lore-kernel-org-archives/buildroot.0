From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 21:52:22 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/subversion: fix
 build with NLS
Message-ID: <20190501201631.A177B839E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf90b0b417bb83af1b62b9c5e0670fb09a86182e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/098a05b397ba1b05df561b6872b39e17a2bf27df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5cad1fe1ff240b97a47a4eda99252a171136977c)
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
