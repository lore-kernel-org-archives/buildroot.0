From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  1 Nov 2019 06:53:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix NPTL dependency
Message-ID: <20191101055320.16078-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

Dependency is BR2_TOOLCHAIN_HAS_THREADS_NPTL instead of
!BR2_TOOLCHAIN_HAS_NPTL.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 package/sysrepo/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index 64050adfda..18a09e0c57 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_SYSREPO
 	depends on BR2_USE_MMU # libnetconf2
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # host-protobuf
 	select BR2_PACKAGE_LIBAVL
@@ -31,5 +31,5 @@ endif
 comment "sysrepo needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_NPTL
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-- 
2.20.1
