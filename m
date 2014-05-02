From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 May 2014 14:45:11 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi: use the branch name
	instead of the sha1 for the linux kernel
Message-ID: <1399034711-12550-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Previously, when we were using the rpi-3.10.y branch, we coiuld use a sha1 to
refer to a specific changeset, and that would work and give reproducible
builds, thanks to upstream merging linux-stable into their branch.

Now they have declared rpi-3.12.y the new stable branch, and deprecated the
rpi-3.10.y branch.

Unfortunately, they are now rebasing the rpi-3.12.y branch instead of merging
linux-stable as they used to do. This means we can no longer use a sha1 as the
tree will change as soon as upstream rebases onto a new linux-stable.

There are two possibilities here:
  - revert back to using a rpi-3.10.y cset
  - use the rpi-3.12.y branch name

This patch goes with the second option, since rpi-3.10.y is no longer maitained,
and we prefer to use a stable branch, at the cost of reproducible builds.

Reported-by: Jeremy Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: yann.morin.1998 at free.fr
Cc: Jeremy Rosen <jeremy.rosen@openwide.fr>

---
Note: before the next release, we should revisit this, and if upstream has
not switched to merging over rebasing, then we will just revert to using
the latest cset from the rpi-3.10.y branch for the release.
---
 configs/raspberrypi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 61e23c0..28ca5ac 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="746069c0ac473cfb4fd70415149b4cfdea193119"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rpi-3.12.y"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.3.2
