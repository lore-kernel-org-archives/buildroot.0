From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:45:30 +0100
Subject: [Buildroot] [PATCH v2 8/8] gptfdisk: factorize the
	BR2_PACKAGE_GPTFDISK dependency
In-Reply-To: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362689131-1479-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gptfdisk/Config.in |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index 1cdd8eb..1b0639d 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -1,3 +1,6 @@
+comment "gptfdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled"
+	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+
 config BR2_PACKAGE_GPTFDISK
 	bool "gptfdisk"
 	depends on BR2_LARGEFILE
@@ -14,9 +17,10 @@ config BR2_PACKAGE_GPTFDISK
 
 	  http://www.rodsbooks.com/gdisk/
 
+if BR2_PACKAGE_GPTFDISK
+
 config BR2_PACKAGE_GPTFDISK_GDISK
 	bool "interactive gdisk"
-	depends on BR2_PACKAGE_GPTFDISK
 	help
 	  Install the interactive GUID partition table (GPT) manipulator
 	  /usr/sbin/gdisk which is modelled after and quite similar in use
@@ -24,7 +28,6 @@ config BR2_PACKAGE_GPTFDISK_GDISK
 
 config BR2_PACKAGE_GPTFDISK_SGDISK
 	bool "command line sgdisk"
-	depends on BR2_PACKAGE_GPTFDISK
 	select BR2_PACKAGE_POPT
 	help
 	  Install the command-line GUID partition table (GPT) manipulator
@@ -33,11 +36,9 @@ config BR2_PACKAGE_GPTFDISK_SGDISK
 
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
-- 
1.7.9.5
