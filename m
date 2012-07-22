From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 16:53:25 +0200
Subject: [Buildroot] [git commit] toolchain-external: line up comments with
	reality
Message-ID: <20120722151730.6D8D290E62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=163aeb14e23213a67d7b99a1c0cd9a5b28b75f77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Line-up with changes from commit 3367d5ce770ac409e7b3f5bba2c7ed1a819b3ef7
"external-toolchain: run checks even on extracted toolchains"

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/ext-tool.mk |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 49dd0e2..9c88776 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -14,11 +14,10 @@
 #
 # The basic principle is the following
 #
-#  1. a. For toolchains downloaded from the Web, Buildroot already
-#  knows their configuration, so it just downloads them and extract
-#  them in $(TOOLCHAIN_EXTERNAL_DIR).
+#  1. If the toolchain is not pre-installed, download and extract it
+#  in $(TOOLCHAIN_EXTERNAL_DIR).
 #
-#  1. b. For pre-installed toolchains, perform some checks on the
+#  2. For all external toolchains, perform some checks on the
 #  conformity between the toolchain configuration described in the
 #  Buildroot menuconfig system, and the real configuration of the
 #  external toolchain. This is for example important to make sure that
@@ -30,19 +29,19 @@
 #  options. And at configuration time, we are not able to retrieve the
 #  external toolchain configuration.
 #
-#  2. Copy the libraries needed at runtime to the target directory,
+#  3. Copy the libraries needed at runtime to the target directory,
 #  $(TARGET_DIR). Obviously, things such as the C library, the dynamic
 #  loader and a few other utility libraries are needed if dynamic
 #  applications are to be executed on the target system.
 #
-#  3. Copy the libraries and headers to the staging directory. This
+#  4. Copy the libraries and headers to the staging directory. This
 #  will allow all further calls to gcc to be made using --sysroot
 #  $(STAGING_DIR), which greatly simplifies the compilation of the
 #  packages when using external toolchains. So in the end, only the
 #  cross-compiler binaries remains external, all libraries and headers
 #  are imported into the Buildroot tree.
 #
-#  4. Build a toolchain wrapper which executes the external toolchain
+#  5. Build a toolchain wrapper which executes the external toolchain
 #  with a number of arguments (sysroot/march/mtune/..) hardcoded,
 #  so we're sure the correct configuration is always used and the
 #  toolchain behaves similar to an internal toolchain.
