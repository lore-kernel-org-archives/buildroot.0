From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:55:43 +0200
Subject: [Buildroot] [git commit] configs/minnowboard_max-graphical:
	wchar/grub2 fix
Message-ID: <20170905194824.8F49181DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f27c1b82cd13a4bdbf6833110f55d4203a375066
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

minnowboard_max-graphical_defconfig has the line "BR_TARGET_GRUB2=y",
but this currently has no effect because BR_TARGET_GRUB2 cannot be
selected without BR2_TOOLCHAIN_BUILDROOT_WCHAR=y, which is not set by
default.

The minnowboard max defconfig was updated to fix this problem, but the
graphical variant was not updated alongside it.

Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/minnowboard_max-graphical_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index ef0947c..2c11fb3 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -6,6 +6,8 @@ BR2_x86_atom=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
+# needed for TARGET_GRUB2
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # System configuration
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
