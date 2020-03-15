From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 15:48:29 +0100
Subject: [Buildroot] [git commit] package/gupnp: disable introspection
Message-ID: <20200315143547.1DB2382832@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd833f596c1d12be0a49ffcb2d2f35ee1bf27009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build fails if gobject-introspection is built before gupnp:

 GISCAN   GUPnP-1.0.gir
Couldn't find include 'GSSDP-1.0.gir' (search path: '['/nvmedata/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '..', '/nvmedata/autobuild/instance-0/output-1/host/share', 'gir-1.0', '/nvmedata/autobuild/instance-0/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')

Fixes:
 - http://autobuild.buildroot.org/results/ea91dab1d9a59c1aefa481c316115558a6f6e8f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
