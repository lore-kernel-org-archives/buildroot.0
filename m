From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 10:41:09 -0300
Subject: [Buildroot] [PATCH] arch/sparc: doesn't have atomics
Message-ID: <1427636469-9491-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cores older than v9 don't seem to have atomics so remove it.
Fixes a test build of pulseaudio for example.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.sparc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 4e502d5..cc10e8d 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -17,9 +17,6 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "BIG"
 
-config BR2_ARCH_HAS_ATOMICS
-	default y
-
 config BR2_GCC_TARGET_CPU
 	default "leon3"		if BR2_sparc_leon3
 	default "v8"		if BR2_sparc_v8
-- 
2.0.5
