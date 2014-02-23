From: Noam Camus <noamc@ezchip.com>
Date: Sun, 23 Feb 2014 08:28:55 +0000
Subject: [Buildroot] [PATCH] external toolchain: [ARC] gcc cpu parameter
Message-ID: <884EA965490E3C4D8E66AEF41E98025006BF3A@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

external toolchain passes -mcpu=arc700
However compiler is familiar with -mcpu=ARC700

Signed-off-by: Noam Camus <noamc@ezchip.com>
---
 arch/Config.in.arc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc index 60b59f0..53e7052 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -11,4 +11,5 @@ config BR2_ENDIAN
 	default "BIG"	 if BR2_arceb
 
 config BR2_GCC_TARGET_CPU
+	default "ARC700" if BR2_TOOLCHAIN_EXTERNAL
 	default "arc700"
--
1.7.1
