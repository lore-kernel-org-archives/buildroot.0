From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 15 Mar 2015 12:35:34 +0100
Subject: [Buildroot] [PATCH v4] wine: Add gettext dependency for host-wine
Message-ID: <55056E86.5020109@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mostly based on a comment by Yann E. MORIN

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wine/wine.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index aa474f9..a699fff 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -243,6 +243,10 @@ else
 WINE_CONF_OPTS += --without-zlib
 endif
 
+# host-gettext is essential for .po file support in host-wine wrc
+HOST_WINE_DEPENDENCIES += host-gettext
+HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo
+
 # Wine needs to enable 64-bit build tools on 64-bit host
 ifeq ($(HOSTARCH),x86_64)
 HOST_WINE_CONF_OPTS += --enable-win64
@@ -280,8 +284,6 @@ HOST_WINE_CONF_OPTS += \
 	--without-curses \
 	--without-dbus \
 	--without-fontconfig \
-	--without-gettext \
-	--without-gettextpo \
 	--without-gphoto \
 	--without-glu \
 	--without-gnutls \
-- 
1.9.1
