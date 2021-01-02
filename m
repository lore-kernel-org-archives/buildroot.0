From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jan 2021 22:43:21 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xload: disable gettext
 detection when not needed
Message-ID: <20210102212737.1A97C7FC0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3dc427eb1daadcdcb04a5a8efdefc4315da65818
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch originates from FreeBSD:
https://lists.freebsd.org/pipermail/freebsd-x11/2015-July/016528.html
https://svnweb.freebsd.org/ports/head/x11/libXpm/Makefile?r1=384234&r2=391122&pathrev=391122

Fixes:
http://autobuild.buildroot.net/results/2ad/2ad27875ce5c16a111d54d452eb395257e9b5e2b/

Similar to how xlib_libXpm was fixed back in 2018, with 6653b0929f
(package/x11r7/xlib_libXpm: disable gettext detection when not needed).

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xload/xapp_xload.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index 4bb21ecf0b..9f491ccdc6 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -18,4 +18,8 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 XAPP_XLOAD_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -DRLOADSTUB"
 endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+XAPP_XLOAD_CONF_ENV += ac_cv_search_gettext=no
+endif
+
 $(eval $(autotools-package))
