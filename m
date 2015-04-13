From: Erico Nunes <erico.nunes@datacom.ind.br>
Date: Mon, 13 Apr 2015 16:53:25 -0300
Subject: [Buildroot] [PATCH 2/2] qt: Fix powerpc64le arch config name
In-Reply-To: <1428954805-27236-1-git-send-email-erico.nunes@datacom.ind.br>
References: <1428954805-27236-1-git-send-email-erico.nunes@datacom.ind.br>
Message-ID: <1428954805-27236-2-git-send-email-erico.nunes@datacom.ind.br>
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
 package/qt/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index a40b6b5..43f5a0f 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -412,7 +412,7 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
 		BR2_microblazebe || BR2_mips || BR2_mipsel || \
 		(BR2_mips64 || BR2_mips64el) && !BR2_MIPS_NABI32 || BR2_powerpc || \
-		BR2_powerpc64 || BR2_powerpc64el || BR2_sh4 || BR2_sh4eb || \
+		BR2_powerpc64 || BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
 		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64
 
 config BR2_PACKAGE_QT_WEBKIT
@@ -453,7 +453,7 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
 	default y if BR2_arm || BR2_armeb || aarch64 || BR2_i386 || \
 		BR2_microblazeel || BR2_microblazebe || BR2_mips || BR2_mipsel || \
 		BR2_mips64 || BR2_mips64el || BR2_nios2 || BR2_powerpc || \
-		BR2_powerpc64 || BR2_powerpc64el || BR2_sh4 || BR2_sh4eb || \
+		BR2_powerpc64 || BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
 		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64
 
 config BR2_PACKAGE_QT_SCRIPT
-- 
1.9.1
