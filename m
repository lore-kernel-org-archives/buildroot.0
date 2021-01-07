From: Fabien Lehoussel <fabien.lehoussel@medianesysteme.com>
Date: Thu,  7 Jan 2021 12:06:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/genimage : fix dependency to
 host-mtools mcopy is used by genimage when creating fat parts
Message-ID: <20210107110634.65195-1-fabien.lehoussel@medianesysteme.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@medianesysteme.com>
---
 package/genimage/Config.in.host | 1 +
 package/genimage/genimage.mk    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/genimage/Config.in.host b/package/genimage/Config.in.host
index cf831a143c..8db7eed8e4 100644
--- a/package/genimage/Config.in.host
+++ b/package/genimage/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_GENIMAGE
 	bool "host genimage"
+	select BR2_PACKAGE_HOST_MTOOLS
 	help
 	  genimage is a tool to generate multiple filesystem and flash
 	  images from a given root filesystem tree. genimage is
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index dde8f8b9e0..1fa93e0854 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -7,7 +7,7 @@
 GENIMAGE_VERSION = 13
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
-HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
+HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse host-mtools
 GENIMAGE_LICENSE = GPL-2.0
 GENIMAGE_LICENSE_FILES = COPYING
 
-- 
2.25.1
