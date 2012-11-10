From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 23:36:03 +0100
Subject: [Buildroot] [PATCH 2/2] Mark a number of development related
	packages as deprecated
In-Reply-To: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c42b5a3ae08ae07779a6ee389a8367318efe96bf.1352586949.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

automake, autoconf, libtool and make on the target are basically
useless if we don't support building a toolchain on the target. Of
course, the host variant of automake, autoconf and libtool will remain
available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autoconf/Config.in |    3 +++
 package/automake/Config.in |    3 +++
 package/libtool/Config.in  |    2 ++
 package/make/Config.in     |    2 ++
 4 files changed, 10 insertions(+)

diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
index c304572..9302f50 100644
--- a/package/autoconf/Config.in
+++ b/package/autoconf/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf"
 	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64)
+	# We no longer support a toolchain on the target
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_PERL
 	help
 	  Extensible program for developing configure scripts.  These
@@ -10,3 +12,4 @@ config BR2_PACKAGE_AUTOCONF
 
 comment "autoconf requires an architecture supported by qemu"
 	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64
+	depends on BR2_DEPRECATED
diff --git a/package/automake/Config.in b/package/automake/Config.in
index f8d74ef..924b29c 100644
--- a/package/automake/Config.in
+++ b/package/automake/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
 	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64)
+	# We no longer support a toolchain on the target
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_AUTOCONF
 	select BR2_PACKAGE_PERL
 	help
@@ -11,3 +13,4 @@ config BR2_PACKAGE_AUTOMAKE
 
 comment "automake requires an architecture supported by qemu"
 	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64
+	depends on BR2_DEPRECATED
diff --git a/package/libtool/Config.in b/package/libtool/Config.in
index d3cf2d7..42df25b 100644
--- a/package/libtool/Config.in
+++ b/package/libtool/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBTOOL
 	bool "libtool"
+	# We no longer support a toolchain on the target
+	depends on BR2_DEPRECATED
 	help
 	  Library that hides the complexity of using shared/static libraries
 	  on different platforms behind a consistent, portable interface.
diff --git a/package/make/Config.in b/package/make/Config.in
index ea2ae1b..e5cc970 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	# We no longer support a toolchain on the target
+	depends on BR2_DEPRECATED
 	help
 	  A tool which controls the generation of executables and other
 	  non-source files of a program from the program's source files.
-- 
1.7.9.5
