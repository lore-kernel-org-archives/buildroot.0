From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 14 Nov 2016 12:04:48 +0100
Subject: [Buildroot] [PATCH v2] htop: enable unicode if possible
Message-ID: <20161114110448.9162-1-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/htop/htop.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

v2:
  - explicitily enable unicode
 
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 7409a78..af0f66b 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -7,10 +7,15 @@
 HTOP_VERSION = 2.0.2
 HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-HTOP_CONF_OPTS = --disable-unicode
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/ncurses5-config
 HTOP_LICENSE = GPLv2
 HTOP_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),)
+HTOP_CONF_OPTS = --disable-unicode
+else
+HTOP_CONF_OPTS = --enable-unicode
+endif
+
 $(eval $(autotools-package))
-- 
2.9.3
