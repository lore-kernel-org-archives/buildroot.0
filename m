From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Mar 2020 16:02:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/gupnp-dlna: disable introspection
Message-ID: <20200315150257.2807446-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build will fail if gobject-introspection is built before gupnp-dlna:
  GISCAN   GUPnPDLNAGst-2.0.gir
Couldn't find include 'Gst-1.0.gir' (search path: '['/home/buildroot/autobuild/run/instance-1/output-1/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '.', '/home/buildroot/autobuild/run/instance-1/output-1/host/share', 'gir-1.0', '/home/buildroot/autobuild/run/instance-1/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')

Fixes:
 - http://autobuild.buildroot.org/results/829a84b37db7d9141785bfe2eec2dd0e6d3310f1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp-dlna/gupnp-dlna.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 6f9ff8a58c..85d30b7cd2 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -15,7 +15,9 @@ GUPNP_DLNA_LICENSE_FILES = COPYING
 GUPNP_DLNA_INSTALL_STAGING = YES
 GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
 
-GUPNP_DLNA_CONF_OPTS = --disable-legacy-gstreamer-metadata-backend
+GUPNP_DLNA_CONF_OPTS = \
+	--disable-introspection \
+	--disable-legacy-gstreamer-metadata-backend
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
-- 
2.25.1
