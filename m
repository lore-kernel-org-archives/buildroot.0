From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 26 Oct 2018 20:36:32 +0200
Subject: [Buildroot] [PATCH 1/1] giflib: disable xmlto
Message-ID: <20181026183632.27684-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/87c7fa4a8e393acaccc84bd2774f9eee32ef7d90

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/giflib/giflib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index c1471de408..29666eebea 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -18,6 +18,8 @@ GIFLIB_BINS = \
 	gifrsize gifspnge giftext giftool gifwedge icon2gif raw2gif rgb2gif \
 	text2gif
 
+GIFLIB_CONF_ENV = ac_cv_prog_have_xmlto=no
+
 define GIFLIB_BINS_CLEANUP
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(GIFLIB_BINS))
 endef
-- 
2.17.1
