From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Jan 2021 08:11:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/pinentry: drop unrecognized option
Message-ID: <20210129071100.753693-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop --with-x option which is not recognized:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --disable-static, --enable-shared, --with-x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pinentry/pinentry.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 1bc1adab17..e7bd31d40e 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -22,13 +22,6 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 PINENTRY_CONF_ENV += LIBS=-latomic
 endif
 
-# build with X if available
-ifeq ($(BR2_PACKAGE_XORG7),y)
-PINENTRY_CONF_OPTS += --with-x
-else
-PINENTRY_CONF_OPTS += --without-x
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSECRET),y)
 PINENTRY_CONF_OPTS += --enable-libsecret
 PINENTRY_DEPENDENCIES += libsecret
-- 
2.29.2
