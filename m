From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:11:29 +0200
Subject: [Buildroot] [git commit] Config.in*: fix attributes order
Message-ID: <20180401071211.8C609814E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1264445f8684dae9f9fc57627c79f9cbb11a328
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... to follow the convention: type, default, depends on, select, help.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in        | 8 ++++----
 Config.in.legacy | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Config.in b/Config.in
index 852c61ef3a..ca6010fd30 100644
--- a/Config.in
+++ b/Config.in
@@ -424,8 +424,8 @@ endif
 
 config BR2_STRIP_strip
 	bool "strip target binaries"
-	depends on !BR2_PACKAGE_HOST_ELF2FLT
 	default y
+	depends on !BR2_PACKAGE_HOST_ELF2FLT
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the normal 'strip' command. This allows to save
@@ -435,16 +435,16 @@ config BR2_STRIP_strip
 
 config BR2_STRIP_EXCLUDE_FILES
 	string "executables that should not be stripped"
-	depends on BR2_STRIP_strip
 	default ""
+	depends on BR2_STRIP_strip
 	help
 	  You may specify a space-separated list of binaries and
 	  libraries here that should not be stripped on the target.
 
 config BR2_STRIP_EXCLUDE_DIRS
 	string "directories that should be skipped when stripping"
-	depends on BR2_STRIP_strip
 	default ""
+	depends on BR2_STRIP_strip
 	help
 	  You may specify a space-separated list of directories that
 	  should be skipped when stripping. Binaries and libraries in
@@ -545,7 +545,6 @@ endchoice
 
 config BR2_GOOGLE_BREAKPAD_ENABLE
 	bool "Enable google-breakpad support"
-	select BR2_PACKAGE_GOOGLE_BREAKPAD
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
@@ -554,6 +553,7 @@ config BR2_GOOGLE_BREAKPAD_ENABLE
 	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	select BR2_PACKAGE_GOOGLE_BREAKPAD
 	help
 	  This option will enable the use of google breakpad, a library
 	  and tool suite that allows you to distribute an application to
diff --git a/Config.in.legacy b/Config.in.legacy
index b1dca97e5e..08a129106c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1970,8 +1970,8 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	  name.
 
 config BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS
-	depends on BR2_PACKAGE_PYTHON
 	bool "libsemanage python bindings removed"
+	depends on BR2_PACKAGE_PYTHON
 	select BR2_LEGACY
 	help
 	  This option has been removed, since the libsemanage Python
