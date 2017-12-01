From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 01 Dec 2017 21:00:53 -0000
Subject: [Buildroot] [git commit] genimage: change upstream URL
Message-ID: <20171201205317.14D9D7FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=325e60767da45efe507ea13fc304866257421334
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pengutronix is now hosting the official genimage repository and release
tarballs on Github. This patch updates the official URL from the package
description and its download website described in GENIMAGE_SITE.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/genimage/Config.in.host | 2 +-
 package/genimage/genimage.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/Config.in.host b/package/genimage/Config.in.host
index 5c5a8a8..cf831a1 100644
--- a/package/genimage/Config.in.host
+++ b/package/genimage/Config.in.host
@@ -10,4 +10,4 @@ config BR2_PACKAGE_HOST_GENIMAGE
 	  environment variables, the config file or commandline
 	  switches.
 
-	  http://www.pengutronix.de/software/genimage/
+	  https://github.com/pengutronix/genimage
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 2e7aad2..8d11c66 100644
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
