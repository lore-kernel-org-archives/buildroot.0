From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:55:28 +0200
Subject: [Buildroot] [git commit] configs/galileo: grub2 needs wchar
	toolchain
Message-ID: <20170905194824.8677C819CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca622d6222b7694b97a834aec582ae9985bb093a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The galileo_defconfig has the line "BR_TARGET_GRUB2=y", but this
currently has no effect because BR_TARGET_GRUB2 cannot be selected
without BR2_TOOLCHAIN_BUILDROOT_WCHAR=y, which is not set by default.

Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/galileo_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index 7db3cfe..72ab0ff 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -1,4 +1,6 @@
 BR2_x86_x1000=y
+# Needed for TARGET_GRUB2
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
