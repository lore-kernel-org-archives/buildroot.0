From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 19:41:58 +0200
Subject: [Buildroot] [PATCH 3/4] package/python-pillow: add webpmux support
In-Reply-To: <20210522174159.278657-1-fontaine.fabrice@gmail.com>
References: <20210522174159.278657-1-fontaine.fabrice@gmail.com>
Message-ID: <20210522174159.278657-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

webpmux is an optional dependency since version 2.2.0 and
https://github.com/python-pillow/Pillow/commit/b4735f7829bb88c99071cd91b208aa6ffd2cba24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pillow/python-pillow.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index ab52f38df1..61f386df07 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -63,6 +63,12 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-webp
 endif
 
+ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
+PYTHON_PILLOW_BUILD_OPTS += --enable-webpmux
+else
+PYTHON_PILLOW_BUILD_OPTS += --disable-webpmux
+endif
+
 define PYTHON_PILLOW_BUILD_CMDS
 	cd $(PYTHON_PILLOW_BUILDDIR); \
 		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-- 
2.30.2
