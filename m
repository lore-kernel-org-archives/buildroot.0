From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2015 23:54:31 +0100
Subject: [Buildroot] [git commit] uclibc: cleanup unused ARC stuff
Message-ID: <20151116231849.ACDFB81E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ca617fe72678cbd15e3d76170b9563ec74570bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ARC is supported by uClibc-ng, cleanup old code.

Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/Config.in   |    2 +-
 package/uclibc/uclibc.hash |    3 ---
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index eeb6ca0..bd95041 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -18,7 +18,7 @@ config BR2_UCLIBC_VERSION_SUPPORTS_NPTL
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_NG if !BR2_arc
+	default BR2_UCLIBC_VERSION_NG
 	help
 	  Select the version of uClibc you wish to use.
 
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index f985501..00e3389 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -4,8 +4,5 @@ sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0
 # From http://www.uclibc-ng.org/
 sha256  08be8dd22ac0c3806add88b813129fb3014437eddc9d78fc73eba7f33c4b4a9d        uClibc-ng-1.0.9.tar.xz
 
-# No hash for the ARC variant, comes from the github-helper
-none	xxx	uClibc-arc-2015.06.tar.gz
-
 # No hash for this git snapshot
 none  xxx  uClibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c.tar.gz
