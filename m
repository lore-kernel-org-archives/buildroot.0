From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 30 Oct 2019 09:40:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/libqmi: add Libs.Private to
 qmi-glib.pc
Message-ID: <20191030084048.11194-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix a static build failure with modem-manager and libmbim

Fixes:
 - http://autobuild.buildroot.org/results/9c6b8ec2b9cc31f1ab460532c378731ab455210c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-qmi-glib.pc.in-add-Libs.Private.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/libqmi/0001-qmi-glib.pc.in-add-Libs.Private.patch

diff --git a/package/libqmi/0001-qmi-glib.pc.in-add-Libs.Private.patch b/package/libqmi/0001-qmi-glib.pc.in-add-Libs.Private.patch
new file mode 100644
index 0000000000..46f32baab4
--- /dev/null
+++ b/package/libqmi/0001-qmi-glib.pc.in-add-Libs.Private.patch
@@ -0,0 +1,31 @@
+From c816e407b974f72d45f1878427cbeea448b3477a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 30 Oct 2019 09:29:59 +0100
+Subject: [PATCH] qmi-glib.pc.in: add Libs.Private
+
+Add @MBIM_LIBS@ to Libs.Private in qmi-glib.pc.in so applications
+linking statically with qmi-glib (such as modem-manager) will retrieve
+these dependencies
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9c6b8ec2b9cc31f1ab460532c378731ab455210c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/mobile-broadband/libqmi/merge_requests/75]
+---
+ data/pkg-config/qmi-glib.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/data/pkg-config/qmi-glib.pc.in b/data/pkg-config/qmi-glib.pc.in
+index d334494..1d5054f 100644
+--- a/data/pkg-config/qmi-glib.pc.in
++++ b/data/pkg-config/qmi-glib.pc.in
+@@ -9,3 +9,4 @@ Version: @VERSION@
+ Requires: glib-2.0 gobject-2.0 gio-2.0
+ Cflags: -I${includedir}/libqmi-glib
+ Libs: -L${libdir} -lqmi-glib
++Libs.Private: @MBIM_LIBS@
+-- 
+2.23.0
+
-- 
2.23.0
