From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 21:12:10 +0200
Subject: [Buildroot] [git commit] package/c*/Config.in: fix ordering of
	statements
Message-ID: <20170429191244.7A748825CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e22b287ca7cadf09f9c683b42a1f43fd2b6abc6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter c in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairomm/Config.in     |  6 +++---
 package/ccid/Config.in        |  4 ++--
 package/cdrkit/Config.in      |  4 ++--
 package/checkpolicy/Config.in |  4 ++--
 package/clamav/Config.in      |  4 ++--
 package/classpath/Config.in   |  2 +-
 package/cmake/Config.in       | 14 +++++++-------
 package/connman/Config.in     |  8 ++++----
 package/cpio/Config.in        |  2 +-
 package/cppcms/Config.in      |  6 +++---
 package/curlftpfs/Config.in   |  8 ++++----
 package/czmq/Config.in        |  2 +-
 12 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
index c0d5ccd..840549b 100644
--- a/package/cairomm/Config.in
+++ b/package/cairomm/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_CAIROMM
 	bool "cairomm"
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBSIGC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSIGC
 	help
 	  The cairomm package is a set of C++ bindings for Cairo.
 
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index f5bb583..dfb57e8 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_CCID
 	bool "ccid"
-	select BR2_PACKAGE_PCSC_LITE
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
+	select BR2_PACKAGE_PCSC_LITE
+	select BR2_PACKAGE_LIBUSB
 	help
 	  PC/SC driver for USB CCID smart card readers
 
diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index af18ba9..7b5b886 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_CDRKIT
+	bool "cdrkit"
+	depends on BR2_USE_MMU # fork
 	# Needed for libbz
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_USE_MMU # fork
-	bool "cdrkit"
 	help
 	  cdrkit is a suite of programs for recording CDs and DVDs,
 	  blanking CD-RW media, creating ISO-9660 filesystem images,
diff --git a/package/checkpolicy/Config.in b/package/checkpolicy/Config.in
index 99754ce..97ad0b7 100644
--- a/package/checkpolicy/Config.in
+++ b/package/checkpolicy/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_CHECKPOLICY
 	bool "checkpolicy"
-	select BR2_PACKAGE_LIBSELINUX
-	select BR2_PACKAGE_FLEX
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
 	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on !BR2_arc # libselinux
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_FLEX
 	help
 	  checkpolicy is the SELinux policy compiler. It uses libsepol
 	  to generate the binary policy. checkpolicy uses the static
diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index f832341..051df0d 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_CLAMAV
 	bool "clamav"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # fork()
 	help
 	  ClamAV is an open source antivirus engine for detecting trojans,
 	  viruses, malware & other malicious threats.
diff --git a/package/classpath/Config.in b/package/classpath/Config.in
index 8051523..0385ccd 100644
--- a/package/classpath/Config.in
+++ b/package/classpath/Config.in
@@ -7,9 +7,9 @@ config BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
 
 config BR2_PACKAGE_CLASSPATH
 	bool "classpath"
+	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
 	select BR2_NEEDS_HOST_JAR
 	select BR2_NEEDS_HOST_JAVAC
-	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
 	help
 	  GNU Classpath, Essential Libraries for Java, is a GNU
 	  project to create free core class libraries for use with
diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 2706db5..1c95d71 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -12,6 +12,13 @@ config BR2_PACKAGE_CMAKE
 
 config BR2_PACKAGE_CMAKE_CTEST
 	bool "ctest"
+	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # from jsoncpp
+	depends on BR2_USE_WCHAR # libarchive
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on BR2_USE_MMU # libuv
 	select BR2_PACKAGE_CMAKE
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JSONCPP
@@ -21,13 +28,6 @@ config BR2_PACKAGE_CMAKE_CTEST
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_XZ
 	select BR2_PACKAGE_LIBUV
-	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # from jsoncpp
-	depends on BR2_USE_WCHAR # libarchive
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
-	depends on BR2_USE_MMU # libuv
 	help
 	  CTest is a testing tool distributed as a part of CMake. It
 	  can be used to automate updating (using CVS for example),
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 6ed40be..39a81ee 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_CONNMAN
 	bool "connman"
-	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_IPTABLES
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_STATIC_LIBS # needs dlopen()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL # mixes userspace and kernel headers
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_IPTABLES
 	help
 	  The Connection Manager (ConnMan) project provides a daemon
 	  for managing internet connections within embedded devices
@@ -50,8 +50,8 @@ config BR2_PACKAGE_CONNMAN_LOOPBACK
 
 config BR2_PACKAGE_CONNMAN_NEARD
 	bool "enable neard support"
-	select BR2_PACKAGE_NEARD
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # neard
+	select BR2_PACKAGE_NEARD
 
 config BR2_PACKAGE_CONNMAN_OFONO
 	bool "enable ofono support"
diff --git a/package/cpio/Config.in b/package/cpio/Config.in
index 1210a0b..3ef0402 100644
--- a/package/cpio/Config.in
+++ b/package/cpio/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_CPIO
 	bool "cpio"
+	depends on BR2_USE_WCHAR
 	# Need argp.h support
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_USE_WCHAR
 	help
 	  cpio archive utility for creation and extraction.
 
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 2cf7005..e930c04 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_CPPCMS
 	bool "cppcms"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_LIBGCRYPT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  CppCMS is a Free High Performance Web Development Framework
 	  (not a CMS) aimed for Rapid Web Application Development. It
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index ad3ac24..c2d591a 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_CURLFTPFS
 	bool "curlftpfs (FUSE)"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
+	depends on BR2_USE_MMU # libfuse, glib2
+	depends on !BR2_STATIC_LIBS # libfuse
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
-	depends on BR2_USE_MMU # libfuse, glib2
-	depends on !BR2_STATIC_LIBS # libfuse
 	help
 	  CurlFtpFS is a filesystem for accessing FTP hosts based on FUSE
 	  and libcurl.
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index cfa5152..71389fc 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_CZMQ
 	bool "czmq"
-	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	select BR2_PACKAGE_ZEROMQ
 	help
 	  High-level C Binding for 0MQ
 
