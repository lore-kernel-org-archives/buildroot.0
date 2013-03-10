From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 22:31:58 +0100
Subject: [Buildroot] [git commit] gptfdisk: factorize the
	BR2_PACKAGE_GPTFDISK dependency
Message-ID: <20130310213208.B5E699AFA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac26e65cc3591c1185a7d13309d3d0744acb2c3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gptfdisk/Config.in |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index 28b20df..70acde7 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -1,3 +1,6 @@
+comment "gptfdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled"
+	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+
 config BR2_PACKAGE_GPTFDISK
 	bool "gptfdisk"
 	depends on BR2_LARGEFILE
@@ -15,9 +18,10 @@ config BR2_PACKAGE_GPTFDISK
 
 	  http://www.rodsbooks.com/gdisk/
 
+if BR2_PACKAGE_GPTFDISK
+
 config BR2_PACKAGE_GPTFDISK_GDISK
 	bool "interactive gdisk"
-	depends on BR2_PACKAGE_GPTFDISK
 	help
 	  Install the interactive GUID partition table (GPT) manipulator
 	  /usr/sbin/gdisk which is modelled after and quite similar in use
@@ -25,7 +29,6 @@ config BR2_PACKAGE_GPTFDISK_GDISK
 
 config BR2_PACKAGE_GPTFDISK_SGDISK
 	bool "command line sgdisk"
-	depends on BR2_PACKAGE_GPTFDISK
 	select BR2_PACKAGE_POPT
 	help
 	  Install the command-line GUID partition table (GPT) manipulator
@@ -34,11 +37,9 @@ config BR2_PACKAGE_GPTFDISK_SGDISK
 
 config BR2_PACKAGE_GPTFDISK_CGDISK
 	bool "ncurses cgdisk"
-	depends on BR2_PACKAGE_GPTFDISK
 	select BR2_PACKAGE_NCURSES
 	help
 	  Install the ncurses-based GUID partition table (GPT)
 	  manipulator /usr/sbin/cgdisk.
 
-comment "gptfdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled"
-	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+endif
