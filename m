From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Nov 2013 13:44:27 +0100
Subject: [Buildroot] [git commit] Mark MIPS I, II, III and IV as deprecated
Message-ID: <20131120124648.9DA8A9BD5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=831dad2d61bcf4daf25778bc41aef40d55e8ead6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Deprecate old MIPS ISAs since they are rarely used anymore and they cause
multiple build problems for new packages

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.mips |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index d70fd63..4121200 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -1,8 +1,7 @@
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	default BR2_mips_3 if BR2_mips
-	default BR2_mips_1 if BR2_mipsel
+	default BR2_mips_32 if BR2_mips || BR2_mipsel
 	default BR2_mips_64 if BR2_mips64 || BR2_mips64el
 	help
 	  Specific CPU variant to use
@@ -12,14 +11,16 @@ choice
 
 config BR2_mips_1
 	bool "mips I (generic)"
-	depends on !BR2_ARCH_IS_64
+	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED
 config BR2_mips_2
 	bool "mips II"
-	depends on !BR2_ARCH_IS_64
+	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED
 config BR2_mips_3
 	bool "mips III"
+	depends on BR2_DEPRECATED
 config BR2_mips_4
 	bool "mips IV"
+	depends on BR2_DEPRECATED
 config BR2_mips_32
 	bool "mips 32"
 	depends on !BR2_ARCH_IS_64
