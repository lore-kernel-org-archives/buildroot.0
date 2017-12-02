From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat,  2 Dec 2017 08:58:49 +0100
Subject: [Buildroot] [PATCH] libostree: disable manpages/documentation
 generation
Message-ID: <20171202075849.4439-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--enable-man is set to `auto` as default, which may break builds.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index bac44ddbdb..19a00a25f7 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -12,7 +12,12 @@ LIBOSTREE_LICENSE = GPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
 LIBOSTREE_DEPENDENCIES = e2fsprogs host-pkgconf libfuse libglib2 libgpgme xz
 
-LIBOSTREE_CONF_OPTS += --with-gpgme-prefix=$(STAGING_DIR)/usr
+LIBOSTREE_CONF_OPTS += \
+	--with-gpgme-prefix=$(STAGING_DIR)/usr \
+	--disable-gtk-doc \
+	--disable-gtk-doc-html \
+	--disable-gtk-doc-pdf \
+	--disable-man
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBOSTREE_CONF_OPTS += --with-openssl
-- 
2.15.0
