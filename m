From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 24 Jun 2016 14:35:10 +0200
Subject: [Buildroot] [PATCH] libsoc: add Python bindings support
Message-ID: <1466771710-24749-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libsoc/libsoc.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 878616b..b6200dc 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -11,4 +11,16 @@ LIBSOC_LICENSE_FILES = LICENCE
 LIBSOC_AUTORECONF = YES
 LIBSOC_INSTALL_STAGING = YES
 
+# Install Python 2 bindings
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+LIBSOC_DEPENDENCIES += python
+LIBSOC_CONF_OPTS += --enable-python=2
+endif
+
+# Install Python 3 bindings
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBSOC_DEPENDENCIES += python3
+LIBSOC_CONF_OPTS += --enable-python=3
+endif
+
 $(eval $(autotools-package))
-- 
2.1.4
