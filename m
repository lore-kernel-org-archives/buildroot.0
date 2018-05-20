From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 18:16:56 +0200
Subject: [Buildroot] [PATCH 1/1] znc: add mandatory dependency on threads
Message-ID: <20180520161656.30997-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Threads support is mandatory since version 1.7.0:
https://github.com/znc/znc/commit/582cd635f5a047761b1052a40088ab86e62fffc1

Fixes:
 - http://autobuild.buildroot.net/results/cc56c7dbee594056288296398772ef9e22846299

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/znc/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/znc/Config.in b/package/znc/Config.in
index feca2c42f0..4fc7bbb95b 100644
--- a/package/znc/Config.in
+++ b/package/znc/Config.in
@@ -4,12 +4,13 @@ config BR2_PACKAGE_ZNC
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Advanced IRC bouncer
 
 	  http://www.znc.in
 
-comment "znc needs a toolchain w/ C++, dynamic library, gcc >= 4.8"
+comment "znc needs a toolchain w/ C++, dynamic library, gcc >= 4.8, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
-- 
2.14.1
