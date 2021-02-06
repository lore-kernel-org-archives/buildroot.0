From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Feb 2021 18:50:21 +0100
Subject: [Buildroot] [git commit] package/htop: add lm-sensors optional
 dependency
Message-ID: <20210206173101.CFD598189C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=811846df48745d58d96f6c0fbab0dec5f17d614b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lm-sensors is an optional dependency (enabled by default) since version
3.0.3 and
https://github.com/htop-dev/htop/commit/1b225cd7a0af03a6349c48326118a287fc36acd0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
