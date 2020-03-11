From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 11 Mar 2020 20:34:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/gupnp: disable introspection
Message-ID: <20200311193410.69589-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build fails if gobject-introspection is built before gupnp:

 GISCAN   GUPnP-1.0.gir
Couldn't find include 'GSSDP-1.0.gir' (search path: '['/nvmedata/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '..', '/nvmedata/autobuild/instance-0/output-1/host/share', 'gir-1.0', '/nvmedata/autobuild/instance-0/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')

Fixes:
 - http://autobuild.buildroot.org/results/ea91dab1d9a59c1aefa481c316115558a6f6e8f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp/gupnp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 29305f0b4b..27486b09fa 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -12,5 +12,6 @@ GUPNP_LICENSE = LGPL-2.0+
 GUPNP_LICENSE_FILES = COPYING
 GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
+GUPNP_CONF_OPTS = --disable-introspection
 
 $(eval $(autotools-package))
-- 
2.25.1
