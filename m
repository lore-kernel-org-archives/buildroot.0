From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jun 2017 08:24:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbluray: bump version to 1.0.1
Message-ID: <20170617062415.13797-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed configure options --enable-udf --disable-bdjava, they were
removed upstream:

http://git.videolan.org/?p=libbluray.git;a=commitdiff;h=dec9a6bcf17e8ca34b3b2e3eab632a6e03832e8c
http://git.videolan.org/?p=libbluray.git;a=commitdiff;h=415da3663a1ff2a935d4a36417f4f46bf2b947d2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index f3e12108bf..1cb9d8d3c8 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,2 +1,2 @@
-# From http://get.videolan.org/libbluray/1.0.0/libbluray-1.0.0.tar.bz2.sha512
-sha512 fcf2193c3b76f3436bc88ce8853cac16f29c3bb6c66447109c14202a41ea938cb6814502a8f724fb1b31add6bd36b42d3aed3eb4a8010c123537e073bd7a0be1  libbluray-1.0.0.tar.bz2
+# From http://get.videolan.org/libbluray/1.0.1/libbluray-1.0.1.tar.bz2.sha512
+sha512 798d38cc95af87599af5838e5c288f2536a73b33191db8ff3774cf7eb5b835006bea83693f016d47dff551001b98527d8b1f14051f673fb3b28073b820e325d7  libbluray-1.0.1.tar.bz2
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 82682814ed..d3eee5d0ce 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.0.0
+LIBBLURAY_VERSION = 1.0.1
 LIBBLURAY_SITE = http://get.videolan.org/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
@@ -12,8 +12,6 @@ LIBBLURAY_LICENSE = LGPL-2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
 LIBBLURAY_DEPENDENCIES = host-pkgconf
 
-LIBBLURAY_CONF_OPTS = --enable-udf --disable-bdjava
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
-- 
2.11.0
