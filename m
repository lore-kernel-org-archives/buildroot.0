From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Jul 2012 09:35:51 -0300
Subject: [Buildroot] [PATCH] toolchain/powerpc: SPE ABI is not available for
	e500mc
Message-ID: <1341405351-11946-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 target/Config.in.arch |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 25ff750..c9bbc12 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -556,8 +556,8 @@ endchoice
 choice
 	prompt "Target ABI"
 	depends on BR2_powerpc
-	default BR2_powerpc_CLASSIC if BR2_powerpc_e500mc
 	default BR2_powerpc_SPE if BR2_powerpc_8540 || BR2_powerpc_8548
+	default BR2_powerpc_CLASSIC
 	help
 	  Application Binary Interface to use
 
@@ -566,7 +566,7 @@ config BR2_powerpc_CLASSIC
 	depends on !(BR2_powerpc_8540 || BR2_powerpc_8548)
 config BR2_powerpc_SPE
 	bool "SPE"
-	depends on BR2_powerpc_8540 || BR2_powerpc_8548 || BR2_powerpc_e500mc
+	depends on BR2_powerpc_8540 || BR2_powerpc_8548
 endchoice
 
 config BR2_ARCH
-- 
1.7.8.6
