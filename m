From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 19:56:20 +0100
Subject: [Buildroot] [git commit] arch/arm: use EABIhf by default with VFP
Message-ID: <20151025200324.E1882818D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc0773f2a89f30b252532e771cf4ffa513f57f2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set EABIhf as the default target ABI for the ARM processors that have or
may have a VFP unit, since this ABI is the most efficient in that case.
Of course, EABI can still be selected manually if needed.

[Peter: only default to EABIHF when we are sure the CPU has a VFP]
Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arm |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 4d10f4c..db7b8f2 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -188,6 +188,7 @@ endchoice
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
+	default BR2_ARM_EABIHF if BR2_ARM_CPU_HAS_VFPV2
 	default BR2_ARM_EABI
 	help
 	  Application Binary Interface to use. The Application Binary
