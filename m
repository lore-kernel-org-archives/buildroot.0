From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Oct 2013 23:11:49 +0100
Subject: [Buildroot] [PATCH] Makefile: export BUILD_DIR
Message-ID: <1382566309-11943-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

$(BUILD_DIR) is a nice place to put files generated during the build.
With the advent of user-supplied step-hooks, they may want to store
some information on the build.

Export BUILD_DIR to that effect; update manual accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
v2: update documentation (Peter)
---
 Makefile                         | 1 +
 docs/manual/customize-rootfs.txt | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f266e2d..9528703 100644
--- a/Makefile
+++ b/Makefile
@@ -291,6 +291,7 @@ export STAGING_DIR
 export HOST_DIR
 export BINARIES_DIR
 export BASE_DIR
+export BUILD_DIR
 
 ################################################################################
 #
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 49a6b4b..158389c 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -41,6 +41,7 @@ there are a few ways to customize the resulting target filesystem.
     - +BUILDROOT_CONFIG+: the path to the Buildroot .config file
     - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
       xref:generic-package-reference[]
+    - +BUILD_DIR+: the directory where packages are extracted and built
     - +BINARIES_DIR+: the place where all binary files (aka images) are
       stored
     - +BASE_DIR+: the base output directory
@@ -79,7 +80,7 @@ in one of these _post-image scripts_ will require special handling
 Just like for the _post-build scripts_ mentioned above, you also have
 access to the following environment variables from your _post-image
 scripts_: +BUILDROOT_CONFIG+, +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+,
-+BINARIES_DIR+ and +BASE_DIR+.
++BUILD_DIR+, +BINARIES_DIR+ and +BASE_DIR+.
 
 Additionally, each of the +BR2_ROOTFS_POST_BUILD_SCRIPT+ and
 +BR2_ROOTFS_POST_IMAGE_SCRIPT+ scripts will be passed the arguments
-- 
1.8.1.2
