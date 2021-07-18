From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:14:38 +0200
Subject: [Buildroot] [git commit] package/gqrx: fix comment dependency in
 Config.in
Message-ID: <20210718204101.3004E8354A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=d9512b08a4812c695f31c6f4925f4d78dca6ba68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

comment message for gqrx is always displayed. This is due to an invert
dependency: GQRX depends on !BR2_STATIC_LIBS so comment must depends
on BR2_STATIC_LIBS.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gqrx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index af4d69381e..60942c36c8 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -3,7 +3,7 @@ comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || !BR2_STATIC_LIBS
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 comment "gqrx needs qt5"
 	depends on !BR2_PACKAGE_QT5
