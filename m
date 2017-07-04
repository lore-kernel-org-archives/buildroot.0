From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:37:15 +0200
Subject: [Buildroot] [git commit] xmlstarlet: remove libintl static linking
	handling
Message-ID: <20170704233520.AEBB98013D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38d29739a4413cf63042b8ce1f311e2bc35a0f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
