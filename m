From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 22:14:28 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-common.in: adjust
	BR2_TOOLCHAIN_HAS_GCC_BUG_64735 for GCC 7
Message-ID: <20170606201447.18E1682A2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d49b47d165c1eafb326f7473b6e94032b1e08fd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As GCC 7 is now available in Buildroot, update the definition for
BR2_TOOLCHAIN_HAS_GCC_BUG_64735 as the bug #64735 is fixed in GCC 7.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index d670f44..ed993dd 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -17,6 +17,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	default y if BR2_ARM_CPU_ARMV4
 	default y if BR2_ARM_CPU_ARMV5
 	default y if BR2_sparc_v8
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
