From: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
Date: Mon, 15 Jul 2019 13:18:01 -0400
Subject: [Buildroot] [PATCH] package/json-glib: set -Dintrospection=false
Message-ID: <20190715171801.409911-1-alex_y_xu@yahoo.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

when it is true, the meson script auto-detects the host g-ir-scanner,
which is not usable in a cross-compile environment.

Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
---
 package/json-glib/json-glib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 0879c772b5..7405b28b2e 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -17,6 +17,8 @@ JSON_GLIB_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2
 
+JSON_GLIB_CONF_OPTS = -Dintrospection=false
+
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
-- 
2.22.0
