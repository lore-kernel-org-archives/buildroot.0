From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Aug 2019 23:01:19 +0200
Subject: [Buildroot] [git commit] package/gupnp: bump to version 1.0.4
Message-ID: <20190802205946.74F2C8D1F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66a3fbb9f6c79e48eaf9e561a4143063e7e9d670
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package
- Disable introspection (enabled by default)
- Disable examples (enabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index ba73aa1041..c530eb7ef5 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.0/gupnp-1.0.3.sha256sum:
-sha256	794b162ee566d85eded8c3f3e8c9c99f6b718a6b812d8b56f0c2ed72ac37cbbb  	gupnp-1.0.3.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.0/gupnp-1.0.4.sha256sum:
+sha256	8b0992650c6ef8566d2d0c9198c8a669106dc2c73aa908fcc4a4d043a8c0b544	gupnp-1.0.4.tar.xz
 
 # Hash for license file:
 sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 3c014ccc99..02670ac91b 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,12 +5,15 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 1.0
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).3
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).4
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.0+
 GUPNP_LICENSE_FILES = COPYING
 GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
+GUPNP_CONF_OPTS = \
+	-Dexamples=false \
+	-Dintrospection=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
