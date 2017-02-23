From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 21:42:34 +0100
Subject: [Buildroot] [git commit] poco: doesn't support openrisc
Message-ID: <20170223204438.9C08C81DDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=739cfe7a089138992681d4c6d7c5c535e8b99ea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/5b3/5b3fd6d4a7bdefadba89fdb53de4ba786f4df9e2/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poco/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index dfdc8d1..b3b247f 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_POCO
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
-		|| BR2_xtensa)
+		|| BR2_or1k || BR2_xtensa)
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	help
@@ -65,4 +65,4 @@ comment "poco needs a toolchain w/ wchar, threads, C++, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
-		|| BR2_xtensa)
+		|| BR2_or1k || BR2_xtensa)
