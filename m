From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sat, 24 Nov 2018 17:54:34 +0100
Subject: [Buildroot] [PATCH v2] package/libtool: Reduce target package to
 libltdl only
Message-ID: <20181124165434.31651-1-alexander.sverdlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will save 1700K on target filesystem (as tested on ARM, i686).

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- rework target libtool instead of new package/libltdl

 package/libtool/libtool.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index bf97ee12b5..b25e058bf4 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -7,12 +7,22 @@
 LIBTOOL_VERSION = 2.4.6
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
+
+LIBTOOL_SUBDIR = libltdl
+HOST_LIBTOOL_SUBDIR = .
+
 LIBTOOL_INSTALL_STAGING = YES
-LIBTOOL_CONF_ENV = HELP2MAN=true
+
+LIBTOOL_CONF_OPTS = --enable-ltdl-install
+HOST_LIBTOOL_CONF_OPTS =
+
 LIBTOOL_DEPENDENCIES = host-m4
 HOST_LIBTOOL_DEPENDENCIES = host-m4
-LIBTOOL_LICENSE = GPL-2.0+
-LIBTOOL_LICENSE_FILES = COPYING
+
+LIBTOOL_LICENSE = LGPLv2.1
+LIBTOOL_LICENSE_FILES = $(LIBTOOL_SUBDIR)/COPYING.LIB
+HOST_LIBTOOL_LICENSE = GPL-2.0+
+HOST_LIBTOOL_LICENSE_FILES = COPYING
 
 HOST_LIBTOOL_CONF_ENV = MAKEINFO=true
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
-- 
2.19.1
