From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:31:21 +0200
Subject: [Buildroot] [git commit] ltrace: enable for mips/mipsel
Message-ID: <20150704123758.808327FC16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d23cce19c299e3010ba2dca84ab4ad35eff3cdbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ltrace was disabled for MIPS due to a build failure on this
architecture. Now that problem has been fixed so we can enable this
package again.

Related:
http://git.buildroot.net/buildroot/commit/?id=dfaa18af00dfcff71a0159adaafb0880e58fa6a1
http://anonscm.debian.org/cgit/collab-maint/ltrace.git/commit/?id=a8ff0ff2b6e6c229f8a9242828fb47f1a5a78967

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltrace/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index af932df..2b42a84 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LTRACE
 	# broken (error: 'struct ltelf' has no member named
 	# 'relplt_count'). Issue reported upstream at
 	# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=756764.
-	depends on (BR2_i386 || BR2_arm \
+	depends on (BR2_i386 || BR2_arm || BR2_mips || BR2_mipsel \
 		|| BR2_powerpc || BR2_sparc || BR2_x86_64 || BR2_xtensa)
 	select BR2_PACKAGE_ELFUTILS
 	depends on BR2_USE_WCHAR # elfutils
