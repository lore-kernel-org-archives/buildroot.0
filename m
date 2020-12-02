From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 Dec 2020 22:18:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/bind: drop unrecognized option
Message-ID: <20201202211848.56609-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop --enable-newstats option which is not recognized

Unrecognized options:
    --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --disable-nls, --enable-newstats

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 18fc4845f9..d937246fd0 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -47,7 +47,7 @@ BIND_CONF_OPTS += --disable-linux-caps
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr --enable-newstats
+BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr
 BIND_DEPENDENCIES += libxml2
 else
 BIND_CONF_OPTS += --with-libxml2=no
-- 
2.29.2
