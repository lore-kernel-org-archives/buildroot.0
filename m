From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 11:36:01 +0200
Subject: [Buildroot] [git commit] package/i*/Config.in: fix ordering of
	statements
Message-ID: <20170501093625.9D32F8278A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84cafb744cfe38940502ec881b63ef5bc6f98160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter i in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iftop/Config.in       | 2 +-
 package/imlib2/Config.in      | 2 +-
 package/iprutils/Config.in    | 4 ++--
 package/ipsec-tools/Config.in | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/iftop/Config.in b/package/iftop/Config.in
index 8c6ae0c..f80a831 100644
--- a/package/iftop/Config.in
+++ b/package/iftop/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_IFTOP
 	bool "iftop"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBPCAP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  iftop does for network usage what top(1) does for CPU usage.
 	  It listens to network traffic on a named interface and displays
diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
index 7aac074..c47178f 100644
--- a/package/imlib2/Config.in
+++ b/package/imlib2/Config.in
@@ -3,8 +3,8 @@ comment "imlib2 needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_IMLIB2
 	bool "imlib2"
-	select BR2_PACKAGE_FREETYPE
 	depends on !BR2_STATIC_LIBS # dlopen()
+	select BR2_PACKAGE_FREETYPE
 	help
 	  Imlib 2 is the successor to Imlib. This library provides
 	  routines to load, save and render images in various formats.
diff --git a/package/iprutils/Config.in b/package/iprutils/Config.in
index b429e71..8e2884a 100644
--- a/package/iprutils/Config.in
+++ b/package/iprutils/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_IPRUTILS
 	bool "iprutils"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_bfin # pciutils
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBSYSFS
 	select BR2_PACKAGE_PCIUTILS
-	depends on BR2_USE_MMU # fork()
-	depends on !BR2_bfin # pciutils
 	help
 	  System utilities for IBM Power RAID devices
 
diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 36c5a65..1635675 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -12,8 +12,8 @@ config BR2_PACKAGE_IPSEC_TOOLS
 if BR2_PACKAGE_IPSEC_TOOLS
 
 config BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT
-	default y
 	bool "Enable racoonctl(8)"
+	default y
 	help
 	  Lets racoon to listen to racoon admin port, which is to
 	  be contacted by racoonctl(8).
@@ -42,12 +42,12 @@ config BR2_PACKAGE_IPSEC_TOOLS_DPD
 	  Enable dead peer detection support
 
 config BR2_PACKAGE_IPSEC_TOOLS_STATS
-	default y
 	bool "Enable statistics logging function"
+	default y
 
 config BR2_PACKAGE_IPSEC_TOOLS_READLINE
-	select BR2_PACKAGE_READLINE
 	bool "Enable readline input support"
+	select BR2_PACKAGE_READLINE
 
 config BR2_PACKAGE_IPSEC_TOOLS_HYBRID
 	bool "Enable hybrid, both mode-cfg and xauth support"
