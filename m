From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 31 Oct 2019 13:50:39 +0100
Subject: [Buildroot] [PATCH v2,2/3] package/sysrepo: needs NPTL
In-Reply-To: <20191031125040.32007-1-fontaine.fabrice@gmail.com>
References: <20191031125040.32007-1-fontaine.fabrice@gmail.com>
Message-ID: <20191031125040.32007-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sysrepo needs pthread_rwlock_timedrdlock

Fixes:
 - http://autobuild.buildroot.org/results/f0e4368977f257d76aedff335af3068deafaf28f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysrepo/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index 3ad6040858..64050adfda 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_SYSREPO
 	depends on BR2_USE_MMU # libnetconf2
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # host-protobuf
 	select BR2_PACKAGE_LIBAVL
@@ -28,8 +28,8 @@ config BR2_PACKAGE_SYSREPO_EXAMPLES
 
 endif
 
-comment "sysrepo needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "sysrepo needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_NPTL
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-- 
2.23.0
