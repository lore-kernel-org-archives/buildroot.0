From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:15:18 +0200
Subject: [Buildroot] [git commit] package/libv4l: fix udev configure options
Message-ID: <20170527151528.571F77FFE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1404d5b4eaed845223b409a6673230c64128115
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AC_ARG_WITH([libudev] was removed in version 1.12.0:
https://git.linuxtv.org/v4l-utils.git/commit/configure.ac?id=3aba7817cd1994e6da00651114368db8171eabcc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/libv4l.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 6bc9d85..7a5956c 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -46,10 +46,7 @@ LIBV4L_DEPENDENCIES += libgl
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBV4L_CONF_OPTS += --with-libudev
 LIBV4L_DEPENDENCIES += udev
-else
-LIBV4L_CONF_OPTS += --without-libudev
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLU),y)
