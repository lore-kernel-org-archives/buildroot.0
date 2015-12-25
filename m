From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:54 +0100
Subject: [Buildroot] [PATCH 25/84 RFC] package/python: use 'menuconfig'
	instad of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <737adfb10ab1fc81727d91db2275cc4cd8f4e505.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/python/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index fa83e77..40a2ef4 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -2,7 +2,7 @@ comment "python needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
-config BR2_PACKAGE_PYTHON
+menuconfig BR2_PACKAGE_PYTHON
 	bool "python"
 	depends on BR2_USE_WCHAR
 	# uses fork()
@@ -34,7 +34,7 @@ config BR2_PACKAGE_PYTHON_PY_PYC
 
 endchoice
 
-menu "core python modules"
+comment "core python modules"
 
 comment "The following modules are unusual or require extra libraries"
 
@@ -127,6 +127,4 @@ config BR2_PACKAGE_PYTHON_HASHLIB
 	help
 	  hashlib support in Python
 
-endmenu
-
 endif
-- 
1.9.1
