From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Dec 2016 15:05:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/lcms2: remove empty variable
	LCMS2_CONF_OPT
Message-ID: <20161218140553.30508-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduced 2013 with the commit adding this package
https://git.buildroot.net/buildroot/commit/package/lcms2?id=901282aa6e330c5e61ab25a83ba68e443cb3aec2
without any notice why it is needed.

The package compiles fine without it so let's remove it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lcms2/lcms2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 3d330c59c..29f8ac8de 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -10,8 +10,6 @@ LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
 LCMS2_INSTALL_STAGING = YES
 
-LCMS2_CONF_OPTS = \
-
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LCMS2_CONF_OPTS += --with-jpeg
 LCMS2_DEPENDENCIES += jpeg
-- 
2.11.0
