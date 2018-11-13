From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:54:17 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] giflib: disable xmlto
Message-ID: <20181113225138.2170382BC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b803c7e85ccdd24901660cc78a15ccd76b9eff89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:
 - http://autobuild.buildroot.org/results/87c7fa4a8e393acaccc84bd2774f9eee32ef7d90

xmlto is optionally used to generate documentation, which we don't need.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 220f25e9407a17804719d5355196f50b2d5e1f55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
