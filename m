From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed,  9 Nov 2016 10:27:39 +0100
Subject: [Buildroot] [PATCH] htop: enable unicode if possible
Message-ID: <20161109092739.4595-1-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/htop/htop.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 7409a78..e1a658b 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -7,7 +7,9 @@
 HTOP_VERSION = 2.0.2
 HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),)
 HTOP_CONF_OPTS = --disable-unicode
+endif
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/ncurses5-config
 HTOP_LICENSE = GPLv2
-- 
2.9.3
