From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:18:05 -0400
Subject: [Buildroot] [PATCH v2 19/25] fix ordering on configs starting with
	's'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-19-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter s in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter s.
  
 package/s6-dns/Config.in               | 2 +-
 package/s6-linux-init/Config.in        | 2 +-
 package/s6-linux-utils/Config.in       | 2 +-
 package/s6-networking/Config.in        | 2 +-
 package/s6-portable-utils/Config.in    | 2 +-
 package/s6-rc/Config.in                | 2 +-
 package/s6/Config.in                   | 2 +-
 package/sepolgen/Config.in             | 2 +-
 package/setools/Config.in              | 8 ++++----
 package/sigrok-cli/Config.in           | 2 +-
 package/sispmctl/Config.in             | 4 ++--
 package/softether/Config.in            | 6 +++---
 package/speex/Config.in                | 2 +-
 package/sshfs/Config.in                | 8 ++++----
 package/startup-notification/Config.in | 2 +-
 package/stella/Config.in               | 6 +++---
 package/strongswan/Config.in           | 4 ++--
 package/subversion/Config.in           | 4 ++--
 package/sunxi-mali/Config.in           | 2 +-
 package/syslog-ng/Config.in            | 8 ++++----
 package/sysprof/Config.in              | 2 +-
 package/sysstat/Config.in              | 3 +--
 22 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/package/s6-dns/Config.in b/package/s6-dns/Config.in
index 75917f9..e982fda 100644
--- a/package/s6-dns/Config.in
+++ b/package/s6-dns/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_S6_DNS
 	bool "s6-dns"
-	select BR2_PACKAGE_SKALIBS
 	depends on BR2_USE_MMU # skalibs
+	select BR2_PACKAGE_SKALIBS
 	help
 	  s6-dns is a suite of DNS client programs and libraries for
 	  Unix systems, as an alternative to the BIND, djbdns or other
diff --git a/package/s6-linux-init/Config.in b/package/s6-linux-init/Config.in
index d930e2f..b56b861 100644
--- a/package/s6-linux-init/Config.in
+++ b/package/s6-linux-init/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_S6_LINUX_INIT
 	bool "s6-linux-init"
+	depends on BR2_USE_MMU # s6
 	select BR2_PACKAGE_S6
 	select BR2_PACKAGE_S6_LINUX_UTILS
 	select BR2_PACKAGE_S6_PORTABLE_UTILS
-	depends on BR2_USE_MMU # s6
 	help
 	  s6-linux-init is a set of minimalistic tools to create a
 	  s6-based init system, including a /sbin/init binary, on a
diff --git a/package/s6-linux-utils/Config.in b/package/s6-linux-utils/Config.in
index 14af3cf..43e6bb9 100644
--- a/package/s6-linux-utils/Config.in
+++ b/package/s6-linux-utils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_S6_LINUX_UTILS
 	bool "s6-linux-utils"
-	select BR2_PACKAGE_SKALIBS
 	depends on BR2_USE_MMU # skalibs
+	select BR2_PACKAGE_SKALIBS
 	help
 	  s6-linux-utils is a set of minimalistic Linux-specific
 	  system utilities.
diff --git a/package/s6-networking/Config.in b/package/s6-networking/Config.in
index ebb77a7..bdf5847 100644
--- a/package/s6-networking/Config.in
+++ b/package/s6-networking/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_S6_NETWORKING
 	bool "s6-networking"
+	depends on BR2_USE_MMU # s6
 	select BR2_PACKAGE_S6_DNS
 	select BR2_PACKAGE_S6
-	depends on BR2_USE_MMU # s6
 	help
 	  s6-networking is a suite of small networking utilities for
 	  Unix systems. It includes command-line client and server
diff --git a/package/s6-portable-utils/Config.in b/package/s6-portable-utils/Config.in
index 86ebc4c..8521ecf 100644
--- a/package/s6-portable-utils/Config.in
+++ b/package/s6-portable-utils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_S6_PORTABLE_UTILS
 	bool "s6-portable-utils"
-	select BR2_PACKAGE_SKALIBS
 	depends on BR2_USE_MMU # skalibs
+	select BR2_PACKAGE_SKALIBS
 	help
 	  s6-portable-utils is a set of tiny general Unix utilities,
 	  often performing well-known tasks such as cut and grep, but
diff --git a/package/s6-rc/Config.in b/package/s6-rc/Config.in
index d2ec75e..39a924e 100644
--- a/package/s6-rc/Config.in
+++ b/package/s6-rc/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_S6_RC
 	bool "s6-rc"
-	select BR2_PACKAGE_S6
 	depends on BR2_USE_MMU # s6
+	select BR2_PACKAGE_S6
 	help
 	  s6-rc is a service manager for s6-based systems, i.e. a
 	  suite of programs that can start and stop services, both
diff --git a/package/s6/Config.in b/package/s6/Config.in
index 7c192c1..043380f 100644
--- a/package/s6/Config.in
+++ b/package/s6/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_S6
 	bool "s6"
-	select BR2_PACKAGE_EXECLINE
 	depends on BR2_USE_MMU # execline
+	select BR2_PACKAGE_EXECLINE
 	help
 	  s6 is a small suite of programs for UNIX, designed to allow
 	  process supervision (a.k.a service supervision), in the line
diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
index 3671816..8dd9038 100644
--- a/package/sepolgen/Config.in
+++ b/package/sepolgen/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SEPOLGEN
 	bool "sepolgen"
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	depends on BR2_USE_WCHAR # python3
 	depends on BR2_USE_MMU # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
 	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	help
 	  This package contains a Python module that forms the core of
 	  the modern audit2allow (which is a part of the package
diff --git a/package/setools/Config.in b/package/setools/Config.in
index 5e7f39d..d7b119f 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_SETOOLS
 	bool "setools"
-	select BR2_PACKAGE_LIBSELINUX
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_BZIP2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -14,6 +10,10 @@ config BR2_PACKAGE_SETOOLS
 	# section for versioned symbol"
 	# arc: libselinux not available
 	depends on !BR2_nios2 && !BR2_bfin && !BR2_arc
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_BZIP2
 	help
 	  SETools is an open source project designed to facilitate
 	  SELinux policy analysis. The primary tools are:
diff --git a/package/sigrok-cli/Config.in b/package/sigrok-cli/Config.in
index b8eb60d..2361665 100644
--- a/package/sigrok-cli/Config.in
+++ b/package/sigrok-cli/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_SIGROK_CLI
 	bool "sigrok-cli"
-	select BR2_PACKAGE_LIBSIGROK
 	# libsigrok->libglib2:
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	# libsigrok
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	select BR2_PACKAGE_LIBSIGROK
 	help
 	  Sigrok-cli is a command-line frontend for the sigrok
 	  software suite.
diff --git a/package/sispmctl/Config.in b/package/sispmctl/Config.in
index 976b08f..6066dc0 100644
--- a/package/sispmctl/Config.in
+++ b/package/sispmctl/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SISPMCTL
 	bool "sispmctl"
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  sispmctl is an application enabling the use of the GEMBIRD
 	  SiS-PM and mSiS(sispm) USB-controlled power-outlet device
diff --git a/package/softether/Config.in b/package/softether/Config.in
index 60f1357..55e5426 100644
--- a/package/softether/Config.in
+++ b/package/softether/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_SOFTETHER
 	bool "softether"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_READLINE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_READLINE
 	help
 	  The SoftEther Server is a fully integrated implementation of the SSTP,
 	  L2TP, L2TPv3, OpenVPN, and IPSec virtual private networking protocols
diff --git a/package/speex/Config.in b/package/speex/Config.in
index f18e866..c4e3df5 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -16,8 +16,8 @@ config BR2_PACKAGE_SPEEX_ARM4
 	depends on BR2_ARM_CPU_ARMV4
 
 config BR2_PACKAGE_SPEEX_ARM5E
-	default y
 	bool
+	default y
 	depends on BR2_arm && !BR2_PACKAGE_SPEEX_ARM4
 
 endif
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 31fef9f..54aa831 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_SSHFS
 	bool "sshfs (FUSE)"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
+	depends on BR2_USE_MMU # libfuse, glib2
+	depends on !BR2_STATIC_LIBS # libfuse
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSH
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
-	depends on BR2_USE_MMU # libfuse, glib2
-	depends on !BR2_STATIC_LIBS # libfuse
 	help
 	  FUSE filesystem client based on the SSH File Transfer Protocol.
 
diff --git a/package/startup-notification/Config.in b/package/startup-notification/Config.in
index 1fc6dad..24771ea 100644
--- a/package/startup-notification/Config.in
+++ b/package/startup-notification/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_STARTUP_NOTIFICATION
 	bool "startup-notification"
-	select BR2_PACKAGE_XLIB_LIBX11
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  Startup-notification is a library used to monitor application startup.
 
diff --git a/package/stella/Config.in b/package/stella/Config.in
index 55f177f..dd8e32a 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_STELLA
 	bool "stella"
-	select BR2_PACKAGE_SDL2
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_ZLIB
 	depends on !BR2_STATIC_LIBS # sdl2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
 	help
 	  Stella is a multi-platform Atari 2600 VCS emulator.
 
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 0a95ac0..5119706 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -120,12 +120,12 @@ config BR2_PACKAGE_STRONGSWAN_SCEP
 
 config BR2_PACKAGE_STRONGSWAN_SCRIPTS
 	bool "Enable additional utilities (found in scripts directory)"
-	depends on BR2_PACKAGE_STRONGSWAN_CHARON
 	default y
+	depends on BR2_PACKAGE_STRONGSWAN_CHARON
 
 config BR2_PACKAGE_STRONGSWAN_VICI
 	bool "Enable vici/swanctl"
-	depends on BR2_PACKAGE_STRONGSWAN_CHARON
 	default y
+	depends on BR2_PACKAGE_STRONGSWAN_CHARON
 
 endif
diff --git a/package/subversion/Config.in b/package/subversion/Config.in
index ffe424a..ecac518 100644
--- a/package/subversion/Config.in
+++ b/package/subversion/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SUBVERSION
 	bool "subversion"
-	select BR2_PACKAGE_APR
-	select BR2_PACKAGE_APR_UTIL
 	# apr really needs shared library support
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # apr
+	select BR2_PACKAGE_APR
+	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_SQLITE
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index c6754c2..71b1195 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -51,8 +51,8 @@ comment "r3p0 requires an EABIhf toolchain"
 	depends on !BR2_ARM_EABIHF
 
 config BR2_PACKAGE_SUNXI_MALI_R3P1
-	depends on BR2_ARM_EABIHF
 	bool "r3p1"
+	depends on BR2_ARM_EABIHF
 
 comment "r3p1 requires an EABIhf toolchain"
 	depends on !BR2_ARM_EABIHF
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index 7f47d86..fbc2362 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_SYSLOG_NG
 	bool "syslog-ng"
-	select BR2_PACKAGE_EVENTLOG
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_OPENSSL
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_EVENTLOG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_OPENSSL
 	help
 	  syslog-ng is an enhanced log daemon, supporting a wide range
 	  of input and output methods: syslog, unstructured text,
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index e1b0488..3913274 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_SYSPROF
 	bool "sysprof"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	# In its util.h file, sysprof contains architecture-specific
 	# code
 	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Sysprof is a statistical, system-wide profiler that can
 	  profile user and kernel code using the perf API.
diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
index c262799..923c48a 100644
--- a/package/sysstat/Config.in
+++ b/package/sysstat/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_SYSSTAT
 	bool "sysstat"
+	depends on BR2_USE_MMU 	# fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	# Uses fork()
-	depends on BR2_USE_MMU
 	help
 	  The sysstat utilities are a collection of performance
 	  monitoring tools for Linux. These include sar, sadf, mpstat,
-- 
2.9.3
