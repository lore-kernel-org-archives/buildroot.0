From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  7 Feb 2020 15:50:17 +0100
Subject: [Buildroot] [PATCH 02/10] package/gupnp-dlna: drop gstreamer 0.10.x
 support
In-Reply-To: <20200207145026.28384-1-peter@korsgaard.com>
References: <20200207145026.28384-1-peter@korsgaard.com>
Message-ID: <20200207145026.28384-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the upcoming removal of gstreamer 0.10, the logic for building
gupnp-dlna with support for it must go as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gupnp-dlna/gupnp-dlna.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 304f86a55c..6f9ff8a58c 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -15,12 +15,7 @@ GUPNP_DLNA_LICENSE_FILES = COPYING
 GUPNP_DLNA_INSTALL_STAGING = YES
 GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
-GUPNP_DLNA_CONF_OPTS += --enable-legacy-gstreamer-metadata-backend
-GUPNP_DLNA_DEPENDENCIES += gstreamer gst-plugins-base
-else
-GUPNP_DLNA_CONF_OPTS += --disable-legacy-gstreamer-metadata-backend
-endif
+GUPNP_DLNA_CONF_OPTS = --disable-legacy-gstreamer-metadata-backend
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
-- 
2.20.1
