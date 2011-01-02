From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jan 2011 00:25:38 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/gcc: fix target-gcc
	selects
Message-ID: <20110102232606.773598E203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6ca4e7ce970447fc5c6312e5f414b91b306b9f0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to select BR2_PACKAGE_BINUTILS as well, now
BINUTILS_TARGET depends on it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in.2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
index 9676fdf..705506b 100644
--- a/toolchain/gcc/Config.in.2
+++ b/toolchain/gcc/Config.in.2
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GCC_TARGET
 	bool "native toolchain in the target filesystem"
 	depends on BR2_HAVE_DEVFILES
+	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_BINUTILS_TARGET
 	select BR2_PACKAGE_MPC if BR2_GCC_VERSION_4_5_X
 	select BR2_PACKAGE_MPFR
-- 
1.7.2.2
