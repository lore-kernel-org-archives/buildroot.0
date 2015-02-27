From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 27 Feb 2015 10:19:20 +0100
Subject: [Buildroot] [PATCH 3/7] x11r7/xcb-util-keysyms: depends on
	host-pkgconf and libxcb
In-Reply-To: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425028764-1146-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure:
./configure: line 11453: /home/tetsuya/buildroot/br/output/host/usr/bin/pkg-config: No such file or directory
configure: error: in `/home/tetsuya/buildroot/br/output/build/xcb-util-keysyms-0.3.9':
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Fix build failure:
configure: error: Package requirements (xcb >= 1.4) were not met:

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/x11r7/xcb-util-keysyms/Config.in           | 1 +
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/x11r7/xcb-util-keysyms/Config.in b/package/x11r7/xcb-util-keysyms/Config.in
index ef42eb2..0c1d8cc 100644
--- a/package/x11r7/xcb-util-keysyms/Config.in
+++ b/package/x11r7/xcb-util-keysyms/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XCB_UTIL_KEYSYMS
 	bool "xcb-util-keysyms"
+	select BR2_PACKAGE_LIBXCB
 	help
 	  The XCB util modules provides a number of libraries which sit on top
 	  of libxcb, the core X protocol library, and some of the extension
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
index 0f653c3..6bc0a79 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -13,4 +13,6 @@ XCB_UTIL_KEYSYMS_LICENSE = MIT
 
 XCB_UTIL_KEYSYMS_INSTALL_STAGING = YES
 
+XCB_UTIL_KEYSYMS_DEPENDENCIES = host-pkgconf libxcb
+
 $(eval $(autotools-package))
-- 
2.3.0
