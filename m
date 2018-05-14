From: Anssi Hannula <anssi.hannula@bitwise.fi>
Date: Mon, 14 May 2018 14:24:21 +0300
Subject: [Buildroot] [PATCH] ltrace: allow selection on aarch64
Message-ID: <20180514112421.29379-1-anssi.hannula@bitwise.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltrace works fine on aarch64, so allow enabling it on that architecture.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
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
-- 
2.16.3
