From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:42 +0100
Subject: [Buildroot] [PATCH 50/80 v1] package/imlib2: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <471842caa35cf9ac3e6a38442405b29ae374ac81.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

imlib2 has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/imlib2/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
index 7aac074..0b10623 100644
--- a/package/imlib2/Config.in
+++ b/package/imlib2/Config.in
@@ -1,7 +1,7 @@
 comment "imlib2 needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_IMLIB2
+menuconfig BR2_PACKAGE_IMLIB2
 	bool "imlib2"
 	select BR2_PACKAGE_FREETYPE
 	depends on !BR2_STATIC_LIBS # dlopen()
@@ -39,4 +39,5 @@ config BR2_PACKAGE_IMLIB2_X
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBX11
+
 endif
-- 
1.9.1
