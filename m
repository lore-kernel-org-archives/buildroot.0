From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 22:50:40 +0100
Subject: [Buildroot] [git commit] arch: introduce BR2_BINFMT_SUPPORTS_SHARED
Message-ID: <20141211215300.B77FE80193@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b85837e5d6d2b49fb97b86af362b84aa4669af6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the refactoring of the static/shared library
support, we add a BR2_BINFMT_SUPPORTS_SHARED hidden option that binary
formats supporting shared libraries should select.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index c05e5d7..c7bef5d 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -251,6 +251,10 @@ config BR2_GCC_TARGET_MODE
 config BR2_ARCH_HAS_ATOMICS
 	bool
 
+# Must be selected by binary formats that support shared libraries.
+config BR2_BINFMT_SUPPORTS_SHARED
+	bool
+
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
@@ -261,6 +265,7 @@ choice
 config BR2_BINFMT_ELF
 	bool "ELF"
 	depends on !BR2_bfin && !BR2_m68k
+	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF (Executable and Linkable Format) is a format for libraries and
 	  executables used across different architectures and operating
@@ -269,6 +274,7 @@ config BR2_BINFMT_ELF
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
 	depends on BR2_bfin
+	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual load
 	  segments of a binary to be located in memory independently of each
@@ -307,6 +313,7 @@ config BR2_BINFMT_FLAT_SEP_DATA
 config BR2_BINFMT_FLAT_SHARED
 	bool "Shared binary"
 	depends on BR2_bfin || BR2_m68k
+	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  Allow to load and link indiviual FLAT binaries at run time.
 
