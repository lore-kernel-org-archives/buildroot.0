From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Wed, 15 Nov 2017 13:14:35 -0500
Subject: [Buildroot] [PATCH v2] genimage: change upstream URL
Message-ID: <20171115181435.5925-1-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pengutronix is now hosting the official genimage repository and release
tarballs on Github. This patch updates the official URL from the package
description and its download website described in GENIMAGE_SITE.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 package/genimage/Config.in.host | 2 +-
 package/genimage/genimage.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/Config.in.host b/package/genimage/Config.in.host
index 5c5a8a8a2c..cf831a143c 100644
--- a/package/genimage/Config.in.host
+++ b/package/genimage/Config.in.host
@@ -10,4 +10,4 @@ config BR2_PACKAGE_HOST_GENIMAGE
 	  environment variables, the config file or commandline
 	  switches.
 
-	  http://www.pengutronix.de/software/genimage/
+	  https://github.com/pengutronix/genimage
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 2e7aad20c6..8d11c66a25 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -6,7 +6,7 @@
 
 GENIMAGE_VERSION = 9
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
-GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
+GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
 GENIMAGE_LICENSE = GPL-2.0
 GENIMAGE_LICENSE_FILES = COPYING
-- 
2.15.0
