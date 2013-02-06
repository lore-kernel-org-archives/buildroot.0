From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  7 Feb 2013 00:51:24 +0100
Subject: [Buildroot] [PATCH] arm: deprecate OABI
Message-ID: <1360194684-29302-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The BR2_ARM_EABI config symbol is still kept in order to minimize
the impact.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 arch/Config.in.arm |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b681d27..37152c0 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -68,6 +68,7 @@ config BR2_arm1136jf_s
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
+	depends on BR2_DEPRECATED
 	default BR2_ARM_EABI
 	help
 	  Application Binary Interface to use
@@ -82,6 +83,10 @@ config BR2_ARM_OABI
 	depends on !BR2_GCC_VERSION_4_7_X
 endchoice
 
+config BR2_ARM_EABI
+	default y
+	depends on !BR2_DEPRECATED
+
 config BR2_ARM_ENABLE_NEON
 	bool "Enable NEON SIMD extension support"
 	depends on BR2_ARM_CPU_MAYBE_HAS_NEON
-- 
1.7.10.4
