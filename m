From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jul 2013 22:30:50 +0200
Subject: [Buildroot] [PATCHv3 4/4] arch/arm: update VFPv2 comment to mention
	ARMv5
In-Reply-To: <1374093050-30344-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1374093050-30344-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1374093050-30344-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 6b3a0417c4 ('arch/arm: arm926 may have VFP') forgot to update
the help text of the VFPv2 option to mention ARMv5. This commit fixes
that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b2fe257..2a0cf45 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -193,8 +193,9 @@ config BR2_ARM_FPU_VFPV2
 	depends on BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	help
 	  This option allows to use the VFPv2 floating point unit, as
-	  available in some ARMv6 processors (ARM1136JF-S,
-	  ARM1176JZF-S and ARM11 MPCore).
+	  available in some ARMv5 processors (ARM926EJ-S) and some
+	  ARMv6 processors (ARM1136JF-S, ARM1176JZF-S and ARM11
+	  MPCore).
 
 	  Note that this option is also safe to use for newer cores
 	  such as Cortex-A, because the VFPv3 and VFPv4 units are
-- 
1.8.1.2
