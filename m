From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 14:28:59 +0200
Subject: [Buildroot] [git commit branch/next] powerpc: add
	BR2_POWERPC_CPU_HAS_SPE to replace adhoc deps/checks
Message-ID: <20140526123008.A53CB9C963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4c824562bb120796ff0f5b90ebd7233929a3ffa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.powerpc |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 5f9f473..cb8935c 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -1,3 +1,6 @@
+config BR2_POWERPC_CPU_HAS_SPE
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_powerpc || BR2_powerpc64le
@@ -62,8 +65,10 @@ config BR2_powerpc_970
 	bool "970"
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
+	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_8548
 	bool "8548 / e500v2"
+	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_e300c2
 	bool "e300c2"
 config BR2_powerpc_e300c3
@@ -75,17 +80,17 @@ endchoice
 choice
 	prompt "Target ABI"
 	depends on BR2_powerpc || BR2_powerpc64le
-	default BR2_powerpc_SPE if BR2_powerpc_8540 || BR2_powerpc_8548
+	default BR2_powerpc_SPE if BR2_POWERPC_CPU_HAS_SPE
 	default BR2_powerpc_CLASSIC
 	help
 	  Application Binary Interface to use
 
 config BR2_powerpc_CLASSIC
 	bool "Classic"
-	depends on !(BR2_powerpc_8540 || BR2_powerpc_8548)
+	depends on !BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_SPE
 	bool "SPE"
-	depends on BR2_powerpc_8540 || BR2_powerpc_8548
+	depends on BR2_POWERPC_CPU_HAS_SPE
 endchoice
 
 config BR2_POWERPC_SOFT_FLOAT
