From: =?windows-1252?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 08 Mar 2015 15:22:11 +0100
Subject: [Buildroot] [PATCH 1/2] wine: Add openldap dependency check
Message-ID: <54FC5B13.90707@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---

 package/wine/wine.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

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
