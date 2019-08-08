From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  8 Aug 2019 10:03:22 +0200
Subject: [Buildroot] [PATCH 1/4] package/pcmanfm: fix build with NLS
Message-ID: <20190808080325.4182-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/f6dfad52aa7f3528472a33a0fe4f5e35932541d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcmanfm/pcmanfm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 6dadfaeebd..5d8730984c 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -7,9 +7,10 @@
 PCMANFM_VERSION = 1.3.0
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
 PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
-PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm
+PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm $(TARGET_NLS_DEPENDENCIES)
 PCMANFM_LICENSE = GPL-2.0+
 PCMANFM_LICENSE_FILES = COPYING
+PCMANFM_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 PCMANFM_CONF_OPTS += --with-gtk=3
-- 
2.20.1
