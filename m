From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 16:09:34 +0200
Subject: [Buildroot] [git commit] package/gst1-interpipe: change to meson
 build
Message-ID: <20200920140014.E07ED8B260@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53d2cbba16d68cf59aac9325ee1e7dc50bdda8b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index 92e2bb38fc..9d3402d02b 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -13,9 +13,10 @@ GST1_INTERPIPE_GIT_SUBMODULES = YES
 GST1_INTERPIPE_LICENSE = LGPL-2.1
 GST1_INTERPIPE_LICENSE_FILES = COPYING
 
-# from git source
-GST1_INTERPIPE_AUTORECONF = YES
-
 GST1_INTERPIPE_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
 
-$(eval $(autotools-package))
+GST1_INTERPIPE_CONF_OPTS = \
+	-Dtests=disabled \
+	-Denable-gtk-doc=false
+
+$(eval $(meson-package))
