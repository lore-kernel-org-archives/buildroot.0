From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 18:48:04 +0100
Subject: [Buildroot] [git commit] wine: Add openldap dependency check
Message-ID: <20150308174809.4D183807F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa200b2438e3de61ebfe821d9d4bc6ee9867ea0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index e931c87..571606d 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -23,7 +23,6 @@ WINE_CONF_OPTS = \
 	--without-gphoto \
 	--without-gsm \
 	--without-hal \
-	--without-ldap \
 	--without-netapi \
 	--without-openal \
 	--without-opencl \
@@ -160,6 +159,13 @@ else
 WINE_CONF_OPTS += --without-curses
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+WINE_CONF_OPTS += --with-ldap
+WINE_DEPENDENCIES += openldap
+else
+WINE_CONF_OPTS += --without-ldap
+endif
+
 ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
 WINE_CONF_OPTS += --with-sane
 WINE_DEPENDENCIES += sane-backends
