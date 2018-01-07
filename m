From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:27:58 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXpm: disable gettext
 detection when not needed
Message-ID: <20180107203114.8731D83B3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6653b0929fc3f4007294e289f88afa3920af2a89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch originates from FreeBSD:
https://lists.freebsd.org/pipermail/freebsd-x11/2015-July/016528.html
https://svnweb.freebsd.org/ports/head/x11/libXpm/Makefile?r1=384234&r2=391122&pathrev=391122

Fixes
http://autobuild.buildroot.net/results/f24/f24dc74c111690f068833ff6fc72df9a0853d210/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index e781a8b..09f897e 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -16,4 +16,8 @@ XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(TARGET_NLS_DEPENDENCIES)
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+XLIB_LIBXPM_CONF_ENV = ac_cv_search_gettext=no
+endif
+
 $(eval $(autotools-package))
