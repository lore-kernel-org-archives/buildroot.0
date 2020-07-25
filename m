From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 13:01:06 +0200
Subject: [Buildroot] [git commit] package/libgsasl: enable gcrypt support
Message-ID: <20200725105722.EC6C48845B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4ff6bf2272df54e8d4594a19fb76fe33e980da2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgsasl/libgsasl.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index 0cec9c73bd..40e7c4c918 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -9,8 +9,13 @@ LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
 LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
 LIBGSASL_INSTALL_STAGING = YES
-# It doesn't seem to build with our libgcrypt so better be safe
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+LIBGSASL_CONF_OPTS = --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+LIBGSASL_DEPENDENCIES += libgcrypt
+else
 LIBGSASL_CONF_OPTS = --without-libgcrypt
+endif
 
 ifeq ($(BR2_PACKAGE_LIBIDN),y)
 LIBGSASL_CONF_OPTS += --with-libidn-prefix=$(STAGING_DIR)/usr
