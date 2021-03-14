From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:10:59 +0100
Subject: [Buildroot] [git commit] package/mender-grubenv: bump version to
 f39c2c7ec7c9c24aae0108a9b04a0e6e61a3e96b
Message-ID: <20210314214853.773DE87D6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=112f2b4dec68fd21de345734870d900df145394f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the developers, mender-grubenv is no longer tagging releases for
the mender-grubenv project. However, they asked me if I could submit a patch
upstream to update the package to the latest commit, including quality of life
improvements since the last official 1.3.0 release.

Notable improvements are:
  - Support for separate A/B kernel partitions.
  - Use regexp to dynamically set mender_grub_storage_device
  - Add "rootwait" as a default rootfs argument

Other changes:
  - Update license hashes due to a copyright year bump.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index 1b1eaa758a..b6b9db72a7 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e50cc18a844e3fd1edef7af9224733b0338a34d51f1186ee19803ef7af1a5065 mender-grubenv-1.3.0.tar.gz
-sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7 LICENSE
+sha256 5be4222a6934813da431ae472a633e766b73f4614020745b777c15c65bcfd032 mender-grubenv-f39c2c7ec7c9c24aae0108a9b04a0e6e61a3e96b.tar.gz
+sha256 32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99 LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 6e38557eb3..ade0f4c0ed 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = 1.3.0
+MENDER_GRUBENV_VERSION = f39c2c7ec7c9c24aae0108a9b04a0e6e61a3e96b
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
@@ -30,7 +30,7 @@ MENDER_GRUBENV_DEFINES = \
 
 # These grub modules must be built in for the grub scripts to work properly.
 # Without them, the system will not boot.
-MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test
+MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test regexp
 MENDER_GRUBENV_MODULES_MISSING = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
