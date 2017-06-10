From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:33:15 +0200
Subject: [Buildroot] [git commit] package/libv4l: toolchain w/ locale is not
	mandatory
Message-ID: <20170610213325.589D17F89E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07735334ea62e96bc0617b090ded2af4797fa345
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libv4l package builds fine even if locale is not enabled.
This have been tested with stm32f469_disco_defconfig
enabling build of libv4l package:
+#v4l utilities
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_PACKAGE_LIBV4L=y
+BR2_PACKAGE_LIBV4L_UTILS=y

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 8d1b931..638aeff 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -19,7 +19,6 @@ comment "libv4l JPEG support not enabled"
 
 config BR2_PACKAGE_LIBV4L_UTILS
 	bool "v4l-utils tools"
-	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  v4l-utils is a collection of various video4linux and DVB utilities.
@@ -35,9 +34,6 @@ config BR2_PACKAGE_LIBV4L_UTILS
 	  - rds-ctl
 	  - qv4l2 (if Qt is enabled)
 
-comment "libv4l-utils tools need a toolchain w/ locale"
-	depends on !BR2_ENABLE_LOCALE
-
 endif
 
 comment "libv4l needs a toolchain w/ threads, C++ and headers >= 3.0"
