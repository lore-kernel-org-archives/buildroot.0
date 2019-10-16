From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:45:37 +0200
Subject: [Buildroot] [git commit] package/qemu: bump to hot-fix release
 3.1.1.1
Message-ID: <20191016193953.9B6BC80260@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bed6dbec9d3f9a4e857f5d42565dd0d2b6c5b98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a couple of important things and among other things the build of
pvrdma code:

----------------------->8---------------------
  In function 'create_qp':
  hw/rdma/vmw/pvrdma_cmd.c:517:16: error: 'rc' undeclared
----------------------->8---------------------

Bumped into this build problem while building vanilla
qemu_arm_versatile_defconfig.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Alexander Dahl <post@lespocky.de>
Cc: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch     | 0
 ...-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch | 0
 package/qemu/qemu.hash                                                  | 2 +-
 package/qemu/qemu.mk                                                    | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/3.1.1/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/3.1.1.1/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
similarity index 100%
rename from package/qemu/3.1.1/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
rename to package/qemu/3.1.1.1/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
diff --git a/package/qemu/3.1.1/0002-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch b/package/qemu/3.1.1.1/0002-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch
similarity index 100%
rename from package/qemu/3.1.1/0002-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch
rename to package/qemu/3.1.1.1/0002-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-with-new-kernels.patch
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 1155a43935..29339ae296 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,5 +1,5 @@
 # Locally computed, tarball verified with GPG signature
-sha256 d7c69fef3fb4bfbac99e3f2ac9fb8d6409db4faadf2e37337d544e3fdb4fde3a  qemu-3.1.1.tar.xz
+sha256 b148fc3c7382c5addd915db433383160ca7b840bc6ea90bb0d35c6b253526d56  qemu-3.1.1.1.tar.xz
 sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256 48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df  COPYING.LIB
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1d3759a850..cf2a570efa 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -8,7 +8,7 @@ ifeq ($(BR2_csky),y)
 QEMU_VERSION = b517e1dc3125a57555d67a8deed9eac7b42288e2
 QEMU_SITE = $(call github,c-sky,qemu,$(QEMU_VERSION))
 else
-QEMU_VERSION = 3.1.1
+QEMU_VERSION = 3.1.1.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 endif
