From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:35:24 +0200
Subject: [Buildroot] [git commit] package/gcr: enable gobject-introspection
 support
Message-ID: <20200406202227.6172481D3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4e7c720aa78dbe659db82f4eb38ff58ebae4c57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --with-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gcr/gcr.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 2fe583978c..56bfe1110a 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -23,6 +23,13 @@ GCR_CONF_OPTS = \
 GCR_LICENSE = LGPL-2.1+
 GCR_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GCR_DEPENDENCIES += gobject-introspection
+GCR_CONF_OPTS += --with-introspection
+else
+GCR_CONF_OPTS += --without-introspection
+endif
+
 # Only the X11 backend is supported for the simple GUI
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 GCR_DEPENDENCIES += libgtk3
