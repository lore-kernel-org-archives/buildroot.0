From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:10:28 +0100
Subject: [Buildroot] [git commit] package/libaio: enable on powerpc64(le)
Message-ID: <20170309211234.D5611822D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1916f29e97e1bdb043f9cba17d203ba0843826f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libaio has support for powerpc64(le), so enable the corresponding
package on those architectures.

Signed-off-by: Daniel Black <daniel.black@au.ibm.com>
Acked-by: Cyril Bur <cyrilbur@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libaio/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index 3031c89..ea21a36 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_m68k || BR2_mips || BR2_mipsel || BR2_powerpc || \
-		BR2_sparc || BR2_x86_64
+		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || \
+		BR2_x86_64
 
 config BR2_PACKAGE_LIBAIO
 	bool "libaio"
