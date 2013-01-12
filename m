From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:53:41 +0100
Subject: [Buildroot] [git commit] webkit: remove X.org server dependency
Message-ID: <20130112215439.E18049990C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b29492cf7a67a705dc0302018d1a7b35d19f308
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webkit/webkit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index a9701e4..d37601f 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -19,7 +19,7 @@ WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config \
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	WEBKIT_CONF_OPT += --with-target=x11
-	WEBKIT_DEPENDENCIES += xserver_xorg-server xlib_libXt
+	WEBKIT_DEPENDENCIES += xlib_libXt
 else
 	WEBKIT_CONF_OPT += --with-target=directfb
 	WEBKIT_DEPENDENCIES += directfb
