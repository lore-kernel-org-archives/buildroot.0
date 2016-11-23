From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Nov 2016 14:39:13 +0000
Subject: [Buildroot] [PATCH next 5/6] libatomic_ops: add support for MIPS
	architecture
In-Reply-To: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
References: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
Message-ID: <20161123143914.3969-5-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.10.1
