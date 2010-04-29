From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 29 Apr 2010 23:11:25 +0300
Subject: [Buildroot] [PATCH] Xcursor-themes depends on libXcursor
Message-ID: <20100429201125.7217.65309.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Darius Augulis <augulis.darius@gmail.com>

While at it convert spaces to TABs

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/x11r7/xdata_xcursor-themes/Config.in       |    6 +++---
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |    1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdata_xcursor-themes/Config.in b/package/x11r7/xdata_xcursor-themes/Config.in
index 977309d..78d1020 100644
--- a/package/x11r7/xdata_xcursor-themes/Config.in
+++ b/package/x11r7/xdata_xcursor-themes/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XDATA_XCURSOR_THEMES
-        bool "xdata_xcursor-themes"
-        help
+	bool "xdata_xcursor-themes"
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	help
 	  No description available
-
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index aa68c65..da928f4 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -9,5 +9,6 @@ XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XCURSOR_THEMES_AUTORECONF = NO
 XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
 XDATA_XCURSOR_THEMES_INSTALL_TARGET = YES
+XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdata_xcursor-themes))
