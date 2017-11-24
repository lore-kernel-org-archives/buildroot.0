From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:51:48 +0100
Subject: [Buildroot] [git commit] toolchain/buildroot: glibc requires kernel
 headers >= 4.5 with NaN-2008
Message-ID: <20171201205336.D18AD7FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a5140ecffb75d1dc1f696e149a31744145ac63c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From sysdeps/unix/sysv/linux/mips/configure.ac in glibc:

if test -z "$arch_minimum_kernel"; then
  if test x$libc_cv_mips_nan2008 = xyes; then
    arch_minimum_kernel=4.5.0
  fi
fi

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 25ab667..cbe2038 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -52,6 +52,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on !BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our glibc.mk enables RPC support
