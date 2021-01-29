From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:39:53 +0100
Subject: [Buildroot] [git commit] package/pinentry: drop unrecognized option
Message-ID: <20210129082033.4933481530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b7c0c6b789b220c028a8807f9e00e80f622b420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop --with-x option which is not recognized:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --disable-static, --enable-shared, --with-x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
