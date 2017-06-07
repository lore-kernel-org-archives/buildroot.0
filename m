From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Jun 2017 21:54:12 +0200
Subject: [Buildroot] [git commit] package/xf86-input-tslib: enable static
	build
Message-ID: <20170607200904.7BBA78010B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e1690a5290bfba7130edc1afe74cce7996454ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

since tslib now supports static builds the dependency on !BR2_STATIC_LIBS
can be removed from xf86-input-tslib too.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-input-tslib/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
index 08d790c..4e77abc 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	bool "xf86-input-tslib"
-	depends on !BR2_STATIC_LIBS # tslib
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
@@ -9,6 +8,3 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	  Touch screen library input driver
 
 	  https://github.com/merge/xf86-input-tslib
-
-comment "xf86-input-tslib needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
