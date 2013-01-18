From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Jan 2013 23:22:32 +0100
Subject: [Buildroot] [git commit] gd: explictly disable freetype support
	when not available
Message-ID: <20130118222226.D6BCB9A30B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e81e2770aff61d07306d0448bd434d613ed9afef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it will try to run freetype-config from the host to check
for availability.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gd/gd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index de1f5d1..1f9b1d6 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -23,6 +23,8 @@ endif
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 GD_DEPENDENCIES += freetype
 GD_CONF_ENV += ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
+else
+GD_CONF_OPT += --without-freetype
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
