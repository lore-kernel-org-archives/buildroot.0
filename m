From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 22:53:06 +0200
Subject: [Buildroot] [git commit] package/numactl: add
 BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
Message-ID: <20200604205520.08B7182640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fc4c604a9ca2171b1241986d907b890180bf5da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For use in other packages that select numactl.

Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/numactl/Config.in | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/numactl/Config.in b/package/numactl/Config.in
index 8ea07bb856..cd47f2f9a9 100644
--- a/package/numactl/Config.in
+++ b/package/numactl/Config.in
@@ -1,9 +1,15 @@
-config BR2_PACKAGE_NUMACTL
-	bool "numactl"
+config BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
+	bool
 	# numactl uses some system calls that are not available on all
 	# architectures.
-	depends on BR2_aarch64 || BR2_i386 || BR2_mips || BR2_mipsel || \
-		BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
+	default y if BR2_aarch64
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel ||  BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc
+
+config BR2_PACKAGE_NUMACTL
+	bool "numactl"
+	depends on BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
 	help
 	  numactl allows you to run your application on specific cpus
 	  and memory nodes. It does this by supplying a NUMA memory
