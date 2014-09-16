From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 16 Sep 2014 14:55:58 +0200
Subject: [Buildroot] [PATCH] celt051: Fix file naming
Message-ID: <1410872158-16648-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to comply with naming policy, fix celt.mk filename.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/celt051/celt.mk    | 30 ------------------------------
 package/celt051/celt051.mk | 30 ++++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 30 deletions(-)
 delete mode 100644 package/celt051/celt.mk
 create mode 100644 package/celt051/celt051.mk

diff --git a/package/celt051/celt.mk b/package/celt051/celt.mk
deleted file mode 100644
index 528dfce..0000000
--- a/package/celt051/celt.mk
+++ /dev/null
@@ -1,30 +0,0 @@
-################################################################################
-#
-# celt
-#
-################################################################################
-
-# Although version newer than 0.5.1.3 exists, we're
-# stuck with 0.5.1.3 for use by Spice (coming later)
-CELT051_VERSION         = 0.5.1.3
-CELT051_SOURCE          = celt-$(CELT051_VERSION).tar.gz
-CELT051_SITE            = http://downloads.xiph.org/releases/celt
-CELT051_LICENSE         = BSD-2c
-CELT051_LICENSE_FILES   = COPYING
-CELT051_INSTALL_STAGING = YES
-CELT051_DEPENDENCIES    = libogg
-
-# Need to specify --with-ogg, otherwise /usr/lib may be searched for
-# if target is the same kind as host (ie. same arch, same bitness,
-# same endianness, so that /usr/lib contains libraries linkable by
-# our cross-compiler)
-CELT051_CONF_OPT =                  \
-  --enable-fixed-point              \
-  --disable-fixed-point-debug       \
-  --disable-experimental-postfilter \
-  --disable-static-modes            \
-  --disable-assertions              \
-  --disable-oggtest                 \
-  --with-ogg=$(STAGING_DIR)/usr     \
-
-$(eval $(autotools-package))
diff --git a/package/celt051/celt051.mk b/package/celt051/celt051.mk
new file mode 100644
index 0000000..528dfce
--- /dev/null
+++ b/package/celt051/celt051.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# celt
+#
+################################################################################
+
+# Although version newer than 0.5.1.3 exists, we're
+# stuck with 0.5.1.3 for use by Spice (coming later)
+CELT051_VERSION         = 0.5.1.3
+CELT051_SOURCE          = celt-$(CELT051_VERSION).tar.gz
+CELT051_SITE            = http://downloads.xiph.org/releases/celt
+CELT051_LICENSE         = BSD-2c
+CELT051_LICENSE_FILES   = COPYING
+CELT051_INSTALL_STAGING = YES
+CELT051_DEPENDENCIES    = libogg
+
+# Need to specify --with-ogg, otherwise /usr/lib may be searched for
+# if target is the same kind as host (ie. same arch, same bitness,
+# same endianness, so that /usr/lib contains libraries linkable by
+# our cross-compiler)
+CELT051_CONF_OPT =                  \
+  --enable-fixed-point              \
+  --disable-fixed-point-debug       \
+  --disable-experimental-postfilter \
+  --disable-static-modes            \
+  --disable-assertions              \
+  --disable-oggtest                 \
+  --with-ogg=$(STAGING_DIR)/usr     \
+
+$(eval $(autotools-package))
-- 
2.1.0
