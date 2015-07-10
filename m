From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Jul 2015 17:11:15 +0200
Subject: [Buildroot] [PATCH] buildroot-test: br-mips64-n64-glibc toolchain
	is only for hard float
Message-ID: <1436541075-18777-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it will fail with errors like this one:

/br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/gnu/stubs.h:32:33:
fatal error: gnu/stubs-n64_soft.h: No such file or directory

Fixes:

  http://autobuild.buildroot.net/results/5ce/5cefa90f2a19ed55ae88d938bf134dbdbfc7b9c2/
  http://autobuild.buildroot.net/results/85f/85fa358930474c608b558176a8eac77a5844d94b/
  http://autobuild.buildroot.net/results/fa4/fa4310bea91682ae42b09ba0584f0261f1cb2d08/
  http://autobuild.buildroot.net/results/d34/d345c568fbfbacf3d62a94fae995983127e0d629/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 web/toolchains/configs/br-mips64-n64-glibc.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/web/toolchains/configs/br-mips64-n64-glibc.config b/web/toolchains/configs/br-mips64-n64-glibc.config
index a11f4df..3acc091 100644
--- a/web/toolchains/configs/br-mips64-n64-glibc.config
+++ b/web/toolchains/configs/br-mips64-n64-glibc.config
@@ -1,5 +1,6 @@
 BR2_mips64el=y
 BR2_MIPS_NABI64=y
+# BR2_MIPS_SOFT_FLOAT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-- 
2.3.6
