From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:50:33 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/binutils: extend
 the 2.28 default to thumb mode
Message-ID: <20180617150241.5229081213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e49c982308228fceb514216ab4fdb8472bb4ce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Commit 17f352ac (package/binutils: default to 2.29 for Cortex-M targets)
made the default version 2.28 (and not 2.29!) when the target is an
arm-v7m CPU.

However, the real trigger is compilation in Thumb mode, not the fact
that the target is v7m.

The fact that it was noticed on a v7m target is because Thumb is the
only mode valid on those CPUs.

Tighten the defaults to 2.28 for Thumb and Thumb2 modes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Laurent GONZALEZ <br22@gezedo.com>
Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3dbc5a62798d0f804a9a931b5dbd1c3a2a419ab2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index c41be82969..bc0e223e9f 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,7 +2,8 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_CPU_ARMV7M
+	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB
+	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB2
 	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
