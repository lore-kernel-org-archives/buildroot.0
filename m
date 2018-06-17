From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:49:49 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/binutils: default
 to 2.28 for Cortex-M targets
Message-ID: <20180617150241.4154381213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3dddb0a787352bb836ce972e4f07b59d79068e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

binutils 2.29 changed the implementation of adr pseudo instruction
it breaks linux kernel and impacts Cortex-M targets (eg. stm32)

[Peter: simplify Config.in logic, adjust message to make it clear this is
	just a default]
Signed-off-by: Laurent GONZALEZ <br22@gezedo.com>
Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 17f352acdebd4a825903807f8a2d60ebea223afb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index d4ed1e3183..c41be82969 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,6 +2,7 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
+	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_CPU_ARMV7M
 	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
