From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 15:27:05 +0200
Subject: [Buildroot] [git commit] minnowboard_max_defconfig: grub2 needs
	WCHAR
Message-ID: <20170811132052.C4FAD804FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=033e2b94318503d7ada2efcd53b2a606bd41148a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 5ffafd2353f5d67 (grub2: bump up version), grub2 needs a
toolchain with WCHAR support. However, the defconfigs that use grub2
were not updated at the time.

Add BR2_TOOLCHAIN_BUILDROOT_WCHAR=y to minnowboard_max_defconfig.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Vincent Stehl?? <vincent.stehle@intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/minnowboard_max_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 674b144..db6e595 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -9,6 +9,9 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
 
 # Linux headers same as kernel, a 4.12 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+# Needed for grub2
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
