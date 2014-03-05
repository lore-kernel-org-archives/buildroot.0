From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Mar 2014 17:06:27 +0000
Subject: [Buildroot] [PATCH] Disable o32 ABI for MIPS64 architectures
Message-ID: <1394039187-24328-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building o32 ELF files for MIPS64 is an exotic configuration that nobody
should be using. If o32 is required, then is better if it's built for
MIPS 32-bit cores so only 32-bit instructions will be used leading to a
more efficient o32 usage.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index d9c0c02..e2b1e60 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -47,6 +47,7 @@ choice
 
 config BR2_MIPS_OABI32
 	bool "o32"
+	depends on !BR2_ARCH_IS_64
 config BR2_MIPS_NABI32
 	bool "n32"
 	depends on BR2_ARCH_IS_64
-- 
1.7.1
