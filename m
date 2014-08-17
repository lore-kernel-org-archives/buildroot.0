From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:29:49 +0200
Subject: [Buildroot] [PATCH 10/24 v5] libftdi: add dependency on atomic
	operations
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <493b54d3b59e46248dd9593efc9d5431f53fc429.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Anton Kolesov <anton.kolesov@synopsys.com>

This fixes:
http://autobuild.buildroot.net/results/6cb25ed954840109c9d0e582e922b0ba9d07e174/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
[yann.morin.1998 at free.fr: use the new symbol; remove comment strings]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libftdi/Config.in | 2 ++
 package/openocd/Config.in | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index dc81514..76b30b1 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBFTDI
 	bool "libftdi"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -19,4 +20,5 @@ config BR2_PACKAGE_LIBTFDI_CPP
 endif # BR2_PACKAGE_LIBFTDI
 
 comment "libftdi needs a toolchain w/ threads"
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 7f96ef8..9440c65 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -14,6 +14,7 @@ comment "Adapters"
 
 config BR2_PACKAGE_OPENOCD_FT2XXX
 	bool "FT2xxx/FT4xxx Based JTAG Programmer"
+	depends on BR2_ARCH_HAS_ATOMICS # libftdi
 	select BR2_PACKAGE_LIBFTDI
 	help
 	  Enable building support for FT2232 based devices
-- 
1.9.1
