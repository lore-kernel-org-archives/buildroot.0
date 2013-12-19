From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 21:54:36 +0100
Subject: [Buildroot] [git commit] manual: explain format of comment about
	udev /dev management dependency
Message-ID: <20131219205533.C14779C0B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6386eda4a75d8dd997039e411e55fb41bb2364b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 57f3204..754a145 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -270,6 +270,23 @@ kernel, use this format:
 foo needs a toolchain w/ featA, featB, featC and a Linux kernel to be built
 --------------------------
 
+Dependencies on udev /dev management
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+If a package needs udev /dev management, it should depend on symbol
++BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV+, and the following comment
+should be added:
+
+--------------------------
+foo needs udev /dev management
+--------------------------
+
+If there is a dependency on both toolchain options and udev /dev
+management, use this format:
+
+--------------------------
+foo needs udev /dev management and a toolchain w/ featA, featB, featC
+--------------------------
+
 The +.mk+ file
 ~~~~~~~~~~~~~~
 [[adding-packages-mk]]
