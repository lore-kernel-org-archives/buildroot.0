From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 17:49:02 +0100
Subject: [Buildroot] [git commit] package/nodejs: fixed comment for mips
	soft float
Message-ID: <20151223174835.CCF5A826EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41118ac9f2a24110f2bd6fb5cd47dae7e97ea71d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nodejs is only selected for mips hard float however the comment is
displayed for hard and soft float.  Correct this by adding the missing
!BR2_MIPS_SOFT_FLOAT to the comment.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 645ca7a..a8eb6d4 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_NODEJS
 comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
