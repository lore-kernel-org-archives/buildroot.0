From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 12:47:19 -0800
Subject: [Buildroot] [git commit] gd: fix build with freetype but without
	fontconfig
Message-ID: <20121204204807.15F8B99949@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d97187f8c813bf030b76ee9cf6d43d407d8e2966
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/3309617d2d5e14c0713dbaf9185815d79293e33b

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gd/gd.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 4769764..972d8dd 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -18,6 +18,10 @@ GD_CONF_OPT = --without-x --disable-rpath
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 GD_DEPENDENCIES += fontconfig
 GD_CONF_OPT += --with-fontconfig
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+GD_DEPENDENCIES += freetype
 GD_CONF_ENV += ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 endif
 
