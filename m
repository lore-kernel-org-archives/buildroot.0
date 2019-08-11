From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:51:21 +0200
Subject: [Buildroot] [git commit] package/pango: needs gcc >= 4.8
Message-ID: <20190811210020.12D0581336@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae0eb7b212ad3bb4d3e0a5f4526e732cc0d2442f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 we need gcc >= 4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pango/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pango/Config.in b/package/pango/Config.in
index e8a5318675..cdf8b54171 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PANGO
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
@@ -22,8 +23,9 @@ config BR2_PACKAGE_PANGO
 
 	  http://www.pango.org/
 
-comment "pango needs a toolchain w/ wchar, threads, C++"
+comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_INSTALL_LIBSTDCPP
