From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:06:23 +0200
Subject: [Buildroot] [git commit] package/freerdp: needs threads
Message-ID: <20150404130646.89D44818CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c80d73251a0eb473f9d9f09ce923a0a50ed8436
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/0b7/0b71e37b8891b3b8810d1e74445177a1099b59f3/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 445bc2d..2e879b4 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FREERDP
 	bool "freerdp"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -40,5 +41,6 @@ comment "freerdp server and client need X.Org"
 
 endif
 
-comment "freerdp needs a toolchain w/ wchar, dynamic library"
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+comment "freerdp needs a toolchain w/ wchar, dynamic library, threads"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
