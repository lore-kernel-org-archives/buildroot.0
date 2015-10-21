From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Date: Wed, 21 Oct 2015 15:57:56 +0100
Subject: [Buildroot] [PATCH 1/1] configs/xilfpga: Add xilfpga defconfig
Message-ID: <1445439476-32911-1-git-send-email-Zubair.Kakakhel@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Under the IMG University Program 'MIPSfpga', RTL verilog code for a MIPS
m14kEC core is released under an academic license.

The core is used to make a soft-SOC which can run the Linux kernel +
buildroot.

This patch adds a defconfig for it and a readme file.

The config generates a simple mips32r2 rootfs using uClibc.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

---
p.s.

The kernel patches for MIPSfpga will hopefully be upstreamed by 4.4.

Once that is done, I'll look into adding the stuff to enable buildroot
to compile the kernel as well.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 board/xilfpga/readme.txt  | 20 ++++++++++++++++++++
 configs/xilfpga_defconfig |  6 ++++++
 2 files changed, 26 insertions(+)
 create mode 100644 board/xilfpga/readme.txt
 create mode 100644 configs/xilfpga_defconfig

diff --git a/board/xilfpga/readme.txt b/board/xilfpga/readme.txt
new file mode 100644
index 0000000..6ff65b8
--- /dev/null
+++ b/board/xilfpga/readme.txt
@@ -0,0 +1,20 @@
+*********************************************
+* Imagination University Program: MIPSfpga  *
+*********************************************
+
+Under the IMG University Program, academics can receive the
+complete RTL source code for the MIPS microAptiv core under
+an academic license.
+
+The package comes with an example soft-SoC design that can
+run the Linux kernel + Buildroot in RAM on the Nexys4DDR board
+by Digilent.
+
+To create a simple root filesystem that runs on MIPSfpga run:
+
+$> make xilfpga_defconfig
+$> make
+
+This will create a root filesystem under the output/images directory.
+
+This filesystem needs to be built into the kernel as initramfs.
diff --git a/configs/xilfpga_defconfig b/configs/xilfpga_defconfig
new file mode 100644
index 0000000..6e861a8
--- /dev/null
+++ b/configs/xilfpga_defconfig
@@ -0,0 +1,6 @@
+BR2_mipsel=y
+BR2_mips_32r2=y
+BR2_TARGET_GENERIC_HOSTNAME="mipsfpga"
+BR2_TARGET_GENERIC_ISSUE="Welcome to MIPSfpga"
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
-- 
1.9.1
