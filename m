From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 07:43:32 +0200
Subject: [Buildroot] [git commit] package/gcr: gobject-introspection needs
 xsltproc
Message-ID: <20200428052848.AD58490A10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a905ccf8c09710b846c87695a44297f02e8d5e4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build of gcr with gobject-introspection needs host-libxslt otherwise
build will fail on:

  XSLTPROC Gcr-3.gir
/bin/bash: xsltproc: command not found
Makefile:6878: recipe for target 'Gcr-3.gir' failed

Fixes:
 - http://autobuild.buildroot.org/results/c08efff174d4773074e6cf3374228b48e057917b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
