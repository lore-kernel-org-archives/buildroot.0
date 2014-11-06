From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 00:13:49 +0100
Subject: [Buildroot] [git commit] arch/powerpc: get rid of
	BR2_GCC_TARGET_TUNE
Message-ID: <20141106233447.2FBD9B1487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75418c4cf678a3c34352bd7a781296937815681d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the gcc documentation for PowerPC options:

'-mtune=CPU_TYPE'
     Set the instruction scheduling parameters for machine type
     CPU_TYPE, but do not set the architecture type, register usage, or
     choice of mnemonics, as '-mcpu=CPU_TYPE' would.  The same values
     for CPU_TYPE are used for '-mtune' as for '-mcpu'.  If both are
     specified, the code generated will use the architecture, registers,
     and mnemonics set by '-mcpu', but the scheduling parameters set by
     '-mtune'.

In the case of Buildroot where we only target a specific system, using
-mtune therefore doesn't make much sense, and using -mcpu would be
more appropriate. As a consequence, this patch makes PowerPC use
BR2_GCC_TARGET_CPU instead of BR2_GCC_TARGET_TUNE.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.powerpc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 239f5dc..fabee9f 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -160,7 +160,7 @@ config BR2_ENDIAN
 config BR2_ARCH_HAS_ATOMICS
 	default y
 
-config BR2_GCC_TARGET_TUNE
+config BR2_GCC_TARGET_CPU
 	default "401"		if BR2_powerpc_401
 	default "403"		if BR2_powerpc_403
 	default "405"		if BR2_powerpc_405
