From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 21:41:28 +0100
Subject: [Buildroot] [git commit] package/matchbox-lib: fix xlib
	libcomposite and libxpm symbols
Message-ID: <20161210204132.B9ADC8172A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9365007e19f1cdd272b6d4b74c1f4fee81bda777
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox-lib/matchbox-lib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index d43e2b8..451279e 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -21,8 +21,8 @@ endef
 
 MATCHBOX_LIB_POST_INSTALL_STAGING_HOOKS += MATCHBOX_LIB_POST_INSTALL_FIXES
 
-ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
-ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
 MATCHBOX_LIB_DEPENDENCIES += xlib_libXpm
 endif
 endif
