From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Apr 2020 14:37:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/gcr: gobject-introspection needs
 xsltproc
Message-ID: <20200424123715.624655-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build of gcr with gobject-introspection needs host-libxslt otherwise
build will fail on:

  XSLTPROC Gcr-3.gir
/bin/bash: xsltproc: command not found
Makefile:6878: recipe for target 'Gcr-3.gir' failed

Fixes:
 - http://autobuild.buildroot.org/results/c08efff174d4773074e6cf3374228b48e057917b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gcr/gcr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 56bfe1110a..97a0e22064 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -24,7 +24,7 @@ GCR_LICENSE = LGPL-2.1+
 GCR_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GCR_DEPENDENCIES += gobject-introspection
+GCR_DEPENDENCIES += gobject-introspection host-libxslt
 GCR_CONF_OPTS += --with-introspection
 else
 GCR_CONF_OPTS += --without-introspection
-- 
2.25.1
