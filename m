From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 May 2014 23:27:58 +0200
Subject: [Buildroot] [git commit] toolchain-buildroot: only allow the
	selection of Musl for Microblaze BE
Message-ID: <20140530212820.966739CE4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a55542e9858e75af75eaadff5cfeddfce7657e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Musl C library only supports Microblaze BE, not Microblaze LE, so
this commit adjusts the dependencies of the toolchain-buildroot
package to not allow the selection of Musl on Microblaze LE.

Cc: William Welch <bvwelch@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 216f9db..840668c 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -80,7 +80,7 @@ comment "(e)glibc only available with shared lib support"
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl (experimental)"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblaze || \
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazebe || \
 		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
