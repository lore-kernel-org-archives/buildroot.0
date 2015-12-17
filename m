From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Dec 2015 11:57:07 +0000
Subject: [Buildroot] [PATCH 2/3] qemu: wrap lines to 72 characters length
In-Reply-To: <1450353428-57815-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1450353428-57815-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1450353428-57815-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qemu/Config.in      | 43 +++++++++++++++++++++++++------------------
 package/qemu/Config.in.host | 17 +++++++++--------
 2 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 082b5ee..aced2be 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -19,18 +19,20 @@ config BR2_PACKAGE_QEMU
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_ZLIB
 	help
-	  QEMU is a generic and open source machine emulator and virtualizer.
+	  QEMU is a generic and open source machine emulator and
+	  virtualizer.
 
-	  When used as a machine emulator, QEMU can run OSes and programs made
-	  for one machine (e.g. an ARM board) on a different machine (e.g.
-	  your own PC). By using dynamic translation, it achieves very good
-	  performance.
+	  When used as a machine emulator, QEMU can run OSes and
+	  programs made for one machine (e.g. an ARM board) on a
+	  different machine (e.g. your own PC). By using dynamic
+	  translation, it achieves very good performance.
 
-	  When used as a virtualizer, QEMU achieves near native performances
-	  by executing the guest code directly on the host CPU. QEMU supports
-	  virtualization when executing under the Xen hypervisor or using the
-	  KVM kernel module in Linux. When using KVM, QEMU can virtualize x86,
-	  server and embedded PowerPC, and S390 guests.
+	  When used as a virtualizer, QEMU achieves near native
+	  performances by executing the guest code directly on the host
+	  CPU. QEMU supports virtualization when executing under the Xen
+	  hypervisor or using the KVM kernel module in Linux. When using
+	  KVM, QEMU can virtualize x86, server and embedded PowerPC, and
+	  S390 guests.
 
 	  http://qemu.org/
 
@@ -41,7 +43,8 @@ comment "Emulators selection"
 config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
 	string "Enable specific targets"
 	help
-	  Enter here the list of QEMU targets you want to build. For example:
+	  Enter here the list of QEMU targets you want to build. For
+	  example:
 
 	    System emulation      | User-land emulation
 	    ----------------------+-----------------------
@@ -62,7 +65,8 @@ config BR2_PACKAGE_QEMU_SYSTEM
 	depends on !BR2_STATIC_LIBS # dtc
 	select BR2_PACKAGE_QEMU_FDT
 	help
-	  Say 'y' to build all system emulators/virtualisers that QEMU supports.
+	  Say 'y' to build all system emulators/virtualisers that QEMU
+	  supports.
 
 comment "systems emulation needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
@@ -70,7 +74,8 @@ comment "systems emulation needs a toolchain w/ dynamic library"
 config BR2_PACKAGE_QEMU_LINUX_USER
 	bool "Enable all Linux user-land emulation"
 	help
-	  Say 'y' to build all Linux user-land emulators that QEMU supports.
+	  Say 'y' to build all Linux user-land emulators that QEMU
+	  supports.
 
 # Note: bsd-user can not be build on Linux
 
@@ -78,7 +83,9 @@ endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
 config BR2_PACKAGE_QEMU_HAS_EMULS
 	def_bool y
-	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
+	depends on BR2_PACKAGE_QEMU_SYSTEM || \
+		BR2_PACKAGE_QEMU_LINUX_USER || \
+		BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
 
 if BR2_PACKAGE_QEMU_HAS_EMULS
 
@@ -88,8 +95,8 @@ config BR2_PACKAGE_QEMU_SDL
 	bool "Enable SDL frontend"
 	select BR2_PACKAGE_SDL
 	help
-	  Say 'y' to enable the SDL frontend, that is, a graphical window
-	  presenting the VM's display.
+	  Say 'y' to enable the SDL frontend, that is, a graphical
+	  window presenting the VM's display.
 
 comment "Misc. features"
 
@@ -98,8 +105,8 @@ config BR2_PACKAGE_QEMU_FDT
 	depends on !BR2_STATIC_LIBS # dtc
 	select BR2_PACKAGE_DTC
 	help
-	  Say 'y' here to have QEMU capable of constructing Device Trees,
-	  and passing them to the VMs.
+	  Say 'y' here to have QEMU capable of constructing Device
+	  Trees, and passing them to the VMs.
 
 comment "FDT support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index c5c3f05..e9b944b 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -3,15 +3,16 @@ config BR2_PACKAGE_HOST_QEMU
 	# So far, we only build the user mode emulation, so this list
 	# of architecture dependencies only takes into account this
 	# emulation mode.
-	depends on BR2_arm       || BR2_armeb       || BR2_aarch64      || \
-		BR2_i386         || BR2_m68k        || BR2_microblazeel || \
-		BR2_microblazebe || BR2_mips        || BR2_mipsel       || \
-		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
-		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
-		BR2_sparc        || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || \
+		BR2_m68k || BR2_microblazeel || BR2_microblazebe || \
+		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el \
+		|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		BR2_sh || BR2_sparc || BR2_x86_64
 	help
-	  QEMU is a generic and open source machine emulator and virtualizer.
+	  QEMU is a generic and open source machine emulator and
+	  virtualizer.
 
-	  This option builds a user emulator for your selected architecture.
+	  This option builds a user emulator for your selected
+	  architecture.
 
 	  http://www.qemu.org
-- 
2.4.10
