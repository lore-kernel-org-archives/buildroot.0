From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:12 +0100
Subject: [Buildroot] [PATCH 20/80 v1] package/python3: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <d11edd2dca9e27915c903a31c7b2cfe4b49c740b.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python3/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 0f4fc88..aadc8b6 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -2,7 +2,7 @@ comment "python3 needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
-config BR2_PACKAGE_PYTHON3
+menuconfig BR2_PACKAGE_PYTHON3
 	bool "python3"
 	depends on !BR2_PACKAGE_PYTHON
 	depends on BR2_USE_WCHAR
@@ -35,7 +35,7 @@ config BR2_PACKAGE_PYTHON3_PY_PYC
 
 endchoice
 
-menu "core python3 modules"
+comment "core python3 modules"
 
 comment "The following modules are unusual or require extra libraries"
 
@@ -104,6 +104,4 @@ config BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  zlib support in Python3
 
-endmenu
-
 endif
-- 
1.9.1
