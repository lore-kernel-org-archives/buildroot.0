From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Oct 2020 11:26:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-libav: fix license
Message-ID: <20201017092653.2605549-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 15dc48ca9becafec6ba11b08af18453bc0e40c9e forgot to change
the license which is LGPL-2.1+ since version 1.17.1 and
https://gitlab.freedesktop.org/gstreamer/gst-libav/-/commit/c437e175ad9c82732ac46e36ccc398ad041bf13b

Fixes:
 - http://autobuild.buildroot.org/results/848d7c49a01f719397cb2e8a8f8e3bd73bd03df4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 2 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 9a74465e09..9e4b9b1c27 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
 # From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.0.tar.xz.sha256sum
 sha256  42f93f5ce9a3fc22051e5f783a4574b56ebf213f331f75dcbc3552459bd3a06a  gst-libav-1.18.0.tar.xz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 3fd23b8185..ba296844aa 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -7,7 +7,7 @@
 GST1_LIBAV_VERSION = 1.18.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
-GST1_LIBAV_LICENSE = GPL-2.0+
+GST1_LIBAV_LICENSE = LGPL-2.1+
 GST1_LIBAV_LICENSE_FILES = COPYING
 GST1_LIBAV_DEPENDENCIES =  host-pkgconf ffmpeg gstreamer1 gst1-plugins-base
 GST1_LIBAV_CONF_OPTS = -Ddoc=disabled
-- 
2.28.0
