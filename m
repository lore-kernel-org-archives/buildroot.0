From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 May 2014 22:25:49 +0200
Subject: [Buildroot] [PATCH] toolchain-buildroot: only allow the selection
	of Musl for Microblaze BE
Message-ID: <1401481549-23804-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Musl C library only supports Microblaze BE, not Microblaze LE, so
this commit adjusts the dependencies of the toolchain-buildroot
package to not allow the selection of Musl on Microblaze LE.

Cc: William Welch <bvwelch@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.3
