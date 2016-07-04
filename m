From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:28 +0200
Subject: [Buildroot] [PATCH 17/83 v2] package/python: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <d465b824411c1b69f05d09455073a550220803b3.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
2.7.4
