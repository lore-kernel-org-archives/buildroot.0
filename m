From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:31:28 +0100
Subject: [Buildroot] [git commit] toolchain/toolchain-common.in: fix
	definition of BR2_TOOLCHAIN_HAS_GCC_BUG_64735
Message-ID: <20170209203236.5D20A82135@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ded5a12482ff8cc7cca800979a4fe4f55a2bb088
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rework done on commit
accba02a47942b54c01b506512ddccf34d57c357 ("toolchain: add option for
toolchains affected by GCC PR libstdc++/64735") by me was wrong. The
BR2_TOOLCHAIN_HAS_GCC_BUG_64735 option should be enabled when the bug is
present in the toolchain, not the opposite.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index c64f204..96d5709 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -13,11 +13,10 @@ comment "Toolchain Generic Options"
 # ints before GCC 7
 config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	bool
-	default y
-	depends on !BR2_nios2
-	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_ARM_CPU_ARMV5
-	depends on !BR2_sparc_v8
+	default y if BR2_nios2
+	default y if BR2_ARM_CPU_ARMV4
+	default y if BR2_ARM_CPU_ARMV5
+	default y if BR2_sparc_v8
 
 # https://sourceware.org/bugzilla/show_bug.cgi?id=19405
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
