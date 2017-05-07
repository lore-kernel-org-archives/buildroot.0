From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 14:11:16 +0200
Subject: [Buildroot] [git commit] configs/armadeus_apf9328_defconfig: remove
	RPC option
Message-ID: <20170507121250.AC0318286E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=423e1381b426eb63695b1bc36c2d60aaf4001cf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_TOOLCHAIN_BUILDROOT_INET_RPC has been removed in commit
98f7de8796b282e72d42d3fc4d82d8eec43c6053, following the removal from
upstream uClibc-ng of the RPC support.

However, armadeus_apf9328_defconfig was selecting this option, causing a
build failure due to the selection of a legacy option. We simply remove
it as anyway defconfigs should not needlessly enable toolchain options.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/builds/15762159

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/armadeus_apf9328_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index fbc9864..8abfcfd 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -6,7 +6,6 @@ BR2_arm920t=y
 BR2_PACKAGE_GDB=y
 BR2_PACKAGE_HOST_GDB=y
 BR2_ENABLE_LOCALE_PURGE=y
-BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
