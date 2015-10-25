From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sun, 25 Oct 2015 16:19:40 +0100
Subject: [Buildroot] [PATCH] arch/arm: use EABIhf by default with VFP
In-Reply-To: <87k2qn6gf0.fsf@dell.be.48ers.dk>
References: <87k2qn6gf0.fsf@dell.be.48ers.dk>
Message-ID: <1445786380-2741-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set EABIhf as the default target ABI for the ARM processors that have or
may have a VFP unit, since this ABI is the most efficient in that case.
Of course, EABI can still be selected manually if needed.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
---
 arch/Config.in.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 4d10f4c..f0110b1 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -188,6 +188,7 @@ endchoice
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
+	default BR2_ARM_EABIHF if BR2_ARM_CPU_MAYBE_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV2
 	default BR2_ARM_EABI
 	help
 	  Application Binary Interface to use. The Application Binary
-- 
2.1.4
