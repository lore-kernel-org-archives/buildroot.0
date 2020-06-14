From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 18:02:33 +0200
Subject: [Buildroot] [git commit] package/alsa-utils: bump version to 1.2.3
Message-ID: <20200614160202.75BCD82286@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c18aabf2c80a28459acc779c9207c9ddf552b9c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed _AUTORECONF added with
https://git.buildroot.net/buildroot/commit/?id=e10cf295c900790d96d777cc7ff0aea287afd056
because we do not patch alsa.m4 anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index 3db06ab4c1..aec86aee00 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  44807bd578c5f6df6e91a11b8d37e546424a5a1ea8d8e659ee359fe01730e4f3  alsa-utils-1.2.2.tar.bz2
+sha256  ff19ae48c22938de7a491bdb39db74a2eee2546013f39bf1a86185e426f921aa  alsa-utils-1.2.3.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 7afa36d503..27894d3e92 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.2
+ALSA_UTILS_VERSION = 1.2.3
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
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
