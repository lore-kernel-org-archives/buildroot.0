From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 20 Aug 2013 08:59:05 -0300
Subject: [Buildroot] [PATCH 1/2] nios2: Add new architecture
Message-ID: <1376999946-3314-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

This commit adds very basic support to build for the Nios II
architecture. Toolchain support is still missing and instead
we need to use an external custom toolchain.

Notice that this architecture had been previously removed in
Buildroot 2010.05-rc1 release (as explained in the CHANGES file)
and this commit adds it back.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 arch/Config.in       | 11 +++++++++++
 arch/Config.in.nios2 |  5 +++++
 2 files changed, 16 insertions(+)
 create mode 100644 arch/Config.in.nios2

diff --git a/arch/Config.in b/arch/Config.in
index 0b5b218..2495110 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -124,6 +124,13 @@ config BR2_mips64el
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
+config BR2_nios2
+	bool "Nios II"
+	help
+	  Nios II is a soft core processor from Altera Coporation.
+	  http://www.altera.com/
+	  http://en.wikipedia.org/wiki/Nios_II
+
 config BR2_powerpc
 	bool "PowerPC"
 	help
@@ -305,6 +312,10 @@ if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
 source "arch/Config.in.mips"
 endif
 
+if BR2_nios2
+source "arch/Config.in.nios2"
+endif
+
 if BR2_powerpc
 source "arch/Config.in.powerpc"
 endif
diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
new file mode 100644
index 0000000..ed63898
--- /dev/null
+++ b/arch/Config.in.nios2
@@ -0,0 +1,5 @@
+config BR2_ARCH
+	default "nios2"
+
+config BR2_ENDIAN
+	default "LITTLE"
-- 
1.8.1.5
