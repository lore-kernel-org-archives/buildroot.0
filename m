From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:05:24 +0100
Subject: [Buildroot] [PATCH 118/120] libdrm: bump version and add
	lib_pciaccess dependancy
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-59-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/libdrm/Config.in |    1 +
 package/libdrm/libdrm.mk |    3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index f1c3358..8bf676b 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
 	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	select BR2_PACKAGE_XPROTO_DRI2PROTO
 	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
 	# libatomic_ops is only available on a subset of the supported
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 4ccfa52..9184805 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -3,7 +3,7 @@
 # libdrm
 #
 #############################################################
-LIBDRM_VERSION = 2.4.23
+LIBDRM_VERSION = 2.4.33
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_INSTALL_STAGING = YES
@@ -13,6 +13,7 @@ LIBDRM_DEPENDENCIES = \
 	xproto_xf86vidmodeproto \
 	xlib_libXxf86vm \
 	xlib_libXmu \
+	xlib_libpciaccess \
 	xproto_dri2proto \
 	xlib_libpthread-stubs \
 	host-pkgconf
-- 
1.7.10.4
