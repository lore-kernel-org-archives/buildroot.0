From: Nicholas Sielicki <sielicki@yandex.com>
Date: Mon,  4 Sep 2017 19:08:05 -0500
Subject: [Buildroot] [PATCH v2 1/2] configs/galileo: grub2 needs wchar
	toolchain
In-Reply-To: <20170905000806.13295-1-sielicki@yandex.com>
References: <20170905000806.13295-1-sielicki@yandex.com>
Message-ID: <20170905000806.13295-2-sielicki@yandex.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The galileo_defconfig has the line "BR_TARGET_GRUB2=y", but this
currently has no effect because BR_TARGET_GRUB2 cannot be selected
without BR2_TOOLCHAIN_BUILDROOT_WCHAR=y, which is not set by default.

Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
---
 configs/galileo_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index 43639a41a..39622e331 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -1,4 +1,6 @@
 BR2_x86_x1000=y
+# Needed for TARGET_GRUB2
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-- 
2.14.1
