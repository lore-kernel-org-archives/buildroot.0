From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  2 Apr 2017 22:04:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix autoreconf
Message-ID: <20170402200420.32139-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch suggested by Romain:
http://lists.busybox.net/pipermail/buildroot/2017-April/188480.html

Fixes
http://autobuild.buildroot.net/results/a20/a20d133a01a911fab8e7141a60c76c5832db8494/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/Config.in | 1 +
 package/libdrm/libdrm.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 81fc5ccf9..4bf8cf64c 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	select BR2_PACKAGE_LIBPTHREAD_STUBS
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
 	help
 	  Direct Rendering Manager
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 875d3cc4a..3fc18c887 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -13,8 +13,10 @@ LIBDRM_AUTORECONF = YES
 
 LIBDRM_INSTALL_STAGING = YES
 
+# xutil_util-macros is needed for autoreconf
 LIBDRM_DEPENDENCIES = \
 	libpthread-stubs \
+	xutil_util-macros \
 	host-pkgconf
 
 LIBDRM_CONF_OPTS = \
-- 
2.11.0
