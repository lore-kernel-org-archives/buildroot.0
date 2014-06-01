From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 17:28:57 +0200
Subject: [Buildroot] [git commit] reenable microblaze little endian for
	internal musl toolchain
Message-ID: <20140601200640.C4DE89CE45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7a257365eb27b8fc238da6e7be0c6070fa75463
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The assumption that musl libc does not support microblaze
little endian mode is wrong. See
http://git.musl-libc.org/cgit/musl/tree/configure line
number 447-448.

Tested with qemu. Just revert previous commit as suggested by
Thomas Petazzoni.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index e27a4a9..eef9f9c 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -82,7 +82,7 @@ comment "(e)glibc only available with shared lib support"
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl (experimental)"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazebe || \
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblaze || \
 		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
