From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Aug 2019 16:12:25 +0200
Subject: [Buildroot] [git commit] package/yad: fix build with NLS
Message-ID: <20190808140958.0A8558E4BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29e689d41a9f73b8542643d75f550d2e118ad3a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/40ccab40d7c82b908a622d45998d057a31d9cac6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/yad/yad.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/yad/yad.mk b/package/yad/yad.mk
index d674316cf3..01bf334a75 100644
--- a/package/yad/yad.mk
+++ b/package/yad/yad.mk
@@ -9,7 +9,8 @@ YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
 YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
 YAD_LICENSE = GPL-3.0
 YAD_LICENSE_FILES = COPYING
-YAD_DEPENDENCIES = host-intltool host-pkgconf
+YAD_DEPENDENCIES = host-intltool host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+YAD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 YAD_CONF_OPTS = --enable-html=no
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
