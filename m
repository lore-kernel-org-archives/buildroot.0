From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 20:20:13 +0200
Subject: [Buildroot] [PATCH] packages/*.mk: Remove duplicate options
Message-ID: <1413656413-22546-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These flags are already defined in pkg-autotools.mk.
There is no need to have them twice.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/audiofile/audiofile.mk           | 2 +-
 package/libexif/libexif.mk               | 1 -
 package/memcached/memcached.mk           | 2 +-
 package/opus/opus.mk                     | 3 +--
 package/x11r7/xlib_libXaw/xlib_libXaw.mk | 1 -
 5 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index ac05e6c..c685ce1 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -8,7 +8,7 @@ AUDIOFILE_VERSION = 0.3.6
 AUDIOFILE_SITE = http://audiofile.68k.org
 AUDIOFILE_INSTALL_STAGING = YES
 AUDIOFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-AUDIOFILE_CONF_OPTS = --disable-examples --disable-docs
+AUDIOFILE_CONF_OPTS = --disable-examples
 AUDIOFILE_DEPENDENCIES = host-pkgconf
 # configure is outdated and has old bugs because of it
 AUDIOFILE_AUTORECONF = YES
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 616f953..a71c117 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -8,7 +8,6 @@ LIBEXIF_VERSION = 0.6.21
 LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
 LIBEXIF_SITE = http://downloads.sourceforge.net/project/libexif/libexif/$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
-LIBEXIF_CONF_OPTS = --disable-docs
 LIBEXIF_DEPENDENCIES = host-pkgconf
 LIBEXIF_LICENSE = LGPLv2.1+
 LIBEXIF_LICENSE_FILES = COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 0d88985..4efe093 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -8,7 +8,7 @@ MEMCACHED_VERSION = 1.4.20
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-MEMCACHED_CONF_OPTS = --disable-coverage --disable-docs
+MEMCACHED_CONF_OPTS = --disable-coverage
 MEMCACHED_LICENSE = BSD-3c
 MEMCACHED_LICENSE_FILES = COPYING
 
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 04ffa57..c8ba5c6 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -9,11 +9,10 @@ OPUS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3c
 OPUS_LICENSE_FILES = COPYING
 OPUS_INSTALL_STAGING = YES
-OPUS_CONF_OPTS = --disable-doc
 OPUS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
-OPUS_CONF_OPTS += --enable-fixed-point
+OPUS_CONF_OPTS = --enable-fixed-point
 endif
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index cf6ec2b..ac8684e 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -11,6 +11,5 @@ XLIB_LIBXAW_LICENSE = MIT
 XLIB_LIBXAW_LICENSE_FILES = COPYING
 XLIB_LIBXAW_INSTALL_STAGING = YES
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto
-XLIB_LIBXAW_CONF_OPTS = --disable-docs
 
 $(eval $(autotools-package))
-- 
2.1.1
