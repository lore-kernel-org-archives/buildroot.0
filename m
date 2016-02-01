From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 08:17:01 +0100
Subject: [Buildroot] [git commit] package/gstreamer/gst-plugins-ugly: Fix
	cdio-related build errors
Message-ID: <20160201224700.4CE1B7F918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37b45dbcc710beec678ab1453c92d77d5cf70ad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/530/53003be0dc2cb76d497a167023c5c45666fd00b4/
http://autobuild.buildroot.net/results/b23/b2393cd50c20da919d6111e15b78d12cc784841f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash | 3 +++
 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
index ffa0c98..56f2a8c 100644
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
+++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
@@ -1,2 +1,5 @@
 # From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-0.10.19.tar.xz.md5
 md5	ba26045c8c8c91f0d48d327ccf53ac0c	gst-plugins-ugly-0.10.19.tar.xz
+# Locally computed
+sha256	4934f65ff892637e7efaf1cfe635779189dde429d0706f40c86a3aac476ea873	gst-plugins-ugly-0.10.19.tar.xz
+sha256	2a8aa4cd019fab333f1f8377bf7afa426d3038a033361d90fab70c335e9a53e7	cdio-cd-text-api.patch
diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
index b921dc1..0f56164 100644
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -7,6 +7,7 @@
 GST_PLUGINS_UGLY_VERSION = 0.10.19
 GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
+GST_PLUGINS_UGLY_PATCH = http://git.alpinelinux.org/cgit/aports/plain/main/gst-plugins-ugly0.10/cdio-cd-text-api.patch
 # COPYING is in fact LGPLv2.1, but all of the code is v2+
 # (except for one test, xingmux)
 GST_PLUGINS_UGLY_LICENSE = LGPLv2+, GPLv2+ (synaesthesia)
