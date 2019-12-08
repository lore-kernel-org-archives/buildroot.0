From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Dec 2019 15:10:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: drop autoreconf
Message-ID: <20191208141051.1640026-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As spotted by Thomas during review of
https://patchwork.ozlabs.org/patch/1205441, autoreconf is no longer
necessary as alsa.m4 is no longer patched since commit
e8cb594bc8ce07e22e247972a417d53fd56e10fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/alsa-utils/alsa-utils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 52022e32ab..b4f85e1e65 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -14,10 +14,6 @@ ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(TARGET_NLS_DEPENDENCIES)
-# Regenerate aclocal.m4 to pick the patched
-# version of alsa.m4 from alsa-lib
-ALSA_UTILS_AUTORECONF = YES
-ALSA_UTILS_GETTEXTIZE = YES
 
 ALSA_UTILS_CONF_ENV = \
 	ac_cv_prog_ncurses5_config=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS) \
-- 
2.24.0
