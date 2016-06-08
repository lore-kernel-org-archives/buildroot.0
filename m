From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Jun 2016 23:40:54 +0200
Subject: [Buildroot] [PATCH 1/6] Replace (e)glibc by glibc
Message-ID: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the removal of eglibc support, this commit replaces all
occurences of "(e)glibc" by just "glibc". Most of the occurences are in
package Config.in comments.

In addition, when the form "an (e)glibc ..." was used, it is replaced by
"a glibc ...".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt        | 2 +-
 package/apitrace/Config.in                       | 2 +-
 package/armadillo/Config.in                      | 2 +-
 package/audit/Config.in                          | 2 +-
 package/avrdude/Config.in                        | 2 +-
 package/blktrace/Config.in                       | 2 +-
 package/canfestival/Config.in                    | 2 +-
 package/clapack/Config.in                        | 2 +-
 package/dbus-cpp/Config.in                       | 2 +-
 package/directfb/Config.in                       | 2 +-
 package/dt/Config.in                             | 2 +-
 package/e2fsprogs/Config.in                      | 2 +-
 package/elfutils/Config.in                       | 2 +-
 package/exim/exim.mk                             | 2 +-
 package/freescale-imx/gpu-amd-bin-mx51/Config.in | 2 +-
 package/freescale-imx/imx-gpu-viv/Config.in      | 2 +-
 package/freescale-imx/libz160/Config.in          | 2 +-
 package/gcc/gcc-final/gcc-final.mk               | 2 +-
 package/glibc/glibc.mk                           | 2 +-
 package/gmrender-resurrect/Config.in             | 2 +-
 package/google-breakpad/Config.in                | 2 +-
 package/gstreamer/gst-fsl-plugins/Config.in      | 2 +-
 package/gstreamer/gst-plugin-x170/Config.in      | 2 +-
 package/guile/Config.in                          | 2 +-
 package/ifupdown/Config.in                       | 2 +-
 package/kexec-lite/Config.in                     | 2 +-
 package/kodi/Config.in                           | 4 ++--
 package/kvmtool/Config.in                        | 4 ++--
 package/libbsd/Config.in                         | 2 +-
 package/libcgroup/Config.in                      | 2 +-
 package/libfslcodec/Config.in                    | 2 +-
 package/libnet/Config.in                         | 2 +-
 package/librtas/Config.in                        | 2 +-
 package/libsigsegv/Config.in                     | 2 +-
 package/libump/Config.in                         | 2 +-
 package/linux-pam/Config.in                      | 2 +-
 package/liquid-dsp/Config.in                     | 2 +-
 package/lirc-tools/Config.in                     | 2 +-
 package/ltrace/Config.in                         | 2 +-
 package/mali-t76x/Config.in                      | 2 +-
 package/midori/Config.in                         | 2 +-
 package/mongodb/Config.in                        | 2 +-
 package/mpd/Config.in                            | 2 +-
 package/netcat-openbsd/Config.in                 | 2 +-
 package/netsniff-ng/Config.in                    | 2 +-
 package/network-manager/Config.in                | 2 +-
 package/nss-mdns/Config.in                       | 2 +-
 package/nss-pam-ldapd/Config.in                  | 2 +-
 package/nvidia-driver/Config.in                  | 2 +-
 package/nvidia-tegra23/Config.in                 | 2 +-
 package/on2-8170-libs/Config.in                  | 2 +-
 package/openvmtools/Config.in                    | 4 ++--
 package/powerpc-utils/Config.in                  | 2 +-
 package/python-pam/Config.in                     | 2 +-
 package/racehound/Config.in                      | 2 +-
 package/rpi-firmware/Config.in                   | 2 +-
 package/rsh-redone/Config.in                     | 4 ++--
 package/sunxi-cedarx/Config.in                   | 2 +-
 package/sunxi-mali/Config.in                     | 2 +-
 package/ti-gfx/Config.in                         | 2 +-
 package/unscd/Config.in                          | 2 +-
 package/util-linux/Config.in                     | 4 ++--
 package/webkitgtk/Config.in                      | 2 +-
 package/wf111/Config.in                          | 2 +-
 package/wine/Config.in                           | 2 +-
 package/wvdial/Config.in                         | 2 +-
 package/wvstreams/Config.in                      | 2 +-
 package/x11r7/xdriver_xf86-video-imx/Config.in   | 2 +-
 system/Config.in                                 | 6 +++---
 toolchain/toolchain-buildroot/Config.in          | 2 +-
 toolchain/toolchain-external/Config.in           | 4 ++--
 71 files changed, 79 insertions(+), 79 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 5537032..ee4a721 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -311,7 +311,7 @@ use in the comment.
 ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
    +BR2_TOOLCHAIN_USES_MUSL+, +BR2_TOOLCHAIN_USES_UCLIBC+
 ** Comment string: for the C library, a slightly different comment text
-   is used: +foo needs an (e)glibc toolchain+, or `foo needs an (e)glibc
+   is used: +foo needs a glibc toolchain+, or `foo needs a glibc
    toolchain w/ C++`
 
 * C++ support
diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
index a977712..7fdd35a 100644
--- a/package/apitrace/Config.in
+++ b/package/apitrace/Config.in
@@ -1,4 +1,4 @@
-comment "apitrace needs a (e)glibc toolchain w/ C++, gcc >= 4.6"
+comment "apitrace needs a glibc toolchain w/ C++, gcc >= 4.6"
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 18bf750..1f3f356 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -4,7 +4,7 @@ comment "armadillo needs a toolchain w/ C++"
 	depends on !BR2_powerpc
 	depends on !BR2_bfin
 
-comment "armadillo needs an (e)glibc toolchain w/ C++"
+comment "armadillo needs a glibc toolchain w/ C++"
 	depends on BR2_powerpc
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_UCLIBC
 
diff --git a/package/audit/Config.in b/package/audit/Config.in
index 717c364..df5a5cc 100644
--- a/package/audit/Config.in
+++ b/package/audit/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_AUDIT
 
 	  http://people.redhat.com/sgrubb/audit/
 
-comment "audit needs a uClibc or (e)glibc toolchain w/ threads, dynamic library"
+comment "audit needs a uClibc or glibc toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 460f155..d938c82 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_AVRDUDE
 
 	  https://github.com/kcuzner/avrdude
 
-comment "avrdude needs a uclibc or (e)glibc toolchain w/ threads, wchar, dynamic library"
+comment "avrdude needs a uclibc or glibc toolchain w/ threads, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
 	depends on !BR2_bfin
diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index ed5d78a..958f004 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_BLKTRACE
 
 	  http://git.kernel.dk/?p=blktrace.git;a=summary
 
-comment "blktrace needs a (e)glibc or musl toolchain"
+comment "blktrace needs a glibc or musl toolchain"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
index 4e73496..5522afe 100644
--- a/package/canfestival/Config.in
+++ b/package/canfestival/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
 	bool
 	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm
 
-comment "canfestival needs a (e)glibc or uClibc toolchain w/ threads and dynamic library"
+comment "canfestival needs a glibc or uClibc toolchain w/ threads and dynamic library"
 	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_MUSL || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index 2257524..ff7f8a7 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -1,4 +1,4 @@
-comment "clapack needs an (e)glibc toolchain"
+comment "clapack needs a glibc toolchain"
 	depends on BR2_powerpc
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
diff --git a/package/dbus-cpp/Config.in b/package/dbus-cpp/Config.in
index 8e9ed66..e90b211 100644
--- a/package/dbus-cpp/Config.in
+++ b/package/dbus-cpp/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_DBUS_CPP
 
 	  http://sourceforge.net/projects/dbus-cplusplus/
 
-comment "dbus-c++ needs a uClibc or (e)glibc toolchain w/ C++, threads"
+comment "dbus-c++ needs a uClibc or glibc toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_DBUS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 2aed63f..f0bcaaa 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -161,7 +161,7 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 
 endif # BR2_PACKAGE_DIRECTFB
 
-comment "directfb needs a (e)glibc or uClibc toolchain w/ C++, threads, gcc >= 4.5"
+comment "directfb needs a glibc or uClibc toolchain w/ C++, threads, gcc >= 4.5"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/dt/Config.in b/package/dt/Config.in
index 848e251..eed5b5e 100644
--- a/package/dt/Config.in
+++ b/package/dt/Config.in
@@ -1,4 +1,4 @@
-comment "dt needs a (e)glibc or uclibc toolchain w/ threads"
+comment "dt needs a glibc or uclibc toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
 
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index cf43dbc..4db11e1 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -51,7 +51,7 @@ config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	depends on !BR2_nios2 # fallocate not implemented
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
 
-comment "e4defrag needs an (e)glibc or musl toolchain"
+comment "e4defrag needs a glibc or musl toolchain"
 	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_E2FSPROGS_FILEFRAG
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index ca93770..9a1252b 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,4 +1,4 @@
-comment "elfutils needs a uClibc or (e)glibc toolchain w/ wchar, dynamic library"
+comment "elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library"
 	depends on !BR2_bfin
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 2cc706c..ed7d169 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -72,7 +72,7 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
 endef
 endif
 
-# only (e)glibc provides libnsl, remove -lnsl for all other toolchains
+# only glibc provides libnsl, remove -lnsl for all other toolchains
 # http://bugs.exim.org/show_bug.cgi?id=1564
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
diff --git a/package/freescale-imx/gpu-amd-bin-mx51/Config.in b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
index 0ef9682..337713c 100644
--- a/package/freescale-imx/gpu-amd-bin-mx51/Config.in
+++ b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
@@ -1,4 +1,4 @@
-comment "gpu-amd-bin-mx51 needs an (e)glibc EABI toolchain w/ C++"
+comment "gpu-amd-bin-mx51 needs a glibc EABI toolchain w/ C++"
 	depends on BR2_arm
 	depends on !BR2_ARM_EABI || !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 20759b1..91a547a 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -1,4 +1,4 @@
-comment "imx-gpu-viv needs an (e)glibc toolchain"
+comment "imx-gpu-viv needs a glibc toolchain"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
diff --git a/package/freescale-imx/libz160/Config.in b/package/freescale-imx/libz160/Config.in
index cfbfb79..012efb9 100644
--- a/package/freescale-imx/libz160/Config.in
+++ b/package/freescale-imx/libz160/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_LIBZ160
 	  An API for user space programs to perform 2D accelerated graphics
 	  operations on AMD GPU (included for examples in iMX5x chipsets)
 
-comment "libz160 needs an EABI toolchain w/ (e)glibc"
+comment "libz160 needs an EABI toolchain w/ glibc"
 	depends on !BR2_ARM_EABI || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 1d1d72e..721f4c8 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -113,7 +113,7 @@ HOST_GCC_FINAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
 # -cc symlink to the wrapper is not created.
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
-# In gcc 4.7.x, the ARM EABIhf library loader path for (e)glibc was not
+# In gcc 4.7.x, the ARM EABIhf library loader path for glibc was not
 # correct, so we create a symbolic link to make things work
 # properly. eglibc installs the library loader as ld-linux-armhf.so.3,
 # but gcc creates binaries that reference ld-linux.so.3.
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index db9b46b..7adfa94 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -15,7 +15,7 @@ GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICEN
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-# Before (e)glibc is configured, we must have the first stage
+# Before glibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
 GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-gawk
 
diff --git a/package/gmrender-resurrect/Config.in b/package/gmrender-resurrect/Config.in
index 1a46225..631c407 100644
--- a/package/gmrender-resurrect/Config.in
+++ b/package/gmrender-resurrect/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_GMRENDER_RESURRECT
 
 	  https://github.com/hzeller/gmrender-resurrect
 
-comment "gmrender-resurrect needs an (e)glibc or uClibc toolchain w/ wchar, threads"
+comment "gmrender-resurrect needs a glibc or uClibc toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index a95bf63..7b8eeb1 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -29,6 +29,6 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 
 	  http://code.google.com/p/google-breakpad/
 
-comment "google-breakpad requires an (e)glibc toolchain w/ C++ enabled"
+comment "google-breakpad requires a glibc toolchain w/ C++ enabled"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index 0407dc5..da71801 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -1,7 +1,7 @@
 comment "gst-fsl-plugins needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm && !BR2_LINUX_KERNEL
 
-comment "gst-fsl-plugins needs an (e)glibc toolchain"
+comment "gst-fsl-plugins needs a glibc toolchain"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
diff --git a/package/gstreamer/gst-plugin-x170/Config.in b/package/gstreamer/gst-plugin-x170/Config.in
index 09b44be..3003670 100644
--- a/package/gstreamer/gst-plugin-x170/Config.in
+++ b/package/gstreamer/gst-plugin-x170/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_GST_PLUGIN_X170
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
 
-comment "gst-plugin-x170 needs an (e)glibc toolchain and a Linux kernel to be built"
+comment "gst-plugin-x170 needs a glibc toolchain and a Linux kernel to be built"
 	depends on BR2_arm926t
 	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/guile/Config.in b/package/guile/Config.in
index b3f744e..e0f6571 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_GUILE
 
 	  http://www.gnu.org/software/guile
 
-comment "guile needs a uClibc or (e)glibc toolchain w/ threads, wchar, dynamic library"
+comment "guile needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
diff --git a/package/ifupdown/Config.in b/package/ifupdown/Config.in
index 1e11e4e..ab47606 100644
--- a/package/ifupdown/Config.in
+++ b/package/ifupdown/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_IFUPDOWN
 
 	  https://tracker.debian.org/pkg/ifupdown
 
-comment "ifupdown needs an (e)glibc or musl toolchain w/ headers >= 3.0"
+comment "ifupdown needs a glibc or musl toolchain w/ headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index fcc0d88..97748dc 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_KEXEC_LITE
 	  This package is a tiny implementation of the kexec userspace
 	  components, for devicetree-based platforms.
 
-comment "kexec-lite needs a uClibc or (e)glibc toolchain w/ wchar, dynamic library"
+comment "kexec-lite needs a uClibc or glibc toolchain w/ wchar, dynamic library"
 	depends on BR2_powerpc || BR2_powerpc64
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a44ef5a..01445a2 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
 
-comment "kodi needs a uClibc or (e)glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7, host gcc >= 4.6"
+comment "kodi needs a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7, host gcc >= 4.6"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
@@ -187,7 +187,7 @@ config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	  Enable Shairport support.
 	  Select this if you want to stream content from an Apple device.
 
-comment "samba support needs a (e)glibc or uClibc toolchain w/ RPC"
+comment "samba support needs a glibc or uClibc toolchain w/ RPC"
 	depends on (!BR2_TOOLCHAIN_USES_GLIBC && \
 		!BR2_TOOLCHAIN_USES_UCLIBC) || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 
diff --git a/package/kvmtool/Config.in b/package/kvmtool/Config.in
index f047c75..d2290c5 100644
--- a/package/kvmtool/Config.in
+++ b/package/kvmtool/Config.in
@@ -19,12 +19,12 @@ config BR2_PACKAGE_KVMTOOL
 
 	  https://git.kernel.org/cgit/linux/kernel/git/will/kvmtool.git/tree/README
 
-comment "kvmtool needs a (e)glibc or musl toolchain"
+comment "kvmtool needs a glibc or musl toolchain"
 	depends on BR2_USE_MMU
 	depends on BR2_i386 || BR2_mips || BR2_x86_64
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
-comment "kvmtool needs a (e)glibc or musl toolchain w/ dynamic library"
+comment "kvmtool needs a glibc or musl toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index dd2c19c..9b5b898 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -17,6 +17,6 @@ config BR2_PACKAGE_LIBBSD
 
 	  http://libbsd.freedesktop.org/
 
-comment "libbsd needs an (e)glibc toolchain w/ threads"
+comment "libbsd needs a glibc toolchain w/ threads"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
index d02c282..03efa71 100644
--- a/package/libcgroup/Config.in
+++ b/package/libcgroup/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_LIBCGROUP_TOOLS
 
 endif
 
-comment "libcgroup needs an (e)glibc toolchain w/ C++"
+comment "libcgroup needs a glibc toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libfslcodec/Config.in b/package/libfslcodec/Config.in
index d2007fe..31e2def 100644
--- a/package/libfslcodec/Config.in
+++ b/package/libfslcodec/Config.in
@@ -8,6 +8,6 @@ config BR2_PACKAGE_LIBFSLCODEC
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
 
-comment "libfslcodec needs an (e)glibc toolchain"
+comment "libfslcodec needs a glibc toolchain"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libnet/Config.in b/package/libnet/Config.in
index 8a88128..0c5c230 100644
--- a/package/libnet/Config.in
+++ b/package/libnet/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_LIBNET
 
 	  http://sourceforge.net/projects/libnet-dev
 
-comment "libnet needs a (e)glibc or uClibc toolchain"
+comment "libnet needs a glibc or uClibc toolchain"
 	depends on BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/librtas/Config.in b/package/librtas/Config.in
index 2e6063f..fb0ac76 100644
--- a/package/librtas/Config.in
+++ b/package/librtas/Config.in
@@ -9,6 +9,6 @@ config BR2_PACKAGE_LIBRTAS
 
 	  http://librtas.sourceforge.net/
 
-comment "librtas needs an (e)glibc toolchain"
+comment "librtas needs a glibc toolchain"
 	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index e5224da..a420474 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LIBSIGSEGV
 
 	  http://libsigsegv.sourceforge.net/
 
-comment "libsigsegv needs an (e)glibc toolchain"
+comment "libsigsegv needs a glibc toolchain"
 	depends on (BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/libump/Config.in b/package/libump/Config.in
index 10232b3..696ccf3 100644
--- a/package/libump/Config.in
+++ b/package/libump/Config.in
@@ -8,6 +8,6 @@ config BR2_PACKAGE_LIBUMP
 
 	  http://github.com/linux-sunxi/libump
 
-comment "libump needs a (e)glibc toolchain"
+comment "libump needs a glibc toolchain"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index f5088b9..f6cf530 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -16,6 +16,6 @@ config BR2_PACKAGE_LINUX_PAM
 
 	  http://linux-pam.org
 
-comment "linux-pam needs a uClibc or (e)glibc toolchain w/ wchar, locale, dynamic library"
+comment "linux-pam needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
index a2cd21c..4b94eda 100644
--- a/package/liquid-dsp/Config.in
+++ b/package/liquid-dsp/Config.in
@@ -1,4 +1,4 @@
-comment "liquid-dsp requires a (e)glibc/musl toolchain w/ dynamic library"
+comment "liquid-dsp requires a glibc/musl toolchain w/ dynamic library"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LIQUID_DSP
diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
index 3dd202f..60476b7 100644
--- a/package/lirc-tools/Config.in
+++ b/package/lirc-tools/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_LIRC_TOOLS
 
 	  http://www.lirc.org/
 
-comment "lirc-tools needs a uClibc or (e)glibc toolchain w/ threads, dynamic library, C++"
+comment "lirc-tools needs a uClibc or glibc toolchain w/ threads, dynamic library, C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index ff4d7bd..8802860 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -18,6 +18,6 @@ config BR2_PACKAGE_LTRACE
 
 	  http://ltrace.org
 
-comment "ltrace needs a uclibc or (e)glibc toolchain w/ wchar, dynamic library"
+comment "ltrace needs a uclibc or glibc toolchain w/ wchar, dynamic library"
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/mali-t76x/Config.in b/package/mali-t76x/Config.in
index 6c2ae4e..26a7f6c 100644
--- a/package/mali-t76x/Config.in
+++ b/package/mali-t76x/Config.in
@@ -23,6 +23,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif
 
-comment "mali-t76x needs an (e)glibc toolchain with armhf enabled"
+comment "mali-t76x needs a glibc toolchain with armhf enabled"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 9751f33..ca8150f 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,4 +1,4 @@
-comment "midori needs libgtk3 and an (e)glibc toolchain w/ C++, gcc >= 4.9"
+comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 2f6876a..a78bb27 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_MONGODB
 
 	  https://www.mongodb.org/
 
-comment "mongodb needs a (e)glibc toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index dfc1812..2ea21fc 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -189,7 +189,7 @@ config BR2_PACKAGE_MPD_LIBNFS
 comment "nfs support needs a toolchain w/ threads support"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
-comment "samba support needs an (e)glibc toolchain w/ dynamic library, RPC"
+comment "samba support needs a glibc toolchain w/ dynamic library, RPC"
 	depends on !BR2_nios2
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
index 346561a..fec0ad5 100644
--- a/package/netcat-openbsd/Config.in
+++ b/package/netcat-openbsd/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_NETCAT_OPENBSD
 
 	  https://packages.debian.org/sid/netcat-openbsd
 
-comment "netcat-openbsd needs an (e)glibc toolchain w/ threads"
+comment "netcat-openbsd needs a glibc toolchain w/ threads"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
 ~
diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 5d2f5df..e52bb25 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_NETSNIFF_NG
 	  networking toolkit. If you will, the Swiss army knife for
 	  network packets.
 
-comment "netsniff-ng needs an (e)glibc toolchain w/ threads, headers >= 3.0"
+comment "netsniff-ng needs a glibc toolchain w/ threads, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 8b4607c..b234494 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -51,7 +51,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	  This option enables support for PPPD daemon
 endif
 
-comment "NetworkManager needs udev /dev management and a (e)glibc toolchain w/ headers >= 3.7"
+comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.7"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 || \
diff --git a/package/nss-mdns/Config.in b/package/nss-mdns/Config.in
index 0192cc2..ad69e2a 100644
--- a/package/nss-mdns/Config.in
+++ b/package/nss-mdns/Config.in
@@ -14,6 +14,6 @@ config BR2_PACKAGE_NSS_MDNS
 
 	  http://0pointer.de/lennart/projects/nss-mdns/
 
-comment "nss-mdns needs an (e)glibc toolchain"
+comment "nss-mdns needs a glibc toolchain"
 	depends on BR2_USE_MMU && BR2_PACKAGE_AVAHI_DAEMON
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/nss-pam-ldapd/Config.in b/package/nss-pam-ldapd/Config.in
index da6d331..233f213 100644
--- a/package/nss-pam-ldapd/Config.in
+++ b/package/nss-pam-ldapd/Config.in
@@ -21,5 +21,5 @@ config BR2_PACKAGE_NSS_PAM_LDAPD_UTILITIES
 
 endif
 
-comment "nss-pam-ldapd needs an (e)glibc toolchain"
+comment "nss-pam-ldapd needs a glibc toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index 30763c5..04499f6 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -1,4 +1,4 @@
-comment "nvidia-driver needs an (e)glibc toolchain"
+comment "nvidia-driver needs a glibc toolchain"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
diff --git a/package/nvidia-tegra23/Config.in b/package/nvidia-tegra23/Config.in
index eb33581..9c9fd19 100644
--- a/package/nvidia-tegra23/Config.in
+++ b/package/nvidia-tegra23/Config.in
@@ -32,7 +32,7 @@ source "package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in"
 source "package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in"
 endif
 
-comment "nvidia-tegra23 needs Xorg <= 1.14 and a (e)glibc toolchain w/ EABIhf"
+comment "nvidia-tegra23 needs Xorg <= 1.14 and a glibc toolchain w/ EABIhf"
 	depends on BR2_cortex_a9
 	depends on !BR2_ARM_EABIHF || !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
diff --git a/package/on2-8170-libs/Config.in b/package/on2-8170-libs/Config.in
index 36f0b5c..40cad3d 100644
--- a/package/on2-8170-libs/Config.in
+++ b/package/on2-8170-libs/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_ON2_8170_LIBS
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
 
-comment "on2-8170-libs needs an (e)glibc toolchain and a Linux kernel to be built"
+comment "on2-8170-libs needs a glibc toolchain and a Linux kernel to be built"
 	depends on BR2_arm926t
 	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 64bf65c..79c503c 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -41,12 +41,12 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
 	help
 	  Support for PAM in openvmtools
 
-comment "PAM support needs an (e)glibc toolchain w/ dynamic library"
+comment "PAM support needs a glibc toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
 endif
 
-comment "openvmtools needs an (e)glibc or musl toolchain w/ wchar, threads, RPC, locale"
+comment "openvmtools needs a glibc or musl toolchain w/ wchar, threads, RPC, locale"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index 4037c55..fb2fb7f 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -28,7 +28,7 @@ config BR2_PACKAGE_POWERPC_UTILS_RTAS
 	  lsslot, activate_firmware, rtas_ibm_get_vpd, serv_config,
 	  rtas_event_decode, sys_ident.
 
-comment "RTAS support needs an (e)glibc toolchain"
+comment "RTAS support needs a glibc toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 endif
diff --git a/package/python-pam/Config.in b/package/python-pam/Config.in
index b23a8e0..497bcd3 100644
--- a/package/python-pam/Config.in
+++ b/package/python-pam/Config.in
@@ -1,4 +1,4 @@
-comment "python-pam needs a uClibc or (e)glibc toolchain w/ wchar, locale, dynamic library"
+comment "python-pam needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index 6f62f81..2d1ccb8 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -29,7 +29,7 @@ comment "racehound needs an Linux kernel >= 3.14 to be built"
 	depends on !BR2_LINUX_KERNEL
 	depends on BR2_i386 || BR2_x86_64
 
-comment "racehound needs a uClibc or (e)glibc toolchain w/ C++, wchar, dynamic library"
+comment "racehound needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 405674f..c2983aa 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -73,7 +73,7 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
 	help
 	  Install vcdbg, to help debug communication with the GPU.
 
-comment "vcdbg needs an (e)glibc toolchain w/ C++"
+comment "vcdbg needs a glibc toolchain w/ C++"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
 
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index 316ff7a..6258369 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_RSH_REDONE_RLOGIND
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
-comment "rlogind needs a uClibc or (e)glibc toolchain w/ wchar, locale, dynamic library"
+comment "rlogind needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
@@ -33,7 +33,7 @@ config BR2_PACKAGE_RSH_REDONE_RSHD
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
-comment "rshd needs a uClibc or (e)glibc toolchain w/ wchar, locale, dynamic library"
+comment "rshd needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
diff --git a/package/sunxi-cedarx/Config.in b/package/sunxi-cedarx/Config.in
index fc6e529..43fcce5 100644
--- a/package/sunxi-cedarx/Config.in
+++ b/package/sunxi-cedarx/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_SUNXI_CEDARX
 	  http://github.com/linux-sunxi/cedarx-libs
 	  http://linux-sunxi.org/CedarX
 
-comment "sunxi-cedarx needs an (e)glibc toolchain"
+comment "sunxi-cedarx needs a glibc toolchain"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index f0c1b35..b151135 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -64,6 +64,6 @@ endchoice
 
 endif
 
-comment "sunxi-mali needs an (e)glibc toolchain"
+comment "sunxi-mali needs a glibc toolchain"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 1481534..39b0a93 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -72,6 +72,6 @@ endchoice
 
 endif
 
-comment "ti-gfx needs an (e)glibc toolchain and a Linux kernel to be built"
+comment "ti-gfx needs a glibc toolchain and a Linux kernel to be built"
 	depends on BR2_arm
 	depends on !(BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/unscd/Config.in b/package/unscd/Config.in
index e979c30..23cc5a4 100644
--- a/package/unscd/Config.in
+++ b/package/unscd/Config.in
@@ -21,5 +21,5 @@ config BR2_PACKAGE_UNSCD
 
 	  http://busybox.net/~vda/unscd
 
-comment "unscd needs an (e)glibc toolchain"
+comment "unscd needs a glibc toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 8a36c0a..429dfa7 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -67,7 +67,7 @@ config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	help
 	  Change login shell, real user name and information
 
-comment "chfn/chsh needs a uClibc or (e)glibc toolchain w/ wchar, locale, dynamic library"
+comment "chfn/chsh needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
@@ -131,7 +131,7 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	help
 	  Build login utilities (last, login, su, sulogin)
 
-comment "login utilities needs a uClibc or (e)glibc toolchain w/ wchar, locale, dynamic library"
+comment "login utilities needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index e662fed..25f6fad 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
-comment "webkitgtk needs libgtk3 and an (e)glibc toolchain w/ C++, gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
diff --git a/package/wf111/Config.in b/package/wf111/Config.in
index d2ba440..cfce8b4 100644
--- a/package/wf111/Config.in
+++ b/package/wf111/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_WF111_TARBALL_PATH
 
 endif
 
-comment "wf111 needs an (e)glibc toolchain"
+comment "wf111 needs a glibc toolchain"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/wine/Config.in b/package/wine/Config.in
index d1510e1..c674288 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_WINE
 
 	  http://www.winehq.org
 
-comment "wine needs a (e)glibc toolchain"
+comment "wine needs a glibc toolchain"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_i386
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
index d545870..03730f3 100644
--- a/package/wvdial/Config.in
+++ b/package/wvdial/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_WVDIAL
 
 	  http://wvdial.googlecode.com/
 
-comment "wvdial needs a (e)glibc or uClibc toolchain w/ C++, dynamic library"
+comment "wvdial needs a glibc or uClibc toolchain w/ C++, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
index e2edd6d..3d2d8f4 100644
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -12,6 +12,6 @@ config BR2_PACKAGE_WVSTREAMS
 
 	  http://wvstreams.googlecode.com/
 
-comment "wvstreams needs a (e)glibc or uClibc toolchain w/ C++, dynamic library"
+comment "wvstreams needs a glibc or uClibc toolchain w/ C++, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/x11r7/xdriver_xf86-video-imx/Config.in b/package/x11r7/xdriver_xf86-video-imx/Config.in
index bb98e5a..398d49e 100644
--- a/package/x11r7/xdriver_xf86-video-imx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-imx/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX
 	    Option "fbdev" "/dev/fb0"
 	  EndSection
 
-comment "xf86-video-imx needs an EABI toolchain w/ (e)glibc"
+comment "xf86-video-imx needs an EABI toolchain w/ glibc"
 	depends on BR2_arm
 	depends on !BR2_ARM_EABI || !BR2_TOOLCHAIN_USES_GLIBC
 
diff --git a/system/Config.in b/system/Config.in
index 9441467..5a90b11 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -95,7 +95,7 @@ config BR2_INIT_SYSTEMD
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 
-comment "systemd needs (e)glibc toolchain, headers >= 3.10"
+comment "systemd needs glibc toolchain, headers >= 3.10"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
 		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
 
@@ -375,7 +375,7 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox"
 
 config BR2_TARGET_TZ_INFO
 	bool "Install timezone info"
-	# No timezone for musl; only for uClibc or (e)glibc.
+	# No timezone for musl; only for uClibc or glibc.
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_TZDATA if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_TZ if BR2_TOOLCHAIN_USES_UCLIBC
@@ -391,7 +391,7 @@ config BR2_TARGET_TZ_ZONELIST
 	  Space-separated list of time zones to compile.
 
 	  The value "default" includes all commonly used time zones. Note
-	  that this set consumes around 5.5M for (e)glibc and 2.1M for uClibc.
+	  that this set consumes around 5.5M for glibc and 2.1M for uClibc.
 
 	  The full list is the list of files in the time zone database source,
 	  not including the build and .tab files.
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 43c07b2..0b97bbf 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -62,7 +62,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 	  http://www.gnu.org/software/libc/
 
-comment "(e)glibc only available with shared lib support"
+comment "glibc only available with shared lib support"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 7aee57f..552536e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,7 +3,7 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
-comment "(e)glibc toolchains only available with shared lib support"
+comment "glibc toolchains only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
 comment "Linaro toolchains available for Cortex-A + EABIhf"
@@ -926,7 +926,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	  toolchain with eglibc configured to exclude key features may
 	  cause build failures to some packages.
 
-comment "(e)glibc only available with shared lib support"
+comment "glibc only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
-- 
2.7.4
