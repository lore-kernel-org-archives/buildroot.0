From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Sat, 07 Mar 2015 15:35:20 +0100
Subject: [Buildroot] [PATCH 2/2] wine: Add gettext dependency check for
	host-wine
Message-ID: <54FB0CA8.10001@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---

 package/wine/wine.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index e931c87..9c6e2aa 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -237,6 +237,13 @@ else
 WINE_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo
+WINE_DEPENDENCIES += gettext
+else
+HOST_WINE_CONF_OPTS += --without-gettext --without-gettextpo
+endif
+
 # Wine needs to enable 64-bit build tools on 64-bit host
 ifeq ($(HOSTARCH),x86_64)
 HOST_WINE_CONF_OPTS += --enable-win64
@@ -274,8 +281,6 @@ HOST_WINE_CONF_OPTS += \
        --without-curses \
        --without-dbus \
        --without-fontconfig \
-       --without-gettext \
-       --without-gettextpo \
        --without-gphoto \
        --without-glu \
        --without-gnutls \
