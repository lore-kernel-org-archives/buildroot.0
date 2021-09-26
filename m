Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D605C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:45:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF6516103B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF6516103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB02D40328;
	Sun, 26 Sep 2021 21:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1v1Xc-RdkwiE; Sun, 26 Sep 2021 21:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD1D840368;
	Sun, 26 Sep 2021 21:45:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0DF11BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4171403B3
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENOPte9wQJdu for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A99F403B8
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 764568D308; Sun, 26 Sep 2021 21:42:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 23:06:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22f8b08780d143f0ac02120054cf5a1f000ea149
X-Git-Newrev: 60add404db424e2652673a7b6a3ba2bc80380b42
X-Patchwork-Hint: ignore
Message-Id: <20210926214229.764568D308@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdbm: bump to version 1.21
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60add404db424e2652673a7b6a3ba2bc80380b42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove useless patch (tested with gcc 10.3.1)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gdbm/0001-fix-build-with-gcc-10.patch | 96 ---------------------------
 package/gdbm/Config.in                        |  2 +-
 package/gdbm/gdbm.hash                        | 10 +--
 package/gdbm/gdbm.mk                          |  2 +-
 4 files changed, 7 insertions(+), 103 deletions(-)

diff --git a/package/gdbm/0001-fix-build-with-gcc-10.patch b/package/gdbm/0001-fix-build-with-gcc-10.patch
deleted file mode 100644
index cd1417c81a..0000000000
--- a/package/gdbm/0001-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 9fecb6ce056f25837dffac95260d5a80b9f468c0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 19 Aug 2020 10:37:07 +0200
-Subject: [PATCH] fix build with gcc 10
-
-Move initialisation of global variables to main functions to fix the
-following build failure with gcc 10:
-
-/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: ./libgdbmapp.a(parseopt.o):(.bss+0x2c): multiple definition of `parseopt_program_args'; gdbm_dump.o:(.data.rel.local+0x28): first defined here
-/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: ./libgdbmapp.a(parseopt.o):(.bss+0x30): multiple definition of `parseopt_program_doc'; gdbm_dump.o:(.data.rel.local+0x2c): first defined here
-/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: ./libgdbmapp.a(parseopt.o):(.bss+0x2c): multiple definition of `parseopt_program_args'; gdbm_load.o:(.data.rel.local+0xa0): first defined here
-/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: ./libgdbmapp.a(parseopt.o):(.bss+0x30): multiple definition of `parseopt_program_doc'; gdbm_load.o:(.data.rel.local+0xa4): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/d09b5368bb624df629296359a5abcdd37ba61e9e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to Sergey Poznyakoff <gray@gnu.org>]
----
- src/gdbm_dump.c | 5 +++--
- src/gdbm_load.c | 5 +++--
- src/gdbmtool.c  | 5 +++--
- 3 files changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/src/gdbm_dump.c b/src/gdbm_dump.c
-index 82fb5af..67574ac 100644
---- a/src/gdbm_dump.c
-+++ b/src/gdbm_dump.c
-@@ -19,8 +19,6 @@
- # include "gdbmapp.h"
- # include "gdbmdefs.h"
- 
--char *parseopt_program_doc = "dump a GDBM database to a file";
--char *parseopt_program_args = "DB_FILE [FILE]";
- struct gdbm_option optab[] = {
-   { 'H', "format", "binary|ascii|0|1", N_("select dump format") },
-   { 0 }
-@@ -36,6 +34,9 @@ main (int argc, char **argv)
-   char *dbname, *filename;
-   FILE *fp;
- 
-+  parseopt_program_doc = "dump a GDBM database to a file";
-+  parseopt_program_args = "DB_FILE [FILE]";
-+
- #ifdef HAVE_SETLOCALE
-   setlocale (LC_ALL, "");
- #endif
-diff --git a/src/gdbm_load.c b/src/gdbm_load.c
-index 2d96ada..1b2739c 100644
---- a/src/gdbm_load.c
-+++ b/src/gdbm_load.c
-@@ -29,8 +29,6 @@ int mode;
- uid_t owner_uid;
- gid_t owner_gid;
- 
--char *parseopt_program_doc = "load a GDBM database from a file";
--char *parseopt_program_args = "FILE [DB_FILE]";
- struct gdbm_option optab[] = {
-   { 'r', "replace", NULL, N_("replace records in the existing database") },
-   { 'm', "mode", N_("MODE"), N_("set file mode") },
-@@ -100,6 +98,9 @@ main (int argc, char **argv)
-   int cache_size = 0;
-   int block_size = 0;
-   
-+  parseopt_program_doc = "load a GDBM database from a file";
-+  parseopt_program_args = "FILE [DB_FILE]";
-+
- #ifdef HAVE_SETLOCALE
-   setlocale (LC_ALL, "");
- #endif
-diff --git a/src/gdbmtool.c b/src/gdbmtool.c
-index bbadbae..69bc3b1 100644
---- a/src/gdbmtool.c
-+++ b/src/gdbmtool.c
-@@ -1535,8 +1535,6 @@ command_lookup (const char *str, struct locus *loc, struct command **pcmd)
-   return found->tok;
- }
- 
--char *parseopt_program_doc = N_("examine and/or modify a GDBM database");
--char *parseopt_program_args = N_("DBFILE [COMMAND [ARG ...]]");
- 
- enum {
-   OPT_LEX_TRACE = 256,
-@@ -2053,6 +2051,9 @@ main (int argc, char *argv[])
-   char *source = NULL;
-   instream_t input = NULL;
-   
-+  parseopt_program_doc = N_("examine and/or modify a GDBM database");
-+  parseopt_program_args = N_("DBFILE [COMMAND [ARG ...]]");
-+
-   set_progname (argv[0]);
- #if GDBM_DEBUG_ENABLE
-   gdbm_debug_printer = debug_printer;
--- 
-2.27.0
-
diff --git a/package/gdbm/Config.in b/package/gdbm/Config.in
index 3646bd0588..6c668722d9 100644
--- a/package/gdbm/Config.in
+++ b/package/gdbm/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_GDBM
 	  GNU dbm is a set of database routines that use extensible
 	  hashing. It works similar to the standard UNIX dbm routines.
 
-	  http://www.gnu.org/software/gdbm/gdbm.html
+	  https://www.gnu.org/software/gdbm/gdbm.html
diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index 8de9f6368d..f68a16e2f3 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,6 +1,6 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2018-10/msg00006.html
-md5 988dc82182121c7570e0cb8b4fcd5415  gdbm-1.18.1.tar.gz
-sha1 4a923ebfac06bb05c1c7699b206719e06a938f0d  gdbm-1.18.1.tar.gz
+# From https://www.gnu.org.ua/software/gdbm/download.html
+md5  a285c6e2dfed78668664c0555a7d202b  gdbm-1.21.tar.gz
+sha1  f6eec6113f04a4b5fd2c1cfead10e7d65c8f3d89  gdbm-1.21.tar.gz
 # Locally computed
-sha256 86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f745b91dc  gdbm-1.18.1.tar.gz
-sha256 690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
+sha256  b0b7dbdefd798de7ddccdd8edf6693a30494f7789777838042991ef107339cc2  gdbm-1.21.tar.gz
+sha256  690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 084a7769f2..3c52d12542 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.18.1
+GDBM_VERSION = 1.21
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
