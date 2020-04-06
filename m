From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:35:39 +0200
Subject: [Buildroot] [git commit] package/libgee: enable
 gobject-introspection support
Message-ID: <20200406202227.806B47FA55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3915e17e7734ee3abe088d4ce1893eecd7cc4663
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgee/libgee.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 81fd354fe8..4b2581e171 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -13,4 +13,11 @@ LIBGEE_INSTALL_STAGING = YES
 LIBGEE_LICENSE = LGPL-2.1+
 LIBGEE_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBGEE_CONF_OPTS += --enable-introspection
+LIBGEE_DEPENDENCIES += gobject-introspection
+else
+LIBGEE_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
