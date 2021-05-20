From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 13:43:38 +0200
Subject: [Buildroot] [git commit branch/next]
 configs/acmesystems_acqua_a5_*: use tested bootloader version
Message-ID: <20210520112227.802C48395F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82e7aa945a6c961b69503dd181db00344e833bf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The new branch "4.x" of at91bootstrap has dropped the contrib directory,
which holds the defconfigs used by the Acmesystems Acqua A5 boards. We
then cannot use the latest at91bootstrap anymore.

As commit e009816c67fc1335a9b2da8687b55c5ff6aa27cf introduced support
for at91bootstrap 4.x in the "next" branch, it had to work around this
by pinning these defconfigs to the "latest 3.x" version.

Avoid this and any future incompatibility problems by explicitly
requesting a tested version of at91bootstrap.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
[yann.morin.1998 at free.fr: use a custom git, like other acme defconfigs]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/acmesystems_acqua_a5_256mb_defconfig | 4 +++-
 configs/acmesystems_acqua_a5_512mb_defconfig | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index f62b000654..618ef0e756 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -17,7 +17,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.2"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 9d2f009a5a..e9d74be7c8 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -17,7 +17,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.2"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
