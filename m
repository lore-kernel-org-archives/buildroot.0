From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jun 2018 16:42:57 +0200
Subject: [Buildroot] [PATCH 11/13] package/x11r7/xutil_makedepend: switch to
 xorgproto
Message-ID: <20180617144259.3868-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xutil_makedepend/Config.in           | 1 +
 package/x11r7/xutil_makedepend/xutil_makedepend.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/Config.in b/package/x11r7/xutil_makedepend/Config.in
index 0b091b0e34..fdf2fb92c1 100644
--- a/package/x11r7/xutil_makedepend/Config.in
+++ b/package/x11r7/xutil_makedepend/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XUTIL_MAKEDEPEND
 	bool "makedepend"
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  No description available
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 6fd3c1ae36..8a058efcec 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -10,8 +10,8 @@ XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_MAKEDEPEND_LICENSE = MIT
 XUTIL_MAKEDEPEND_LICENSE_FILES = COPYING
 
-XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
-HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto_xproto
+XUTIL_MAKEDEPEND_DEPENDENCIES = xorgproto
+HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xorgproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.17.1
