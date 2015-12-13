From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 10:53:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/xmlstarlet: Fix static build
Message-ID: <1450000426-2564-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If libxml2 depends on xz (liblzma) static linking is broken.

Fixes
http://autobuild.buildroot.net/results/df3/df3f5fa770833c8c4344ee0bc67f45aa578ce542/
http://autobuild.buildroot.net/results/070/07021c8bd6e2031c2717fc58e2d3ff30c412fa90/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xmlstarlet/xmlstarlet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 992bb8f..e0abf04 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -21,6 +21,7 @@ XMLSTARLET_CONF_OPTS += \
 
 ifeq ($(BR2_STATIC_LIBS),y)
 XMLSTARLET_CONF_OPTS += --enable-static-libs
+XMLSTARLET_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libxml-2.0`"
 else
 XMLSTARLET_CONF_OPTS += --disable-static-libs
 endif
-- 
2.6.2
