From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed,  8 Apr 2015 10:08:00 +0200
Subject: [Buildroot] [PATCH] raspberrypi2: kernel version does no more exist
Message-ID: <1428480480-6422-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It looks like version 2c4959b of Raspberry kernel does no more exist:

$ git clone https://github.com/raspberrypi/linux.git
[...]
$ cd linux
$ git co 23c76b7f608e51258c6fca02aebeb5d588583149
fatal: reference is not a tree: 23c76b7f608e51258c6fca02aebeb5d588583149

Replace it by lastest version of 3.19 branch

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 configs/raspberrypi2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
1.9.1
