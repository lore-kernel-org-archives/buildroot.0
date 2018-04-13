From: Anssi Hannula <anssi.hannula@bitwise.fi>
Date: Fri, 13 Apr 2018 15:13:14 +0300
Subject: [Buildroot] [PATCH] valgrind: allow selection on aarch64
Message-ID: <20180413121314.30943-1-anssi.hannula@bitwise.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

valgrind works fine on aarch64, so allow selecting it on that
architecture.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
---
 package/valgrind/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 75b779d..fba3b1c 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	bool
-	default y if BR2_ARM_CPU_ARMV7A
+	default y if BR2_ARM_CPU_ARMV7A || BR2_aarch64
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
-- 
2.8.3
