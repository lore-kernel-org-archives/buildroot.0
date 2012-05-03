From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 May 2012 15:57:28 +0200
Subject: [Buildroot] [git commit] toolchain/uClibc: enable 0.9.33.1 for sh
Message-ID: <20120503151506.210BC96C67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffe526d1063be89f68a78170a05665f577758318
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable uClibc 0.9.33.1 for the SH architecture.
Builds and works fine with the qemu sample config.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
