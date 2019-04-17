From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 09:03:37 +0200
Subject: [Buildroot] [git commit] arch: add support for Andes 32-bit (nds32)
Message-ID: <20190417074344.F22237F9A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ad1d3d5cff33d4d28775450a5368148ccfedaa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit provides basic support for the Andes 32-bit (nds32)
architecture.

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
Signed-off-by: Greentime Hu <greentime@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS           |  3 +++
 arch/Config.in       | 12 ++++++++++++
 arch/Config.in.nds32 | 11 +++++++++++
 3 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 45986c9dc7..db2c27c423 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1667,6 +1667,9 @@ F:	package/trousers/
 N:	Norbert Lange <nolange79@gmail.com>
 F:	package/tcf-agent/
 
+N:	Nylon Chen <nylon7@andestech.com>
+F:	arch/Config.in.nds32
+
 N:	Olaf Rempel <razzor@kopf-tisch.de>
 F:	package/ctorrent/
 
diff --git a/arch/Config.in b/arch/Config.in
index f50760a0cf..d82803c828 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -154,6 +154,14 @@ config BR2_mips64el
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
+config BR2_nds32
+	bool "nds32"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
+	select BR2_ARCH_HAS_MMU_MANDATORY
+	help
+	  nds32 is a 32-bit architecture developed by Andes Technology.
+	  https://en.wikipedia.org/wiki/Andes_Technology
+
 config BR2_nios2
 	bool "Nios II"
 	select BR2_ARCH_HAS_MMU_MANDATORY
@@ -419,6 +427,10 @@ if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
 source "arch/Config.in.mips"
 endif
 
+if BR2_nds32
+source "arch/Config.in.nds32"
+endif
+
 if BR2_nios2
 source "arch/Config.in.nios2"
 endif
diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
new file mode 100644
index 0000000000..9c5db20e6f
--- /dev/null
+++ b/arch/Config.in.nds32
@@ -0,0 +1,11 @@
+config BR2_ARCH
+	default "nds32"
+
+config BR2_GCC_TARGET_ARCH
+	default "v3"
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_READELF_ARCH_NAME
+	default "Andes Technology compact code size embedded RISC processor family"
