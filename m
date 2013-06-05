From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 00:10:31 +0200
Subject: [Buildroot] [git commit] directfb: add optional imlib2 support
Message-ID: <20130605221238.3C16D9A5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88378877273829c387f48a6c96959712b892856f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop default y]
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in   |    4 ++++
 package/directfb/directfb.mk |    8 ++++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index b9ff5f9..4712db0 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -100,6 +100,10 @@ config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
 	default y
 
+config BR2_PACKAGE_DIRECTFB_IMLIB2
+	bool "enable IMLIB2 support"
+	select BR2_PACKAGE_IMLIB2
+
 config BR2_PACKAGE_DIRECTFB_JPEG
 	bool "enable JPEG support"
 	default y
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 5ead084..e5a423d 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -108,6 +108,14 @@ else
 DIRECTFB_CONF_OPT += --disable-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_DIRECTFB_IMLIB2),y)
+DIRECTFB_CONF_OPT += --enable-imlib2
+DIRECTFB_DEPENDENCIES += imlib2
+DIRECTFB_CONF_ENV += ac_cv_path_IMLIB2_CONFIG=$(STAGING_DIR)/usr/bin/imlib2-config
+else
+DIRECTFB_CONF_OPT += --disable-imlib2
+endif
+
 ifeq ($(BR2_PACKAGE_DIRECTFB_DITHER_RGB16),y)
 DIRECTFB_CONF_OPT += --with-dither-rgb16=advanced
 else
