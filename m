From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 23 May 2020 03:14:37 -0600
Subject: [Buildroot] [PATCH 1/1] package/luajit: depend on !BR2_PACKAGE_LUA
Message-ID: <20200523091437.1890881-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The luajit package is incomaptible with lua so luajit should depend on
!BR2_PACKAGE_LUA, propagate this dependency to packages selecting
luajit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/efl/Config.in      | 1 +
 package/luajit/Config.in   | 1 +
 package/minetest/Config.in | 1 +
 package/solarus/Config.in  | 1 +
 package/sysdig/Config.in   | 1 +
 5 files changed, 5 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index ff49161163..c63633ffe4 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EFL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
+	depends on !BR2_PACKAGE_LUA # luajit
 	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR # use wchar_t
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index f4d6001586..bb471b46b0 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_LUAJIT
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_LUA
 	# luajit.mk uses the "-m32" compiler option to build 32bit
 	# binaries, so check if that option is supported. See
 	# luajit.mk for details.
diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index 085525534d..880122ea84 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MINETEST
 	depends on BR2_PACKAGE_XORG7 # irrlicht
 	depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_LUA # luajit
 	select BR2_PACKAGE_IRRLICHT
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_JSONCPP
diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index 5d15342f3a..f18f5a7963 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SOLARUS
 	bool "solarus"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_LUA # luajit
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 0a1b3f8935..f2d2595a99 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_LUA # luajit
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on !BR2_STATIC_LIBS # luajit, elfutils
 	depends on BR2_USE_WCHAR # elfutils
-- 
2.25.1
