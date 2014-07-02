From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 17:10:32 +0200
Subject: [Buildroot] [git commit] binutils: Use the default version by
	default on MIPS
Message-ID: <20140702151502.A11209D144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f1cf344d90ea3eabf292b04d993a7be2a785dd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
