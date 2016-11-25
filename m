From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:53:26 +0100
Subject: [Buildroot] [git commit branch/next] libatomic_ops: add support for
	MIPS architecture
Message-ID: <20161125215742.23BB17FB96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fa73e6bd692d07bb27a0f1864a30f992d5d5c31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libatomic_ops/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index c6fe7a0..e9206f3 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_sparc64 || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
+	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_sparc64 || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	# Unsupported for MIPS R6
+	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 
 config BR2_PACKAGE_LIBATOMIC_OPS
 	bool "libatomic_ops"
