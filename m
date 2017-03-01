From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 21:55:21 +0100
Subject: [Buildroot] [git commit] classpath: enable on sparc and sparc64
Message-ID: <20170301205529.7057F8226D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9951d5c931c419a32d31cc2a67d3a5c388efbed6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU classpath builds fine on sparc and sparc64 architectures. So
we allow building it there to be consistent with the naming of
BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS.

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/classpath/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/classpath/Config.in b/package/classpath/Config.in
index c49ff7a..8051523 100644
--- a/package/classpath/Config.in
+++ b/package/classpath/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
 	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k \
 		|| BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el \
 		|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le \
-		|| BR2_sh || BR2_x86_64
+		|| BR2_sparc || BR2_sparc64 || BR2_sh || BR2_x86_64
 
 config BR2_PACKAGE_CLASSPATH
 	bool "classpath"
