From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu,  8 May 2014 19:20:11 -0500
Subject: [Buildroot] [PATCH 1/1] manual: add information about
	INSTALL_IMAGES_CMDS
Message-ID: <1399594811-27028-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Buildroot manual currently does not contain any mention of the
<pkg>_INSTALL_IMAGES_CMDS which could potentially be of interest when
developing a new 'generic-package'.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
CC: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 docs/manual/adding-packages-generic.txt |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 1567487..f421651 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -410,6 +410,15 @@ different steps of the build process.
   should be installed, since they might be needed to compile other
   packages.
 
+* +LIBFOO_INSTALL_IMAGES_CMDS+ lists the actions to be performed to
+  install the package to the images directory, when the package is a
+  target package. The package must install its files to the directory
+  given by +$(BINARIES_DIR)+. Only files that are binary images (aka
+  images) that do not belong in the +TARGET_DIR+ but are necessary
+  for booting the board should be placed here. For example, a package
+  should utilize this step if it has binaries which would be similar
+  to the kernel image, bootloader or root filesystem images.
+
 * +LIBFOO_INSTALL_INIT_SYSV+ and +LIBFOO_INSTALL_INIT_SYSTEMD+ list the
   actions to install init scripts either for the systemV-like init systems
   (busybox, sysvinit, etc.) or for the systemd units. These commands
-- 
1.7.9.5
