From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Jul 2012 14:54:19 +0200
Subject: [Buildroot] [git commit] toolchain/powerpc: SPE ABI is not
	available for e500mc
Message-ID: <20120704125535.01B5A8FA66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37aa01f2cf3e05f6e52df056c22e5733fd1164ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
