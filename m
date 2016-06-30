From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:14:33 +0200
Subject: [Buildroot] [git commit] go: disable for MIPS R6
Message-ID: <20160630221459.A0A8E82193@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82c114b2271ededdf74643d7f0a2032e25b986a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MIPS R6 support in Go has not yet been developed.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
