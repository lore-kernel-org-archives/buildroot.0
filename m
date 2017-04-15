From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 15 Apr 2017 08:24:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.80
Message-ID: <20170415062440.11827-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed AUTORECONF, forgotten in 2.4.77 bump:
https://git.buildroot.net/buildroot/commit/package/libdrm?id=137407a7f9a29daf6312a261bd50cf1d6d9622da

Also removed host-xutil_util-macros which was only needed for
autoreconf:
https://git.buildroot.net/buildroot/commit/package/libdrm?id=3284e1e2b4984ac487e04d0d826a49351dc0fc38

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  9 ++-------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index d823ac01f..f322ba147 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-April/138561.html
-md5 84ba6e8e6c97d2684938eb949e6dfdf8  libdrm-2.4.79.tar.bz2
-sha1 0dd194538c90619146a83a65f2074564e1a14d55  libdrm-2.4.79.tar.bz2
-sha256 c6aaf319293bce38023e9a637471b0f45c93c807d2a279060d741fc7a2e5b197  libdrm-2.4.79.tar.bz2
-sha512 62d6dbdf5e4e73e948fcb128a3ee76c88843d0aabf0af5751526829e9b95cff151a121af88ba9625acc7f5bc4ecfa71f9a3762005d5da76cff1d91dfc8ea8ea7  libdrm-2.4.79.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-April/139263.html
+md5 4867866477f228973a64e68051ca9c66  libdrm-2.4.80.tar.bz2
+sha1 eabfc3e04d0737834ccb49fe34fc369f0e0588f9  libdrm-2.4.80.tar.bz2
+sha256 a82a519601e9cdfad795e760807eb07ac8913b225e25fc8fe9bc03e3be6549f1 libdrm-2.4.80.tar.bz2
+sha512 478f64bcc6f4815368ae86d023f11ba6b37595bb9d8baa588b466c6c0e2aae48a50a489137750ed21fbabef5afabf183c78c152eb770bfe316fa7401b191a30b libdrm-2.4.80.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index ea7c7271e..01b1aed76 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,19 +4,14 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.79
+LIBDRM_VERSION = 2.4.80
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-# 0003-tests-etnaviv-link-against-libdrm.patch
-LIBDRM_AUTORECONF = YES
-
 LIBDRM_INSTALL_STAGING = YES
-
 LIBDRM_DEPENDENCIES = \
 	libpthread-stubs \
-	host-pkgconf \
-	host-xutil_util-macros
+	host-pkgconf
 
 LIBDRM_CONF_OPTS = \
 	--disable-cairo-tests \
-- 
2.11.0
