From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Jun 2016 09:51:17 +0100
Subject: [Buildroot] [PATCH] go: disable for MIPS R6
Message-ID: <1467017477-3446-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIPS R6 support in Go has not yet been developed.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/go/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 446e505..e1b13c0 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -3,3 +3,5 @@ config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	default y
 	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le || BR2_mips64 || BR2_mips64el
 	depends on !BR2_ARM_CPU_ARMV4
+	# MIPS R6 support in Go has not yet been developed.
+	depends on !BR2_mips_64r6
-- 
2.7.3
