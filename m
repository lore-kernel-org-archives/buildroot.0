From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:36:54 +0200
Subject: [Buildroot] [git commit] xlib_libXpm: use the new gettext logic
Message-ID: <20170704233519.CAE6B7FCEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e398ec92e9ad04e5bbae32f03cd18a53b5761517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves
using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
on gettext/host-gettext.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index c8c5496..e781a8b 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -13,8 +13,7 @@ XLIB_LIBXPM_INSTALL_STAGING = YES
 # we patch configure.ac
 XLIB_LIBXPM_AUTORECONF = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
-	host-gettext
+	$(TARGET_NLS_DEPENDENCIES)
 
 $(eval $(autotools-package))
