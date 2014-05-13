From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Mon, 12 May 2014 21:03:18 -0700
Subject: [Buildroot] [PATCH v4 8/9] powerpc: remove unneeded dependencies
In-Reply-To: <1399953799-32054-1-git-send-email-cody@linux.vnet.ibm.com>
References: <1399953799-32054-1-git-send-email-cody@linux.vnet.ibm.com>
Message-ID: <1399953799-32054-9-git-send-email-cody@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
---
 arch/Config.in.powerpc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 6b9a56f..b2f0555 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -6,7 +6,6 @@ config BR2_POWERPC_CPU_HAS_SPE
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_powerpc
 	default BR2_generic_powerpc
 	help
 	  Specific CPU variant to use
@@ -127,7 +126,6 @@ endchoice
 
 choice
 	prompt "Target ABI"
-	depends on BR2_powerpc
 	default BR2_powerpc_SPE if BR2_POWERPC_CPU_HAS_SPE
 	default BR2_powerpc_CLASSIC
 	help
-- 
1.9.3
