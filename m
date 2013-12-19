From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Dec 2013 21:13:02 +0100
Subject: [Buildroot] [PATCH 2 of 2] manual: explain format of comment about
 udev /dev management dependency
In-Reply-To: <patchbomb.1387483980@argentina>
References: <patchbomb.1387483980@argentina>
Message-ID: <2d2ddc44295d91bb3c9d.1387483982@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-directory.txt |  17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
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
