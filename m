From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:04:17 +0100
Subject: [Buildroot] [git commit] qemu: add missing indirect dependency on
	dynamic library for fdt
Message-ID: <20150207202910.2514C8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b34853ea57f6b1a08dd8e16ff21732a55a19b9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 5882571..65421c0 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -54,10 +54,14 @@ comment "... or you can select emulator families to enable, below:"
 
 config BR2_PACKAGE_QEMU_SYSTEM
 	bool "Enable all systems emulation"
+	depends on !BR2_STATIC_LIBS # dtc
 	select BR2_PACKAGE_QEMU_FDT
 	help
 	  Say 'y' to build all system emulators/virtualisers that QEMU supports.
 
+comment "systems emulation needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_QEMU_LINUX_USER
 	bool "Enable all Linux user-land emulation"
 	help
@@ -86,11 +90,15 @@ comment "Misc. features"
 
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
+	depends on !BR2_STATIC_LIBS # dtc
 	select BR2_PACKAGE_DTC
 	help
 	  Say 'y' here to have QEMU capable of constructing Device Trees,
 	  and passing them to the VMs.
 
+comment "FDT support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 endif # BR2_PACKAGE_QEMU_HAS_EMULS
 
 endif # BR2_PACKAGE_QEMU
