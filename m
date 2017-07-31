From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:08:47 +0200
Subject: [Buildroot] [git commit] package/e*: fix wrapping of Config.in help
	text
Message-ID: <20170731170652.618F481EF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=474e049f9660b7e181dc5d25c626a3e9d20bf581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
the letter e in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ecryptfs-utils/Config.in | 14 +++++++-------
 package/efibootmgr/Config.in     |  6 +++---
 package/eigen/Config.in          |  4 ++--
 package/empty/Config.in          |  3 ++-
 package/enscript/Config.in       | 12 +++++++-----
 package/eudev/Config.in          |  8 ++++----
 package/expedite/Config.in       |  8 ++++----
 package/ezxml/Config.in          |  3 ++-
 8 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 078ca36..bb4cc64 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -17,19 +17,19 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	help
 	  eCryptfs is a POSIX-compliant enterprise cryptographic
 	  filesystem for Linux. It is stacked on top of any other
-	  Linux filesystem, it stores cryptographic metadata in the header
-	  of each file written.
+	  Linux filesystem, it stores cryptographic metadata in the
+	  header of each file written.
 
 	  The eCryptfs kernel module is available in all Linux kernels
-	  since version 2.6.19. This package provides userspace utilities
-	  needed to mount eCryptfs.
+	  since version 2.6.19. This package provides userspace
+	  utilities needed to mount eCryptfs.
 
-	  Files are encrypted using a passphrase. Consider building openssl
-	  for another method.
+	  Files are encrypted using a passphrase. Consider building
+	  openssl for another method.
 
 	  http://ecryptfs.org
 
-comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library"
+comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library"
 	depends on !BR2_microblaze
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 1096b9d..0d36ffd 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -9,9 +9,9 @@ config BR2_PACKAGE_EFIBOOTMGR
 	select BR2_PACKAGE_EFIVAR
 	help
 	  A Linux user-space application to modify the Intel Extensible
-	  Firmware Interface (EFI) Boot Manager. This application can create
-	  and destroy boot entries, change the boot order, change the next
-	  running boot option, and more.
+	  Firmware Interface (EFI) Boot Manager. This application can
+	  create and destroy boot entries, change the boot order, change
+	  the next running boot option, and more.
 
 	  https://github.com/rhinstaller/efibootmgr
 
diff --git a/package/eigen/Config.in b/package/eigen/Config.in
index 03d65b1..48752e0 100644
--- a/package/eigen/Config.in
+++ b/package/eigen/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_EIGEN
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Eigen is a C++ template library for linear algebra: vectors,
-	  matrices, and related algorithms. It is versatile, fast, elegant
-	  and works on many platforms (OS/Compilers).
+	  matrices, and related algorithms. It is versatile, fast,
+	  elegant and works on many platforms (OS/Compilers).
 
 	  This package only installs header files to the include path.
 	  If you just want to use Eigen, you can use the header files
diff --git a/package/empty/Config.in b/package/empty/Config.in
index 7fd0877..f73bce8 100644
--- a/package/empty/Config.in
+++ b/package/empty/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_EMPTY
 	bool "empty"
 	depends on BR2_USE_MMU # uses fork()
 	help
-	  Run processes and applications under pseudo-terminal (PTY) sessions.
+	  Run processes and applications under pseudo-terminal (PTY)
+	  sessions.
 
 	  http://empty.sourceforge.net/
diff --git a/package/enscript/Config.in b/package/enscript/Config.in
index 26c45e1..b95bd92 100644
--- a/package/enscript/Config.in
+++ b/package/enscript/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_ENSCRIPT
 	bool "enscript"
 	help
-	  GNU Enscript is a free replacement for Adobe's enscript program.
+	  GNU Enscript is a free replacement for Adobe's enscript
+	  program.
 
-	  GNU Enscript converts ASCII files to PostScript, HTML, or RTF and
-	  stores generated output to a file or sends it directly to the
-	  printer. It includes features for `pretty-printing' (language-
-	  sensitive code highlighting) in several programming languages.
+	  GNU Enscript converts ASCII files to PostScript, HTML, or RTF
+	  and stores generated output to a file or sends it directly to
+	  the printer. It includes features for `pretty-printing'
+	  (language-sensitive code highlighting) in several programming
+	  languages.
 
 	  http://www.gnu.org/software/enscript
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 02fcc7e..2220265 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -9,10 +9,10 @@ config BR2_PACKAGE_EUDEV
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
 	help
-	  eudev is a fork of systemd-udev with the goal of obtaining better
-	  compatibility with existing software such as OpenRC and Upstart,
-	  older kernels, various toolchains and anything else required by
-	  users and various distributions.
+	  eudev is a fork of systemd-udev with the goal of obtaining
+	  better compatibility with existing software such as OpenRC and
+	  Upstart, older kernels, various toolchains and anything else
+	  required by users and various distributions.
 
 	  https://wiki.gentoo.org/wiki/Project:Eudev
 
diff --git a/package/expedite/Config.in b/package/expedite/Config.in
index 0bcf343..fdfc671 100644
--- a/package/expedite/Config.in
+++ b/package/expedite/Config.in
@@ -3,10 +3,10 @@ config BR2_PACKAGE_EXPEDITE
 	depends on BR2_PACKAGE_EFL
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  Expedite is the official Evas benchmark tool. It can test different
-	  engines, such as X11, XRender, OpenGL (also ES variant), SDL,
-	  DirectFB and so on. Its tests are quite extensive, trying to
-	  reproduce real world usage cases.
+	  Expedite is the official Evas benchmark tool. It can test
+	  different engines, such as X11, XRender, OpenGL (also ES
+	  variant), SDL, DirectFB and so on. Its tests are quite
+	  extensive, trying to reproduce real world usage cases.
 
 comment "expedite needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/ezxml/Config.in b/package/ezxml/Config.in
index 285c7a5..8a1643b 100644
--- a/package/ezxml/Config.in
+++ b/package/ezxml/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_EZXML
 	bool "ezxml"
 	help
-	  ezXML is a XML parser C library that is simple and easy to use.
+	  ezXML is a XML parser C library that is simple and easy to
+	  use.
 
 	  http://ezxml.sf.net
