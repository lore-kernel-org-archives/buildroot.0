From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 21:21:28 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi: bump kernel version
Message-ID: <20140503200855.B75689CACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e136ca20836a03c7771b6820fb16b0972a654114
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream has been playing evil-rebase on their tree, so they now
no longer have the changeset we are currently referencing.

They have now agreed to merge instead of rebasing:
    https://github.com/raspberrypi/linux/issues/584

So, update the raspberrypi_defconfig to use a new changeset that
currently exists right _now_, in the hope it will not disapear in
the future (but we'll catch it pretty fast anyway, so we'll be able
to seriously bug up upstream in that case ;-) ).

Reported-by: Jeremy Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: yann.morin.1998 at free.fr
Cc: Jeremy Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 61e23c0..4fba6c7 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="746069c0ac473cfb4fd70415149b4cfdea193119"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="81bd944c02f65f706ad257f113fd5b2f62cdd03f"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
