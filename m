From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:36 +0200
Subject: [Buildroot] [PATCH 25/83 v2] package/gstreamer1: include plugins
	from gstreamer1's real Config.in
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <7b0b263b5aaa8be42984430af874500a7b307493.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is more logical to have a single if-clause, rather than repeat it in
another file, possiblty brealking indentation like it previously was.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer1/Config.in            | 11 -----------
 package/gstreamer1/gstreamer1/Config.in |  9 +++++++++
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index ea35ecc..ca3240f 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -1,13 +1,2 @@
 # Gstreamer 1.x & Plugins
 source "package/gstreamer1/gstreamer1/Config.in"
-
-if BR2_PACKAGE_GSTREAMER1
-source "package/gstreamer1/gst1-plugins-base/Config.in"
-source "package/gstreamer1/gst1-plugins-good/Config.in"
-source "package/gstreamer1/gst1-plugins-bad/Config.in"
-source "package/gstreamer1/gst1-plugins-ugly/Config.in"
-source "package/gstreamer1/gst1-imx/Config.in"
-source "package/gstreamer1/gst1-libav/Config.in"
-source "package/gstreamer1/gst1-validate/Config.in"
-source "package/gstreamer1/gst-omx/Config.in"
-endif
diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index 274171b..99aadb4 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -52,4 +52,13 @@ config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
 	  Install the gst-launch and gst-inspect tools. This will take up
 	  additional space on the target.
 
+source "package/gstreamer1/gst1-plugins-base/Config.in"
+source "package/gstreamer1/gst1-plugins-good/Config.in"
+source "package/gstreamer1/gst1-plugins-bad/Config.in"
+source "package/gstreamer1/gst1-plugins-ugly/Config.in"
+source "package/gstreamer1/gst1-imx/Config.in"
+source "package/gstreamer1/gst1-libav/Config.in"
+source "package/gstreamer1/gst1-validate/Config.in"
+source "package/gstreamer1/gst-omx/Config.in"
+
 endif
-- 
2.7.4
