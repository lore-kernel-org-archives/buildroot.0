From: Nicholas Sielicki <sielicki@yandex.com>
Date: Mon,  4 Sep 2017 19:08:06 -0500
Subject: [Buildroot] [PATCH v2 2/2] configs/minnowboard_max-graphical:
	wchar/grub2 fix
In-Reply-To: <20170905000806.13295-1-sielicki@yandex.com>
References: <20170905000806.13295-1-sielicki@yandex.com>
Message-ID: <20170905000806.13295-3-sielicki@yandex.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

minnowboard_max-graphical_defconfig has the line "BR_TARGET_GRUB2=y",
but this currently has no effect because BR_TARGET_GRUB2 cannot be
selected without BR2_TOOLCHAIN_BUILDROOT_WCHAR=y, which is not set by
default.

The minnowboard max defconfig was updated to fix this problem, but the
graphical variant was not updated alongside it.

Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
---
 configs/minnowboard_max-graphical_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index ef0947cb7..2c11fb378 100644
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
-- 
2.14.1
