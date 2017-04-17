From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Apr 2017 14:34:34 +0200
Subject: [Buildroot] [git commit] package: use SPDX short identifier for
	license string in comments
Message-ID: <20170417123448.B64267FD79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3338cd3a1704249980595f9301584352f51bac7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have started using SPDX short identifier for license string in
<PKG>_LICENSE variable. But license strings in comments are still
using old strings. For consistency, use SPDX short identifier in
comments as well.

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/4th/4th.mk                                     | 4 ++--
 package/dtv-scan-tables/dtv-scan-tables.mk             | 2 +-
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   | 4 ++--
 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk | 2 +-
 package/gupnp-dlna/gupnp-dlna.mk                       | 2 +-
 package/libgdiplus/libgdiplus.mk                       | 2 +-
 package/openobex/openobex.mk                           | 4 ++--
 package/qt5/Config.in                                  | 4 ++--
 package/rtmpdump/rtmpdump.mk                           | 4 ++--
 package/sg3_utils/sg3_utils.mk                         | 2 +-
 package/supertux/supertux.mk                           | 2 +-
 package/supertuxkart/supertuxkart.mk                   | 6 +++---
 package/util-linux/util-linux.mk                       | 4 ++--
 package/xscreensaver/xscreensaver.mk                   | 2 +-
 14 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index d7daeb3..c26eaff 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -8,8 +8,8 @@
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
 4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
 4TH_LICENSE = GPL-3.0+, LGPL-3.0+
-# The COPYING file only contains the text of the LGPLv3, but the
-# source code really contains parts under GPLv3+.
+# The COPYING file only contains the text of the LGPL-3.0, but the
+# source code really contains parts under GPL-3.0+.
 4TH_LICENSE_FILES = COPYING
 4TH_DEPENDENCIES = host-4th
 4TH_INSTALL_STAGING = YES
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 8c1ae6d..3c546ed 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -12,7 +12,7 @@ DTV_SCAN_TABLES_SITE_METHOD = git
 # as per traditional copyright, but just a collection of 'facts', so there's
 # probably no license to apply to these data files.
 # However, the package prominently contains the COPYING and COPYING.LIB
-# license files (respectively for the GPLv2 and the LGPLv2.1), so we use
+# license files (respectively for the GPL-2.0 and the LGPL-2.1), so we use
 # that as the licensing information.
 DTV_SCAN_TABLES_LICENSE = GPL-2.0, LGPL-2.1
 DTV_SCAN_TABLES_LICENSE_FILES = COPYING COPYING.LGPL
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 967893f..547d253 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -7,8 +7,8 @@
 GST_FSL_PLUGINS_VERSION = 4.0.3
 GST_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)
 
-# Most is LGPLv2+, but some sources are copied from upstream and are
-# LGPLv2.1+, which essentially makes it LGPLv2.1+
+# Most is LGPL-2.0+, but some sources are copied from upstream and are
+# LGPL-2.1+, which essentially makes it LGPL-2.1+
 GST_FSL_PLUGINS_LICENSE = LGPL-2.0+, LGPL-2.1+, PROPRIETARY (asf.h)
 GST_FSL_PLUGINS_LICENSE_FILES = COPYING-LGPL-2.1 COPYING-LGPL-2
 
diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
index a61ab6e..1a1e2a1 100644
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -8,7 +8,7 @@ GST_PLUGINS_UGLY_VERSION = 0.10.19
 GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST_PLUGINS_UGLY_PATCH = http://git.alpinelinux.org/cgit/aports/plain/main/gst-plugins-ugly0.10/cdio-cd-text-api.patch
-# COPYING is in fact LGPLv2.1, but all of the code is v2+
+# COPYING is in fact LGPL-2.1, but all of the code is LGPL-2.0+
 # (except for one test, xingmux)
 GST_PLUGINS_UGLY_LICENSE = LGPL-2.0+, GPL-2.0+ (synaesthesia)
 GST_PLUGINS_UGLY_LICENSE_FILES = COPYING
diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 2d072be..304f86a 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -9,7 +9,7 @@ GUPNP_DLNA_VERSION = $(GUPNP_DLNA_VERSION_MAJOR).5
 GUPNP_DLNA_SOURCE = gupnp-dlna-$(GUPNP_DLNA_VERSION).tar.xz
 GUPNP_DLNA_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/$(GUPNP_DLNA_VERSION_MAJOR)
-# COPYING contains LGPLv2.1 but all source files contain LPGLv2+
+# COPYING contains LGPL-2.1 but all source files contain LPGL-2.0+
 GUPNP_DLNA_LICENSE = LGPL-2.0+
 GUPNP_DLNA_LICENSE_FILES = COPYING
 GUPNP_DLNA_INSTALL_STAGING = YES
diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
index aac859f..7d564b6 100644
--- a/package/libgdiplus/libgdiplus.mk
+++ b/package/libgdiplus/libgdiplus.mk
@@ -7,7 +7,7 @@
 LIBGDIPLUS_VERSION = 4.2
 LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
 
-# Although there is a LICENSE file thas specifies LGPL or MPLv1.1,
+# Although there is a LICENSE file thas specifies LGPL or MPL-1.1,
 # looks like it is incorrect. The actual source files specify that
 # they're licensed under MIT, and so does the COPYING file (and they
 # all predate the addition of the LICENSE file).
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index 94ad26a..8337990 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -8,8 +8,8 @@ OPENOBEX_VERSION_MAJOR = 1.5
 OPENOBEX_VERSION = $(OPENOBEX_VERSION_MAJOR).0
 OPENOBEX_SITE = http://downloads.sourceforge.net/project/openobex/openobex/$(OPENOBEX_VERSION_MAJOR)
 OPENOBEX_SOURCE = openobex-$(OPENOBEX_VERSION)-Source.zip
-# Libraries seems to be released under LGPLv2.1+,
-# while other material is under GPLv2+.
+# Libraries seems to be released under LGPL-2.1+,
+# while other material is under GPL-2.0+.
 OPENOBEX_LICENSE = GPL-2.0+/LGPL-2.1+
 OPENOBEX_LICENSE_FILES = COPYING COPYING.LIB
 
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 4bcbc6e..626e9b2 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_QT5_VERSION_LATEST
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 	help
 	  This option builds Qt 5.8, which is licensed under
-	  (L)GPLv3+.
+	  (L)GPL-3.0+.
 
 comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
@@ -54,7 +54,7 @@ config BR2_PACKAGE_QT5_VERSION_5_6
 	bool "LTS (5.6)"
 	help
 	  This option builds Qt 5.6, which is licensed under
-	  (L)GPLv2+.
+	  (L)GPL-2.0+.
 
 endchoice
 
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 2472b52..19d9b04 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -7,8 +7,8 @@
 RTMPDUMP_VERSION = a107cef9b392616dff54fabfd37f985ee2190a6f
 RTMPDUMP_SITE = git://git.ffmpeg.org/rtmpdump
 RTMPDUMP_INSTALL_STAGING = YES
-# Note that rtmpdump is GPLv2 but librtmp has its own license and since we only
-# care about librtmp, it's LGPLv2.1+
+# Note that rtmpdump is GPL-2.0 but librtmp has its own license and since we only
+# care about librtmp, it's LGPL-2.1+
 RTMPDUMP_LICENSE = LGPL-2.1+
 RTMPDUMP_LICENSE_FILES = librtmp/COPYING
 RTMPDUMP_DEPENDENCIES = zlib
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 783f4f6..f010b3e 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -8,7 +8,7 @@ SG3_UTILS_VERSION = 1.42
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-3-Clause
-# utils progs are GPLv2+ licenced
+# utils progs are GPL-2.0+ licenced
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
 SG3_UTILS_LICENSE += GPL-2.0+
 endif
diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
index f49df35..e397441 100644
--- a/package/supertux/supertux.mk
+++ b/package/supertux/supertux.mk
@@ -8,7 +8,7 @@ SUPERTUX_VERSION = 0.5.1
 SUPERTUX_SITE = https://github.com/SuperTux/supertux/releases/download/v$(SUPERTUX_VERSION)
 SUPERTUX_SOURCE = SuperTux-v$(SUPERTUX_VERSION)-Source.tar.gz
 
-# Supertux itself is GPLv3+, but it bundles a few libraries with different
+# Supertux itself is GPL-3.0+, but it bundles a few libraries with different
 # licenses (sexp-cpp, squirrel, tinygettext) which are linked statically.
 SUPERTUX_LICENSE = GPL-3.0+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, GPL-2.0+ (images music sounds)
 SUPERTUX_LICENSE_FILES = LICENSE.txt data/AUTHORS
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 98b9ca4..7636687 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -8,9 +8,9 @@ SUPERTUXKART_VERSION = 0.9.2
 SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
 SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
 
-# Supertuxkart itself is GPLv3+, but it bundles a few libraries with different
-# licenses. Irrlicht, bullet and angelscript have zlib license, while glew is
-# BSD-3c. Since they are linked statically, the result is GPLv3+.
+# Supertuxkart itself is GPL-3.0+, but it bundles a few libraries with different
+# licenses. Irrlicht, bullet and angelscript have Zlib license, while glew is
+# BSD-3-Clause. Since they are linked statically, the result is GPL-3.0+.
 SUPERTUXKART_LICENSE = GPL-3.0+
 SUPERTUXKART_LICENSE_FILES = COPYING
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 70f88a1..325d0fe 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -12,8 +12,8 @@ UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERS
 # 0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch
 UTIL_LINUX_AUTORECONF = YES
 
-# README.licensing claims that some files are GPLv2-only, but this is not true.
-# Some files are GPLv3+ but only in tests.
+# README.licensing claims that some files are GPL-2.0 only, but this is not true.
+# Some files are GPL-3.0+ but only in tests.
 UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid)
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
 UTIL_LINUX_INSTALL_STAGING = YES
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 773fcde..a726bee 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -7,7 +7,7 @@
 XSCREENSAVER_VERSION = 5.32
 XSCREENSAVER_SITE = http://www.jwz.org/xscreensaver
 
-# N.B. GPLv2+ code (in the hacks/glx subdirectory) is not currently built.
+# N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 
