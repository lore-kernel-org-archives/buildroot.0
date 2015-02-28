From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 10:34:39 +0100
Subject: [Buildroot] [git commit] x11r7/xcb-util-keysyms: depends on
	host-pkgconf and libxcb
Message-ID: <20150228094510.29717804CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce6a0e685ef38a09e9aeb120cc36544eea40d913
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failure:
./configure: line 11453: /home/tetsuya/buildroot/br/output/host/usr/bin/pkg-config: No such file or directory
configure: error: in `/home/tetsuya/buildroot/br/output/build/xcb-util-keysyms-0.3.9':
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Fix build failure:
configure: error: Package requirements (xcb >= 1.4) were not met:

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xcb-util-keysyms/Config.in           |    1 +
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

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
