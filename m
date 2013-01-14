From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 10:04:21 +0100
Subject: [Buildroot] [git commit] Makefile: don't export O to the environment
Message-ID: <20130114090420.296E699E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1300cb55621d1565a1b09e907963d77f272eacb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Several projects use the kernel style O=<dir> syntax to build out of tree,
and atleast uClibc doesn't check that it was explictly passed on the command
line, so setting it in the environment breaks the build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                         |    2 +-
 docs/manual/customize-rootfs.txt |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 16b5ef4..f408632 100644
--- a/Makefile
+++ b/Makefile
@@ -291,7 +291,7 @@ export TARGET_DIR
 export STAGING_DIR
 export HOST_DIR
 export BINARIES_DIR
-export BASE_DIR O   # O and BASE_DIR are the same
+export BASE_DIR
 
 #############################################################
 #
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 4d3b559..6399699 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -43,7 +43,7 @@ there are a few ways to customize the resulting target filesystem.
       xref:generic-package-reference[]
     - +BINARIES_DIR+: the place where all binary files (aka images) are
       stored
-    - +BASE_DIR+ (or +O+): the base output directory
+    - +BASE_DIR+: the base output directory
 
 * A special package, 'customize', stored in +package/customize+ can be
   used. You can put all the files that you want to see in the final
