From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:00:17 +0200
Subject: [Buildroot] [git commit] libftdi: add dependency on atomic
	operations
Message-ID: <20140818090640.2F1689D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=669ce8c75eb4c76cef81f279fb6b4f95d1472f51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes:
http://autobuild.buildroot.net/results/6cb25ed954840109c9d0e582e922b0ba9d07e174/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
[yann.morin.1998 at free.fr: use the new symbol; remove comment strings]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libftdi/Config.in |    2 ++
 package/openocd/Config.in |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

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
