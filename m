From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 22:02:01 +0200
Subject: [Buildroot] [git commit] toolchain/musl: disable for PowerPC SPE
Message-ID: <20140913200533.F12AE9D68A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7d77fc36e18b8ccf609311c306b86bc5564f0e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's not supported and the build breaks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index eef9f9c..53d86dd 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -84,6 +84,7 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl (experimental)"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblaze || \
 		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
+	depends on !BR2_powerpc_SPE # not supported, build breaks
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the
