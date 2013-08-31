From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:04 -0000
Subject: [Buildroot] [git commit] eglibc: needs MMU
Message-ID: <20130831213336.C46E59B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eeaf658c980d43c6a531614545334ab98d14bbe0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 396a434..7a26441 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -22,6 +22,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
 		   BR2_x86_64
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our eglibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
