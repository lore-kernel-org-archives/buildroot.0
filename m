From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:31:26 +0200
Subject: [Buildroot] [git commit] apf9328: Fix build error
Message-ID: <20130421213525.767259B793@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49f836380a5b110b583210f28781204e45982b86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a0b6faa ("gdb: convert to the package infrastructure") changed
the name of the host gdb configuration option, and added it to the
legacy option set, leading to a build breakage for the
armadeus_apf9328_defconfig.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/armadeus_apf9328_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index 1ed1dd5..33e9a76 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -6,7 +6,7 @@ BR2_arm920t=y
 BR2_STRIP_sstrip=y
 BR2_GCC_VERSION_4_4_X=y
 BR2_PACKAGE_GDB=y
-BR2_PACKAGE_GDB_HOST=y
+BR2_PACKAGE_HOST_GDB=y
 BR2_ENABLE_LOCALE_PURGE=y
 BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
 BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
