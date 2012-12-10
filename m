From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 09:54:01 +0100
Subject: [Buildroot] [git commit] ltrace: fix download url
Message-ID: <20121210085534.AFA1A8E2FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7345c095d3319568173362c16ba7f6f401976aab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise we would get the 0.7.1 version.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltrace/Config.in |    3 +--
 package/ltrace/ltrace.mk |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index c77108f..a56c55e 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
-	depends on !(BR2_avr32 || BR2_mips || BR2_sh || BR2_sh64 || BR2_xtensa)
-	depends on !BR2_aarch64
+	depends on !(BR2_avr32 || BR2_mips || BR2_sh || BR2_sh64 || BR2_xtensa || BR2_aarch64)
 	select BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 4b31690..41d48ba 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 LTRACE_VERSION = 0.7.2
-LTRACE_SITE = http://alioth.debian.org/frs/download.php/3844
+LTRACE_SITE = http://alioth.debian.org/frs/download.php/3848
 LTRACE_SOURCE = ltrace-$(LTRACE_VERSION).tar.bz2
 LTRACE_DEPENDENCIES = libelf
 LTRACE_AUTORECONF = YES
