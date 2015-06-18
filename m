From: nimaim at gmail.com <nimaim@gmail.com>
Date: Thu, 18 Jun 2015 12:24:15 -0400
Subject: [Buildroot] [PATCH 1/1] Modified libarchive.mk to enable support
	for xz/lzma
Message-ID: <5582f0b5.a25c8c0a.014c.ffff8c3b@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nimai <nimai@nimai-vm.com>

Signed-off-by: Nimai <nimai@nimai-vm.com>
---
 package/libarchive/libarchive.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 61528d9..18fa8b7 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -9,7 +9,6 @@ LIBARCHIVE_SITE = http://www.libarchive.org/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2c, BSD-3c
 LIBARCHIVE_LICENSE_FILES = COPYING
-LIBARCHIVE_CONF_OPTS = --without-lzma
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -86,4 +85,10 @@ else
 LIBARCHIVE_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+LIBARCHIVE_DEPENDENCIES += xz
+else
+LIBARCHIVE_CONF_OPTS += --without-lzma
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
