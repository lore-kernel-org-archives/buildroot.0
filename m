From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Jul 2015 21:54:56 +0200
Subject: [Buildroot] [PATCH 4/4] package/libdrm: bump version to 2.4.62
In-Reply-To: <1435780496-31814-1-git-send-email-bernd.kuhls@t-online.de>
References: <1435780496-31814-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1435780496-31814-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added support for newly added optional valgrind support:
http://cgit.freedesktop.org/mesa/drm/commit/?id=47a2de27a0f087908e3063fdd6dfdececd2db75b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash |    4 ++--
 package/libdrm/libdrm.mk   |    9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 99889ea..05944c5 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/dri-devel/2015-May/082348.html
-sha256	8b549092c8961a393a7e1d9a1bccddcea8e2af67c0d7d7c67babb9fc3b47699c	libdrm-2.4.61.tar.bz2
+# From http://lists.freedesktop.org/archives/dri-devel/2015-June/085375.html
+sha256	906c294bdbe1c94c3ca084305d61a6e5a8367f3b4986e6cc13b1e9b3f75931dc	libdrm-2.4.62.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 3c3de1d..4cca645 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.61
+LIBDRM_VERSION = 2.4.62
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
@@ -69,6 +69,13 @@ else
 LIBDRM_CONF_OPTS += --disable-udev
 endif
 
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+LIBDRM_CONF_OPTS += --enable-valgrind
+LIBDRM_DEPENDENCIES += valgrind
+else
+LIBDRM_CONF_OPTS += --disable-valgrind
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
 LIBDRM_CONF_OPTS += --enable-install-test-programs
 endif
-- 
1.7.10.4
