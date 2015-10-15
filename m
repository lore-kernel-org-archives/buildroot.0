From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 10:46:35 +0200
Subject: [Buildroot] [git commit] configs: update cubieboard_defconfig to a
	3.4 kernel
Message-ID: <20151015084752.8E7E4818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe277eac1f97050d3f9c7f9d3d1558ca4a1707d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current commit used for the kernel Git repository for Cubieboard,
274a66a7bfcbaabb88d63e4eba161965383cc416, actually points to 3.0
kernel. This is incorrect since the kernel headers version specified
by the defconfig is 3.4. And anyway, the 3.4 kernel is kind of the
official vendor kernel for Allwinner platforms.

mfld.fr at gmail.com reported in bug #7931 that commit
9a1cd034181af628d4145202289e1993c1687db6 was working for him. It is
the latest commit in the sunxi-3.4 branch. So we switch to using this
commit, which was build tested successfully.

While we're at it, remove the definition of BR2_LINUX_KERNEL_VERSION
from the defconfig: it doesn't make sense to have it defined in a
defconfig, as it's a blind option that gets defined from the value of
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION when a Git repository is used to
source the kernel.

Fixes #7931.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/cubieboard_defconfig |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/configs/cubieboard_defconfig b/configs/cubieboard_defconfig
index 1da019f..ef4e365 100644
--- a/configs/cubieboard_defconfig
+++ b/configs/cubieboard_defconfig
@@ -23,8 +23,7 @@ BR2_KERNEL_HEADERS_3_4=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="274a66a7bfcbaabb88d63e4eba161965383cc416"
-BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9a1cd034181af628d4145202289e1993c1687db6"
 BR2_LINUX_KERNEL_DEFCONFIG="sun4i"
 
 # Bootloaders
