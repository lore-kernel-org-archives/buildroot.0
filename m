From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:58:51 +0200
Subject: [Buildroot] [git commit] manual: add information about
	INSTALL_IMAGES_CMDS
Message-ID: <20140512210141.D4E9D9CB9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7649b2820e9b6061d8c149be6cff30c3899dfdb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Buildroot manual currently does not contain any mention of the
<pkg>_INSTALL_IMAGES_CMDS which could potentially be of interest when
developing a new 'generic-package'.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
CC: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

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
