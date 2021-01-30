From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 18:14:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/htop: add lm-sensors optional
 dependency
Message-ID: <20210130171455.2735295-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lm-sensors is an optional dependency (enabled by default) since version
3.0.3 and
https://github.com/htop-dev/htop/commit/1b225cd7a0af03a6349c48326118a287fc36acd0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/htop/htop.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 15a56485c8..aa2ff24750 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -12,6 +12,13 @@ HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONF
 HTOP_LICENSE = GPL-2.0
 HTOP_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
+HTOP_CONF_OPTS += --with-sensors
+HTOP_DEPENDENCIES += lm-sensors
+else
+HTOP_CONF_OPTS += --without-sensors
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 HTOP_CONF_OPTS += --enable-unicode
 else
-- 
2.29.2
