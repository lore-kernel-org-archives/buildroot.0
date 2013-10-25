From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2013 08:10:23 +0200
Subject: [Buildroot] [git commit] Makefile: revert BUILD_DIR export
Message-ID: <20131025061146.214CC9BB9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4513d785156f87707687081aeb8582c56b684cc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Revert commit feb0877015cc0c644129e69276b3000c83742750
U-Boot uses $(BUILD_DIR) and causes issues, other packages might as
well. Fixes:
http://autobuild.buildroot.net/results/1f6/1f65289d5c284caa82a4e9137613f792797ee08a/
http://autobuild.buildroot.net/results/6a5/6a5f77483e908dc96d08824cf9113402431bace7/

It should probably be named somewhat more uniquely.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                         |    1 -
 docs/manual/customize-rootfs.txt |    3 +--
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 9528703..f266e2d 100644
--- a/Makefile
+++ b/Makefile
@@ -291,7 +291,6 @@ export STAGING_DIR
 export HOST_DIR
 export BINARIES_DIR
 export BASE_DIR
-export BUILD_DIR
 
 ################################################################################
 #
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 158389c..49a6b4b 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -41,7 +41,6 @@ there are a few ways to customize the resulting target filesystem.
     - +BUILDROOT_CONFIG+: the path to the Buildroot .config file
     - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
       xref:generic-package-reference[]
-    - +BUILD_DIR+: the directory where packages are extracted and built
     - +BINARIES_DIR+: the place where all binary files (aka images) are
       stored
     - +BASE_DIR+: the base output directory
@@ -80,7 +79,7 @@ in one of these _post-image scripts_ will require special handling
 Just like for the _post-build scripts_ mentioned above, you also have
 access to the following environment variables from your _post-image
 scripts_: +BUILDROOT_CONFIG+, +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+,
-+BUILD_DIR+, +BINARIES_DIR+ and +BASE_DIR+.
++BINARIES_DIR+ and +BASE_DIR+.
 
 Additionally, each of the +BR2_ROOTFS_POST_BUILD_SCRIPT+ and
 +BR2_ROOTFS_POST_IMAGE_SCRIPT+ scripts will be passed the arguments
