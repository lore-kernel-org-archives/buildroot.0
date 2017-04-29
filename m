From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 13:56:42 +0200
Subject: [Buildroot] [git commit] x11r7: xdriver_xf86-input-tslib: new
	upstream location
Message-ID: <20170429115734.1050A8267B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ae6acd3c11c991cefa208d5005ee613c8408721
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This switches upstream to the Github project where xf86-input-tslib is
currently maintained - in cooperation with Pengutronix, who had hosted
the tarball release up until now.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
[Thomas: fix XDRIVER_XF86_INPUT_TSLIB_SITE value.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-input-tslib/Config.in                   | 2 +-
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
index 9c6e296..08d790c 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	help
 	  Touch screen library input driver
 
-	  http://www.ptxdist.org/software/xf86-input-tslib/index_en.html
+	  https://github.com/merge/xf86-input-tslib
 
 comment "xf86-input-tslib needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index cd8c10a..f8281d7 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -6,7 +6,7 @@
 
 XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.6
 XDRIVER_XF86_INPUT_TSLIB_SOURCE = xf86-input-tslib-$(XDRIVER_XF86_INPUT_TSLIB_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_TSLIB_SITE = http://www.pengutronix.de/software/xf86-input-tslib/download
+XDRIVER_XF86_INPUT_TSLIB_SITE = https://github.com/merge/xf86-input-tslib/releases/download/$(XDRIVER_XF86_INPUT_TSLIB_VERSION)
 XDRIVER_XF86_INPUT_TSLIB_LICENSE = MIT
 XDRIVER_XF86_INPUT_TSLIB_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = \
