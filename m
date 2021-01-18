From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:58:22 +0100
Subject: [Buildroot] [git commit] package/poppler: add gobject-introspection
 support
Message-ID: <20210118213920.340D282586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d1d4818c39d97ad7a1cdf6e075b9acae6dfff71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/poppler/poppler.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 69a3bcace5..8e8dafc715 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -17,7 +17,6 @@ POPPLER_CONF_OPTS = \
 	-DBUILD_GTK_TESTS=OFF \
 	-DBUILD_QT5_TESTS=OFF \
 	-DBUILD_CPP_TESTS=OFF \
-	-DENABLE_GOBJECT_INTROSPECTION=OFF \
 	-DENABLE_GTK_DOC=OFF
 
 # cmake older than 3.10 requires this to avoid try_run() in FindThreads
@@ -34,6 +33,13 @@ else
 POPPLER_CONF_OPTS += -DENABLE_DCTDECODER=none -DWITH_JPEG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+POPPLER_DEPENDENCIES += gobject-introspection
+POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=ON
+else
+POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 POPPLER_DEPENDENCIES += libpng
 POPPLER_CONF_OPTS += -DWITH_PNG=ON
