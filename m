From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:29:50 +0200
Subject: [Buildroot] [PATCH 11/24 v5] msgpack: add dependency on atomic
	operations
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <6a278d5abd2ef0336b0b5d289d8dc9c3370facf3.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Anton Kolesov <anton.kolesov@synopsys.com>

This fixes:
http://autobuild.buildroot.net/results/44849a386cefb8899f4560296bfbbd8ea19ee910/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
[yann.morin.1998 at free.fr: use the new symbol; remove comment strings]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/msgpack/Config.in        | 4 ++--
 package/python-msgpack/Config.in | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
index b380c58..a57a378 100644
--- a/package/msgpack/Config.in
+++ b/package/msgpack/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MSGPACK
 	bool "msgpack"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc # atomic builtins
+	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  MessagePack is an efficient binary serialization format.
 
@@ -11,5 +11,5 @@ config BR2_PACKAGE_MSGPACK
 	  http://msgpack.org/
 
 comment "msgpack needs a toolchain w/ C++"
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc
diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index c4b68a3..ed0b432 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_MSGPACK
 	depends on BR2_INSTALL_LIBSTDCPP # msgpack
-	depends on !BR2_arc # msgpack - atomic builtins
+	depends on BR2_ARCH_HAS_ATOMICS # msgpack
 	help
 	  MessagePack (http://msgpack.org/) is a fast, compact binary
 	  serialization format, suitable for similar data to JSON.
@@ -13,6 +13,6 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 	  https://pypi.python.org/pypi/msgpack-python/
 
 comment "python-msgpack needs a toolchain w/ C++"
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc
-- 
1.9.1
