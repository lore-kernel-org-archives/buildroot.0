From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jun 2013 00:05:36 +0200
Subject: [Buildroot] [git commit] toolchain-external: add arch conditionals
	on Arago ARMv5TE toolchain
Message-ID: <20130611100808.D852B9AC6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3d6e6cfd7c024d16fb3d21f47e5b9aa241bfefa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9798840..4dc45cd 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -157,6 +157,9 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	bool "Arago ARMv5 2011.09"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_GCC_TARGET_ARCH != "armv4t" && \
+		BR2_GCC_TARGET_ARCH != "armv4" && \
+		BR2_GCC_TARGET_ARCH != "armv5t"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
