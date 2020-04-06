From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:35:01 +0200
Subject: [Buildroot] [git commit] package/libsecret: enable
 gobject-introspection support
Message-ID: <20200406202227.3B9D68D32F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07c05920d84e7ddeec34640beda5d393cb04340c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsecret/libsecret.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index b48d2e7086..f87df47097 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -15,11 +15,17 @@ LIBSECRET_CONF_OPTS = \
 	--disable-manpages \
 	--disable-strict \
 	--disable-coverage \
-	--enable-introspection=no \
 	--enable-vala=no
 LIBSECRET_LICENSE = LGPL-2.1+
 LIBSECRET_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBSECRET_CONF_OPTS += --enable-introspection=yes
+LIBSECRET_DEPENDENCIES += gobject-introspection
+else
+LIBSECRET_CONF_OPTS += --enable-introspection=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSECRET_DEPENDENCIES += libgcrypt
 LIBSECRET_CONF_OPTS += --enable-gcrypt \
