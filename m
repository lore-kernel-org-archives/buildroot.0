From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Thu, 16 Jun 2016 08:20:38 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-bad: disable autoreconf
Message-ID: <1466058038-15340-1-git-send-email-marcin.nowakowski@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Autoreconf is no longer required in gst1-plugins-bad and it is not
done for any other gst package either. With autoreconf disabled,
gettextize and a gettext makefile patch are no longer required
and can be safely removed.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 .../gst1-plugins-bad/0001-use-gettext-0.18.patch        | 17 -----------------
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  4 ----
 2 files changed, 21 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-use-gettext-0.18.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-use-gettext-0.18.patch b/package/gstreamer1/gst1-plugins-bad/0001-use-gettext-0.18.patch
deleted file mode 100644
index ebf4567..0000000
--- a/package/gstreamer1/gst1-plugins-bad/0001-use-gettext-0.18.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Use newer version of gettext to match current buildroot gettext.
-
-Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
-----
-Index: gst1-plugins-bad-1.1.1/po/Makefile.in.in
-===================================================================
---- gst1-plugins-bad-1.1.1.orig/po/Makefile.in.in
-+++ gst1-plugins-bad-1.1.1/po/Makefile.in.in
-@@ -9,7 +9,7 @@
- # General Public License and is *not* in the public domain.
- #
- # Origin: gettext-0.17
--GETTEXT_MACRO_VERSION = 0.17
-+GETTEXT_MACRO_VERSION = 0.18
- 
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 0896929..271569e 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -13,10 +13,6 @@ GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
 # enabled.
 GST1_PLUGINS_BAD_LICENSE = LGPLv2+ LGPLv2.1+
 
-GST1_PLUGINS_BAD_AUTORECONF = YES
-GST1_PLUGINS_BAD_AUTORECONF_OPTS = -I $(@D)/common/m4
-GST1_PLUGINS_BAD_GETTEXTIZE = YES
-
 GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples \
 	--disable-valgrind \
-- 
2.8.2
