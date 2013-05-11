From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 May 2013 09:21:25 -0300
Subject: [Buildroot] [PATCH] ltrace: unavailable for ARC architecture
Message-ID: <1368274885-862-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ltrace/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index a56c55e..4f1c42f 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
-	depends on !(BR2_avr32 || BR2_mips || BR2_sh || BR2_sh64 || BR2_xtensa || BR2_aarch64)
+	depends on !(BR2_avr32 || BR2_mips || BR2_sh || BR2_sh64 || BR2_xtensa || BR2_aarch64 || BR2_arc)
 	select BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
-- 
1.8.1.5
