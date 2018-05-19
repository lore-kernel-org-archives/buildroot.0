From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:47:57 +0200
Subject: [Buildroot] [git commit branch/next] ltrace: allow selection on
 aarch64
Message-ID: <20180519205528.A928481065@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3212e81e685f4134d8df8d98089b8f4be22f13bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ltrace works fine on aarch64, so allow enabling it on that architecture.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ltrace/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 4d5fb723d6..369f54a12e 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LTRACE
 	# broken (error: 'struct ltelf' has no member named
 	# 'relplt_count'). Issue reported upstream at
 	# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=756764.
-	depends on (BR2_i386 || BR2_arm || BR2_mips || BR2_mipsel \
+	depends on (BR2_i386 || BR2_arm || BR2_aarch64 || BR2_mips || BR2_mipsel \
 		|| BR2_powerpc || BR2_sparc || BR2_x86_64 || BR2_xtensa)
 	select BR2_PACKAGE_ELFUTILS
 	help
