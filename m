From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 16:58:11 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-common.in: add
	BR2_TOOLCHAIN_HAS_LIBQUADMATH hidden symbol
Message-ID: <20160703145820.44FEC81E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b16f8c7876482864b391963588362e5bdbd99d01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This hidden symbol allow to know when libquadmath can be built and
installed.

Also, declaring this symbol in toolchain-common.in allows to use it in
both external and buildroot toolchain backend.

This will be needed for adding/improving the fortran support.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 847c905..96ce3d1 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -419,3 +419,13 @@ config BR2_TOOLCHAIN_HAS_ATOMIC
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_armeb
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_xtensa
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_ARCH_IS_64
+
+# - libquadmath is not needed/available on all architectures (but gcc
+#   correctly handles this already).
+# - At least, libquadmath is available on:
+#   - i*86
+#   - x86_64
+# - When available, libquadmath requires wchar support.
+config BR2_TOOLCHAIN_HAS_LIBQUADMATH
+	bool
+	default y if BR2_i386 || BR2_x86_64
