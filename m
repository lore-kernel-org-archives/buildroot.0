From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Jul 2019 20:11:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/gupnp-tools: fix build with NLS
Message-ID: <20190703181156.20472-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp-tools/gupnp-tools.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 8f95e04f98..06c7b1fd3b 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -19,7 +19,10 @@ GUPNP_TOOLS_DEPENDENCIES = \
 	gssdp \
 	gupnp \
 	libsoup \
-	libgtk3
+	libgtk3 \
+	$(TARGET_NLS_DEPENDENCIES)
+
+GUPNP_TOOLS_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_GUPNP_AV),y)
 GUPNP_TOOLS_CONF_OPTS += --with-av
-- 
2.20.1
