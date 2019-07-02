From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Jul 2019 08:11:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/json-glib: fix NLS build
Message-ID: <20190702061113.24985-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/a9515ce8acb2d13532d0d43f8f61fa890a4705b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/json-glib/json-glib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 77c0c45323..2d4adb2adb 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -12,6 +12,8 @@ JSON_GLIB_LICENSE = LGPL-2.1+
 JSON_GLIB_LICENSE_FILES = COPYING
 JSON_GLIB_INSTALL_STAGING = YES
 
+JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
 JSON_GLIB_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf \
-- 
2.20.1
