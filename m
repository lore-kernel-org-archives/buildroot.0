From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon,  9 Mar 2015 13:38:38 +0100
Subject: [Buildroot] [PATCH v2] package/kodi: fix a runtime bug (no text
	displayed in GUI) when a glibc toolchain is used
Message-ID: <1425904718-24193-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>


Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
Changes since v1:
 * took Yann suggestion into account
 * smaller comment
 * problem also occurs on non external glibc toolchains

 package/kodi/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 1bc8b15..91fca28 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -91,6 +91,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_XLIB_XT if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
+	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
 	depends on BR2_INET_IPV6
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
-- 
1.7.9.5
