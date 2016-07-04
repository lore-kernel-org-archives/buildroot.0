From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:17 +0200
Subject: [Buildroot] [PATCH 66/83 v2] package/qemu: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <33b2e885fd3fcdd67939a9f86e803aa08dd1cd45.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qemu has 5-or-more options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ea6b946..9c3dcfe 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -9,7 +9,7 @@ comment "QEMU requires a toolchain with wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
 
-config BR2_PACKAGE_QEMU
+menuconfig BR2_PACKAGE_QEMU
 	bool "QEMU"
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-- 
2.7.4
