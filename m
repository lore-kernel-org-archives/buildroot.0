From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 19 Oct 2017 12:10:54 -0400
Subject: [Buildroot] [PATCH 1/1] host-qemu: disable QEMU usermode usage with
	n32 ABI
Message-ID: <20171019161054.25476-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

user mode qemu doesn't support mips64 n32:
"Invalid ELF image for this architecture"

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/qemu/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 71f38ef41f..41b138cf22 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -27,6 +27,7 @@ config BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 
 config BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	bool "Enable Linux user-land emulation"
+	depends on !BR2_MIPS_NABI32
 	help
 	  Enables the build of the user-land emulator, which allows to
 	  run user-space applications.
-- 
2.13.6
