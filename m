From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 16:15:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/vdr: needs headers >= 3.9
Message-ID: <20170603141540.25469-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DVBv5 statistics properties were added in kernel 3.9:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/include/uapi/linux/dvb/frontend.h?h=v3.9

Fixes
http://autobuild.buildroot.net/results/c6c/c6ce6ca1986f2b82ff03e55dc650484f858b7e32/
http://autobuild.buildroot.net/results/208/20887b7161d895c2348c29f91e3d4b3f1c6f25e0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vdr/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/vdr/Config.in b/package/vdr/Config.in
index d283b462b..d32c64271 100644
--- a/package/vdr/Config.in
+++ b/package/vdr/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_VDR
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 	depends on !BR2_TOOLCHAIN_USES_MUSL # _nl_msg_cat_cntr
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
@@ -18,8 +19,9 @@ config BR2_PACKAGE_VDR
 
 	  http://www.tvdr.de
 
-comment "vdr needs a glibc or uClibc toolchain w/ C++, dynamic library, NPTL, wchar"
+comment "vdr needs a glibc or uClibc toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		BR2_TOOLCHAIN_USES_MUSL || !BR2_USE_WCHAR
+		BR2_TOOLCHAIN_USES_MUSL || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
-- 
2.11.0
