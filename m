From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 09:20:26 +0200
Subject: [Buildroot] [git commit] package/libbdplus: add missing
	libgpg-error arch dependency
Message-ID: <20160705072049.8A4CF81A0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b4ed7a7f9f11d3bb180045b2d907f30edb8280e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Romain Naour for finding the culprit package.

Fixes:

  http://autobuild.buildroot.org/results/d06e3eb9ef48540b71fbec267c534523632b224f/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Romain Naour <romain.naour@gmail.com>
[Thomas: fix Config.in comment dependencies.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbdplus/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libbdplus/Config.in b/package/libbdplus/Config.in
index df5ea27..2d314d1 100644
--- a/package/libbdplus/Config.in
+++ b/package/libbdplus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBBDPLUS
 	bool "libbdplus"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGCRYPT
@@ -15,4 +16,5 @@ config BR2_PACKAGE_LIBBDPLUS
 	  http://www.videolan.org/developers/libbdplus.html
 
 comment "libbdplus needs a toolchain w/ threads, dynamic library"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
