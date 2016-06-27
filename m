From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jun 2016 15:06:25 +0200
Subject: [Buildroot] [git commit] m68k: gcc coldfire does not provide _sync
	atomics
Message-ID: <20160627130723.566B87FFD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df00b174f6c965be52d58a7911cec74de1426f8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Trying to use __sync_fetch_and_add ends with a gcc ICE.
This fixes following autobuild failure, by actually disabling
the package for coldfire:
http://autobuild.buildroot.net/results/d719db11210d42501332586b4485ab0cc1e125dd/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 1fe28a9..847c905 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -331,6 +331,7 @@ config BR2_TOOLCHAIN_HAS_SYNC_1
 	bool
 	default y
 	depends on !BR2_bfin
+	depends on !BR2_m68k_cf
 	depends on !BR2_microblaze
 	depends on !BR2_sparc
 	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
@@ -342,6 +343,7 @@ config BR2_TOOLCHAIN_HAS_SYNC_2
 config BR2_TOOLCHAIN_HAS_SYNC_4
 	bool
 	default y
+	depends on !BR2_m68k_cf
 	depends on !BR2_sparc
 	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 
