From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 14:03:56 +0100
Subject: [Buildroot] [git commit] package/libgeotiff: add optional proj
 dependency
Message-ID: <20190204130300.5F1037FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a0cec02fdfb7cecf7b5de15736fe796d8a33421
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgeotiff/libgeotiff.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 522802cc94..a4606bc30c 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -26,4 +26,11 @@ else
 LIBGEOTIFF_CONF_OPTS += --without-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_PROJ),y)
+LIBGEOTIFF_DEPENDENCIES += proj
+LIBGEOTIFF_CONF_OPTS += --with-proj=$(STAGING_DIR)/usr
+else
+LIBGEOTIFF_CONF_OPTS += --without-proj
+endif
+
 $(eval $(autotools-package))
