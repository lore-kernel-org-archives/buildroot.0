From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  3 Apr 2017 10:14:41 +0200
Subject: [Buildroot] [PATCH] libsoc: add host-pkgconf dependency
Message-ID: <1491207281-29813-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Without pkg-config PKG_CHECK_MODULES won't be expanded
and ./configure script produces following error message:

./configure: line 12237: syntax error near unexpected token `PYTHON,'
./configure: line 12237: `	PKG_CHECK_MODULES(PYTHON, python-"$PYTHON_VERSION")'

Fixes:

http://autobuild.buildroot.net/results/86e/86e04bd2b10527130306451e56a7693ed4b4befd

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libsoc/libsoc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 03bef04..9bc2a9b 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -10,6 +10,7 @@ LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = LICENCE
 LIBSOC_AUTORECONF = YES
 LIBSOC_INSTALL_STAGING = YES
+LIBSOC_DEPENDENCIES = host-pkgconf
 
 # Install Python 2 bindings
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-- 
2.1.4
