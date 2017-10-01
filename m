From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Oct 2017 23:10:16 +0200
Subject: [Buildroot] [git commit] package/supertuxkart: needs freetype
Message-ID: <20171001211816.0E4478110F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffcaf9158c1619d83091e3c3f3bf58181c8d70dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/supertuxkart/stk-code/blob/master/CMakeLists.txt#L231

Build would fail without this patch using this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_SUPERTUXKART=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Acked-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supertuxkart/Config.in       | 1 +
 package/supertuxkart/supertuxkart.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 4919b50..5175916 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLU
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 7636687..dc4b232 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -15,6 +15,7 @@ SUPERTUXKART_LICENSE = GPL-3.0+
 SUPERTUXKART_LICENSE_FILES = COPYING
 
 SUPERTUXKART_DEPENDENCIES = \
+	freetype \
 	jpeg \
 	libcurl \
 	libgl \
