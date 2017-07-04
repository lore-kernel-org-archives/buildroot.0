From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:17 +0200
Subject: [Buildroot] [PATCH 097/100] xmlstarlet: remove libintl static
	linking handling
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-98-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Therefore, remove the
special code that was handling this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xmlstarlet/xmlstarlet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 091c371..9920dcf 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -19,7 +19,7 @@ XMLSTARLET_CONF_OPTS += \
 
 ifeq ($(BR2_STATIC_LIBS),y)
 XMLSTARLET_CONF_OPTS += --enable-static-libs
-XMLSTARLET_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libxml-2.0 libexslt` $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
+XMLSTARLET_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libxml-2.0 libexslt`"
 else
 XMLSTARLET_CONF_OPTS += --disable-static-libs
 endif
-- 
2.9.4
