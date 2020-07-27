From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 22:29:54 +0200
Subject: [Buildroot] [git commit] package/minetest: depend on LuaJIT
Message-ID: <20200727203322.EC8F182AF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e387bc2105a423b7085653fd368b38f383dc17c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Luajit is a provider for luainterpreter. We can't select providers of
virtual packages; we can only depend on them.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - a lua interpreter is needed, so don't drop the dependency
  - make it a "depends on" rather than a "select"
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/minetest/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index 085525534d..b8ee175d52 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -5,11 +5,10 @@ config BR2_PACKAGE_MINETEST
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_XORG7 # irrlicht
 	depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_IRRLICHT
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
 	# At least one option must be enabled
@@ -59,7 +58,6 @@ comment "minetest needs a toolchain w/ C++, gcc >= 4.9, threads"
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "minetest needs X11 and an OpenGL provider"
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on (BR2_INSTALL_LIBSTDCPP \
 		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		&& BR2_TOOLCHAIN_HAS_THREADS)
