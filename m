From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 29 Jun 2015 11:13:34 -0300
Subject: [Buildroot] [PATCH] qemu: enable for aarch64
Message-ID: <1435587214-10000-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Enable the target qemu for aarch64 since it works just fine.
Only tested using userland CPU emulation (no HYP) with a
qemu_aarch64_virt_defconfig image inside a qemu_aarch64_virt_defconfig
instance.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/qemu/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 25936e2..082b5ee 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	bool
 	# Only tested on these architectures
-	default y if BR2_i386 || BR2_mips || BR2_mipsel || BR2_x86_64
+	default y if BR2_aarch64 || BR2_i386 || BR2_mips || BR2_mipsel \
+		|| BR2_x86_64
 
 comment "QEMU requires a toolchain with wchar, threads"
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
-- 
2.1.4
