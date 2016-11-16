From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 22:11:49 +0100
Subject: [Buildroot] [git commit branch/next] xmlstarlet: use $() to
	reference make variables instead of ${}
Message-ID: <20161116211213.EE1BF81DD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36305380db1312442623128689fe5067d9058381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xmlstarlet/xmlstarlet.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 7039d77..98efd07 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -15,9 +15,9 @@ XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 XMLSTARLET_CONF_OPTS += \
-	--with-libxml-prefix=${STAGING_DIR}/usr \
-	--with-libxslt-prefix=${STAGING_DIR}/usr \
-	--with-libiconv-prefix=${STAGING_DIR}/usr
+	--with-libxml-prefix=$(STAGING_DIR)/usr \
+	--with-libxslt-prefix=$(STAGING_DIR)/usr \
+	--with-libiconv-prefix=$(STAGING_DIR)/usr
 
 ifeq ($(BR2_STATIC_LIBS),y)
 XMLSTARLET_CONF_OPTS += --enable-static-libs
