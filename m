From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Jul 2014 10:37:29 +0100
Subject: [Buildroot] [PATCH v2] binutils: Use the default version by default
	on MIPS
Message-ID: <1404293849-19605-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/binutils/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 08540a3..bc21f5e 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,7 +3,7 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
-	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
+	default BR2_BINUTILS_VERSION_2_21 if BR2_sh
 	default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze || BR2_powerpc64le
 	default BR2_BINUTILS_VERSION_2_22
 	help
-- 
1.7.1
