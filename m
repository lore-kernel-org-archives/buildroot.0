From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Feb 2013 08:44:05 +0100
Subject: [Buildroot] [git commit] arm: deprecate OABI
Message-ID: <20130207075103.E53099A92A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4cfa85b798cb744954d35aa05fa41e7a6956abd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_ARM_EABI config symbol is still kept in order to minimize
the impact.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in.arm |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
