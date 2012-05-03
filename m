From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 May 2012 22:24:16 -0300
Subject: [Buildroot] [PATCH] toolchain/uClibc: enable 0.9.33.1 for sh
Message-ID: <1336008256-12595-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable uClibc 0.9.33.1 for the SH architecture.
Builds and works fine with the qemu sample config.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/uClibc/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 55e2f8b..160ead4 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -5,7 +5,7 @@ comment "uClibc Options"
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_31 if (BR2_avr32 || BR2_sh) # 0.9.32 broken
+	default BR2_UCLIBC_VERSION_0_9_31 if BR2_avr32 # 0.9.32 broken
 	default BR2_UCLIBC_VERSION_0_9_33
 	help
 	  Select the version of uClibc you wish to use.
@@ -19,7 +19,7 @@ choice
 
 	config BR2_UCLIBC_VERSION_0_9_33
 		bool "uClibc 0.9.33.x"
-		depends on !(BR2_avr32 || BR2_sh)
+		depends on !BR2_avr32
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
-- 
1.7.3.4
