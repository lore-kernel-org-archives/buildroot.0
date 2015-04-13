From: Erico Nunes <erico.nunes@datacom.ind.br>
Date: Mon, 13 Apr 2015 16:53:24 -0300
Subject: [Buildroot] [PATCH 1/2] valgrind: Fix powerpc64le arch config name
Message-ID: <1428954805-27236-1-git-send-email-erico.nunes@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buildroot references powerpc64 little endian as "powerpc64le" and not
"powerpc64el". The typo in the supported architectures list caused this
package to be unavailable for powerpc64 little endian.

Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
---
 package/valgrind/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index d9116dd..8da007b 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_VALGRIND
 	bool "valgrind"
 	depends on BR2_ARM_CPU_ARMV7A || BR2_i386 || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64el || \
+		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
 		   BR2_x86_64
 	help
 	  Tool for debugging and profiling Linux programs.
-- 
1.9.1
