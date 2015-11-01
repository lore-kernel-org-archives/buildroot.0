From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  1 Nov 2015 19:07:39 +0100
Subject: [Buildroot] [PATCH v6 03/33] package/libevas-generic-loaders: svg
	loader: add MMU dependency
In-Reply-To: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
References: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1446401289-9059-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v6: new patch
---
 package/libevas-generic-loaders/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
index c69f5e8..72d4adb 100644
--- a/package/libevas-generic-loaders/Config.in
+++ b/package/libevas-generic-loaders/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	bool "SVG loader"
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
+	depends on BR2_USE_MMU # librsvg -> glib2
 	depends on BR2_USE_WCHAR # librsvg -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
@@ -25,6 +26,7 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 
 comment "SVG loader needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 
 endif
-- 
2.4.3
