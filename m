From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 21:22:09 +0200
Subject: [Buildroot] [git commit branch/next] powerpc: remove unneeded
	dependencies
Message-ID: <20140526200606.667A29CDD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32a471824bcc0fd11a535c01f9a2a96eefe1d25d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.powerpc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 9a7b2b7..c8a21b5 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -6,7 +6,6 @@ config BR2_POWERPC_CPU_HAS_SPE
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_powerpc || BR2_powerpc64le
 	default BR2_generic_powerpc
 	help
 	  Specific CPU variant to use
@@ -127,7 +126,6 @@ endchoice
 
 choice
 	prompt "Target ABI"
-	depends on BR2_powerpc || BR2_powerpc64le
 	default BR2_powerpc_SPE if BR2_POWERPC_CPU_HAS_SPE
 	default BR2_powerpc_CLASSIC
 	help
