From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Sep 2018 21:17:09 +0200
Subject: [Buildroot] [git commit] cutelyst: Add dependency on Kernel headers
 >= 3.3
Message-ID: <20180906191648.31C8682B36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb3c56e3557cd57be806ba599baa461452f07bef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cutelyst-WSGI module uses SO_REUSEPORT

Fixes:

http://autobuild.buildroot.net/results/d38411eda9edf16e2c40d8931bcfc889faae43dc/

Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cutelyst/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cutelyst/Config.in b/package/cutelyst/Config.in
index 91b559bd18..b2b48baa69 100644
--- a/package/cutelyst/Config.in
+++ b/package/cutelyst/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CUTELYST
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
@@ -11,6 +12,7 @@ config BR2_PACKAGE_CUTELYST
 
 	  https://cutelyst.org
 
-comment "cutelyst needs a toolchain w/ C++, gcc >= 4.8"
+comment "cutelyst needs a toolchain w/ C++, gcc >= 4.8, headers >= 3.3"
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
