From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 3 Jan 2014 14:36:19 +0000
Subject: [Buildroot] [PATCH v2] Disable MIPS64 ISAs for MIPS32 targets
Message-ID: <1388759779-27871-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently you can select MIPS64 ISAs, like mips64 and mips64r2, for
MIPS32 targets. This is incorrect, so we disable the possibility to do
that.

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
---
 arch/Config.in.mips |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 4121200..9b3fff4 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -29,8 +29,10 @@ config BR2_mips_32r2
 	depends on !BR2_ARCH_IS_64
 config BR2_mips_64
 	bool "mips 64"
+	depends on BR2_ARCH_IS_64
 config BR2_mips_64r2
 	bool "mips 64r2"
+	depends on BR2_ARCH_IS_64
 endchoice
 
 
-- 
1.7.1
