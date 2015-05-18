From: Gergely Imreh <imrehg@gmail.com>
Date: Mon, 18 May 2015 05:47:55 +0000
Subject: [Buildroot] [PATCH 1/1] wvstreams: not available for static only
	builds
Message-ID: <1431928065-20878-1-git-send-email-imrehg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 http://autobuild.buildroot.org/results/0cd/0cd5e0263b42e6845504d97688632e16206bd000/
 http://autobuild.buildroot.org/results/4e0/4e0ab461ea7ed7a288303741eec89156abd49864/

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
---
 package/wvstreams/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
index 3080dc7..0cbe60a 100644
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WVSTREAMS
 	bool "wvstreams"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -9,6 +10,6 @@ config BR2_PACKAGE_WVSTREAMS
 
 	  http://wvstreams.googlecode.com/
 
-comment "wvstreams needs a toolchain w/ C++"
+comment "wvstreams needs a toolchain w/ C++, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
-- 
2.1.4
