From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 18:44:17 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gstreamer1: fix build
 with NLS
Message-ID: <20190720164234.AC437829FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99f91d7020c5b6ee79c73a517c2c46e0c317103f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/6d3be9feb301495b079eff6283f1cbed9603dc42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index cea933be84..023cf4e85e 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -33,6 +33,9 @@ GSTREAMER1_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2 \
 	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
-	$(if $(BR2_PACKAGE_VALGRIND),valgrind)
+	$(if $(BR2_PACKAGE_VALGRIND),valgrind) \
+	$(TARGET_NLS_DEPENDENCIES)
+
+GSTREAMER1_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
