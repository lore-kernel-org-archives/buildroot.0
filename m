From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:28:08 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi2: kernel version does
	not exist anymore
Message-ID: <20150408192816.9297281940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01e43af20b8e037c7cdcb1dcb7f979117d9f589a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It looks like version 23c76b7 of Raspberry kernel does not exist
anymore:

$ git clone https://github.com/raspberrypi/linux.git
[...]
$ cd linux
$ git co 23c76b7f608e51258c6fca02aebeb5d588583149
fatal: reference is not a tree: 23c76b7f608e51258c6fca02aebeb5d588583149

Replace it by latest version of 3.19 branch.

[Thomas: tweak commit log.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi2_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 814e182..6a48b26 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -15,7 +15,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="23c76b7f608e51258c6fca02aebeb5d588583149"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="2c4959b772a35d9d459b0a92f39bb066e9a44d37"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
