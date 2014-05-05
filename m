From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 May 2014 23:53:18 +0200
Subject: [Buildroot] [git commit] toolchain-buildroot: add support for
	building musl toolchains
Message-ID: <20140506081939.2C8DD9C5E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a84f478d3c9abdd7f695083bcfa710fad281bbaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 42166d2..1bd3f92 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -77,6 +77,15 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 comment "(e)glibc only available with shared lib support"
 	depends on BR2_PREFER_STATIC_LIB
 
+config BR2_TOOLCHAIN_BUILDROOT_MUSL
+	bool "musl (experimental)"
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblaze || \
+		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
+	select BR2_TOOLCHAIN_USES_MUSL
+	help
+	  This option selects musl as the C library for the
+	  cross-compilation toolchain.
+
 endchoice
 
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
@@ -86,6 +95,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	# 'glibc'
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
+	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
