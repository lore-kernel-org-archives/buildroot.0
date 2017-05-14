From: Martin Kepplinger <martink@posteo.de>
Date: Sun, 14 May 2017 09:50:26 +0200
Subject: [Buildroot] [PATCH] x11r7: xf86-input-tslib: upgrade to 1.0.0
Message-ID: <20170514075026.13434-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the update from 0.0.X to 1.0.0 suggests, this is a major update. The driver
uses X11's touch API now, instead of motion with button emulation. Furthermore
it supports multitouch when a recent version of tslib is installed.

It is not backwards compatible for very old versions of the X server. See
https://github.com/merge/xf86-input-tslib/releases for some details.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash | 4 ++--
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
index b8eb2b86c..23d7a6142 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/merge/xf86-input-tslib/releases/download/0.0.7/xf86-input-tslib-0.0.7.tar.bz2.sha256
-sha256 6f23cc9702b0ae16086d364b275335c094efbf6acde57f8a030e4db5b9aece03  xf86-input-tslib-0.0.7.tar.bz2
+# https://github.com/merge/xf86-input-tslib/releases/download/1.0.0/xf86-input-tslib-1.0.0.tar.bz2.sha256
+sha256 2e888893b766bb987ed4d788555dc221e3974068580ba782753a4a80532a42e7  xf86-input-tslib-1.0.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index 2e7863407..d2d9df47a 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.7
+XDRIVER_XF86_INPUT_TSLIB_VERSION = 1.0.0
 XDRIVER_XF86_INPUT_TSLIB_SOURCE = xf86-input-tslib-$(XDRIVER_XF86_INPUT_TSLIB_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_TSLIB_SITE = https://github.com/merge/xf86-input-tslib/releases/download/$(XDRIVER_XF86_INPUT_TSLIB_VERSION)
 XDRIVER_XF86_INPUT_TSLIB_LICENSE = MIT
-- 
2.11.0
