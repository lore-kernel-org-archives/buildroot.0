From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 15:52:20 +0200
Subject: [Buildroot] [git commit] package/freeswitch: Disable mod_imagick,
	broken with imagemagick7
Message-ID: <20160616135227.B46C1804EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c8046cf7a1e4a0508e01cdd38e61bc83fe6717b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Problem sent upstream: https://freeswitch.org/jira/browse/FS-9272

Fixes
http://autobuild.buildroot.net/results/e20/e20c0b9a32f6bef5d43369437895058d44d0df58/
http://autobuild.buildroot.net/results/aa4/aa4d681de85497c2cdd2b0488d9b4569160b5f02/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freeswitch/freeswitch.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 043102c..e7e9ece 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -173,11 +173,6 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
 
-ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
-FREESWITCH_DEPENDENCIES += imagemagick
-FREESWITCH_ENABLED_MODULES += formats/mod_imagick
-endif
-
 ifeq ($(BR2_PACKAGE_LIBBROADVOICE),y)
 FREESWITCH_DEPENDENCIES += libbroadvoice
 FREESWITCH_ENABLED_MODULES += codecs/mod_bv
