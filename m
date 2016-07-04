From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:26 +0200
Subject: [Buildroot] [PATCH 75/83 v2] package/weston: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <c41b57f735b38f904df42c33ade455e7b77d52c7.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

weston has 5 options, so use a 'menuconfig' to group the options in a
sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 0812279..810a9a0 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -3,7 +3,7 @@ comment "weston needs udev and a toolchain w/ locale, threads, dynamic library,
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS || \
 		!BR2_ENABLE_LOCALE
 
-config BR2_PACKAGE_WESTON
+menuconfig BR2_PACKAGE_WESTON
 	bool "weston"
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
-- 
2.7.4
