From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 3 Jul 2015 13:05:24 +0200
Subject: [Buildroot] [PATCH v2 2/2] ltrace: enable for mips/mipsel
In-Reply-To: <1435921524-31825-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435921524-31825-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1435921524-31825-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltrace was disabled for MIPS due to a build failure on this
architecture. Now that problem has been fixed so we can enable this
package again.

Related:
http://git.buildroot.net/buildroot/commit/?id=dfaa18af00dfcff71a0159adaafb0880e58fa6a1
http://anonscm.debian.org/cgit/collab-maint/ltrace.git/commit/?id=a8ff0ff2b6e6c229f8a9242828fb47f1a5a78967

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
v1 -> v2: no changes

 package/ltrace/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.3.6
