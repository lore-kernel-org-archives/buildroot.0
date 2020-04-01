From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:28 -0700
Subject: [Buildroot] [PATCH 06/12] package/gcr: enable gobject-introspection
 support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200401002134.1779241-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --with-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
-- 
2.25.1
