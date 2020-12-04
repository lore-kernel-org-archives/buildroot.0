From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  4 Dec 2020 21:50:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xload: disable gettext
 detection when not needed
Message-ID: <20201204205052.1404782-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch originates from FreeBSD:
https://lists.freebsd.org/pipermail/freebsd-x11/2015-July/016528.html
https://svnweb.freebsd.org/ports/head/x11/libXpm/Makefile?r1=384234&r2=391122&pathrev=391122

Fixes:
http://autobuild.buildroot.net/results/2ad/2ad27875ce5c16a111d54d452eb395257e9b5e2b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
xlib_libXpm was fixed the same way:
http://patchwork.ozlabs.org/project/buildroot/patch/20180107175626.19944-1-bernd.kuhls at t-online.de/

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
-- 
2.29.2
