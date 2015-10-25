From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:51:40 +0100
Subject: [Buildroot] [git commit] uclibc: update uClibc-ng to 1.0.8
Message-ID: <20151025210816.1F45581DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f8aaa37300808d2f7c6d8c6f48aa90caab24451
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes following problems:
- mips64 toolchain building when UCLIBC_HAS_CONTEXT_FUNCS is enabled
- segfault when SSP and NPTL is used for static binaries
- Updates for ARC and Xtensa
- missing syscalls for fanotify_init() and fanotify_mark() are added
- support for the syncfs() system call added
- problems compiling freeswitch are fixed
- problems running LTP regarding fallocate are fixed

Tested with defconfigs for Qemu arm/ppc/sh/mips/x86/x86_64/xtensa.

Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/Config.in   |    2 +-
 package/uclibc/uclibc.hash |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2e10af7..ff6dffd 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -65,7 +65,7 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
 	default "arc-2015.06" if BR2_UCLIBC_VERSION_ARC_GIT
-	default "1.0.6"		if BR2_UCLIBC_VERSION_NG
+	default "1.0.8"		if BR2_UCLIBC_VERSION_NG
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 6cd76dd..d9931a9 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -2,7 +2,7 @@
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
 
 # From http://www.uclibc-ng.org/
-sha256  afb2ec318fe5b115165e3fdc22964a2fd2b68e03a652ac36164ed096b4bb795c        uClibc-ng-1.0.6.tar.xz
+sha256  11575cda78681713f5a36cf35deaae93acdc7dce463d38a12902991fb7f5312a        uClibc-ng-1.0.8.tar.xz
 
 # No hash for the ARC variant, comes from the github-helper
 none	xxx	uClibc-arc-2015.06.tar.gz
