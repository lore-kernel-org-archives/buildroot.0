From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 11:48:46 +0200
Subject: [Buildroot] [git commit] libgpiod: bump version to v0.3.1
Message-ID: <20170913094504.2FA1B8108A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7414a026432f4a86c0bd0ce4d6af082620f385c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There aren't really any changes that matter for the buildroot image,
but the project has been moved over to kernel.org and is now available
in a release tarball, so simplify the .mk file by removing any
autoreconf stuff.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpiod/libgpiod.hash |  4 ++--
 package/libgpiod/libgpiod.mk   | 14 +++-----------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index aeeabf6..28a0479 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256 24794006c14194e269b944f2cca0e85e481f1538be3c143479c4c6691bf25add libgpiod-v0.3.tar.gz
+# From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
+sha256 6dfd6aeb544e8b7baf484a05c9ae0e67022c109362a41d87005393046b6beacf  libgpiod-0.3.1.tar.xz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 559e3d1..7c2424b 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,23 +4,15 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = v0.3
-LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
+LIBGPIOD_VERSION = 0.3.1
+LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
+LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
 LIBGPIOD_LICENSE_FILES = COPYING
 LIBGPIOD_INSTALL_STAGING = YES
 
 LIBGPIOD_DEPENDENCIES = host-pkgconf
 
-# Needed for autoreconf to work properly
-define LIBGPIOD_FIXUP_M4_DIR
-        mkdir $(@D)/m4
-endef
-LIBGPIOD_POST_EXTRACT_HOOKS += LIBGPIOD_FIXUP_M4_DIR
-
-# fetched from github, no configure script provided
-LIBGPIOD_AUTORECONF = YES
-
 ifeq ($(BR2_PACKAGE_LIBGPIOD_TOOLS),y)
 LIBGPIOD_CONF_OPTS += --enable-tools
 else
