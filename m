From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Oct 2020 12:17:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-devtools: install
 to staging
Message-ID: <20201017101703.3044360-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix the following build failure with
gstreamer1-editing-services which optionally depends on gst1-devtools
since commit 08a213c1a532de783a7cedaa29088ffb736827bd:

Run-time dependency gst-validate-1.0 found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency gst-validate-1.0

../output-1/build/gstreamer1-editing-services-1.18.0/meson.build:101:0: ERROR: Subproject directory not found and gst-devtools.wrap file not found

Fixes:
 - http://autobuild.buildroot.org/results/e9d96a63861737d82734559db5e5ffbf5996ffde

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 23b4d5ab8f..c88d4c0378 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -9,6 +9,7 @@ GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
 GST1_DEVTOOLS_LICENSE_FILES = validate/COPYING
+GST1_DEVTOOLS_INSTALL_STAGING = YES
 
 GST1_DEVTOOLS_DEPENDENCIES = \
 	gstreamer1 \
-- 
2.28.0
