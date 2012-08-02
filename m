From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:46 -0000
Subject: [Buildroot] [git commit branch/next] imagemagick: ensure cross
	freetype-config is used
Message-ID: <20120802195245.669048C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8490742fb4937f5550127d6482b006fd88bd746
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/fd6fd5b55b1e2fc5a70537f548bbcafab9773e4c/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imagemagick/imagemagick.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index a8b69c7..5cbb147 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -44,6 +44,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 IMAGEMAGICK_CONF_OPT += --with-freetype
+IMAGEMAGICK_CONF_ENV += \
+	ac_cv_path_freetype_config=$(STAGING_DIR)/usr/bin/freetype-config
 IMAGEMAGICK_DEPENDENCIES += freetype
 else
 IMAGEMAGICK_CONF_OPT += --without-freetype
