Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB37ACAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EEB160E07;
	Sun,  5 Oct 2025 13:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aalte7SVnBPy; Sun,  5 Oct 2025 13:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9403760E17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9403760E17;
	Sun,  5 Oct 2025 13:32:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDC7C226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DB2B411BF
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHDk4t_2LmQk for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:32:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37FB4409F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37FB4409F3
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:32:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2844286860; Sun,  5 Oct 2025 13:32:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 15:30:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d73458b3a5d15d7058835cf296cb4e5a452b2b51
X-Git-Newrev: 15bf67b3af32e3fc09cd8a7e9f3d3c356461b964
X-Patchwork-Hint: ignore
Message-Id: <20251005133239.2844286860@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgsm: bump version to 1.0.23
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============6151756857809367945=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6151756857809367945==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=15bf67b3af32e3fc09cd8a7e9f3d3c356461b964
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.
Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libgsm/0002-Fix-signal-handler-prototype.patch | 61 ----------------------
 package/libgsm/libgsm.hash                         |  3 +-
 package/libgsm/libgsm.mk                           |  2 +-
 3 files changed, 3 insertions(+), 63 deletions(-)

diff --git a/package/libgsm/0002-Fix-signal-handler-prototype.patch b/package/libgsm/0002-Fix-signal-handler-prototype.patch
deleted file mode 100644
index c28cf584a1..0000000000
--- a/package/libgsm/0002-Fix-signal-handler-prototype.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 7ffab0a5028f0bfcb864c2387f41b8d4eb33fb8e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 29 Aug 2025 17:27:55 +0200
-Subject: [PATCH] Fix signal handler prototype
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Recent versions of gcc, starting from gcc 15.x, are more picky about
-function prototypes, and that cause the following issue:
-
-usr/include/signal.h:93:23: note: expected ‘__sighandler_t’ {aka ‘void (*)(int)’} but argument is of type ‘void (*)(void)’
-
-ultimately causing a build failure.
-
-This patch fixes that by ensuring the signal handler has the right
-prototype. The onintr() function is not only used as a signal handler,
-but also on memory allocation failure, in which case a dummy value of
-0 is passed as argument, since anyway this value isn't used by
-onintr().
-
-Upstream: sent by e-mail to Jutta Degener <jutta@pobox.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/toast.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/toast.c b/src/toast.c
-index 05cd0b3..70a14ba 100644
---- a/src/toast.c
-+++ b/src/toast.c
-@@ -211,7 +211,7 @@ static char * suffix P2((name, suf), char *name, char * suf)
- }
- 
- 
--static void catch_signals P1((fun), SIGHANDLER_T (*fun) ())
-+static void catch_signals P1((fun), SIGHANDLER_T (*fun) (int))
- {
- #ifdef	SIGHUP
- 	signal( SIGHUP,   fun );
-@@ -230,7 +230,7 @@ static void catch_signals P1((fun), SIGHANDLER_T (*fun) ())
- #endif
- }
- 
--static SIGHANDLER_T onintr P0()
-+static SIGHANDLER_T onintr P1((signo), int signo)
- {
- 	char * tmp = outname;
- 
-@@ -253,7 +253,7 @@ static char * emalloc P1((len), size_t len)
- 	if (!(s = malloc(len))) {
- 		fprintf(stderr, "%s: failed to malloc %d bytes -- abort\n",
- 			progname, (int)len);
--		onintr();
-+		onintr(0);
- 		exit(1);
- 	}
- 	return s;
--- 
-2.50.1
-
diff --git a/package/libgsm/libgsm.hash b/package/libgsm/libgsm.hash
index b3a4702152..36d90d93bd 100644
--- a/package/libgsm/libgsm.hash
+++ b/package/libgsm/libgsm.hash
@@ -1,3 +1,4 @@
+# From https://www.quut.com/gsm/
+sha256  8b7591a85ac9adce858f2053005e6b2eb20c23b8b8a868dffb2969645fa323c0  gsm-1.0.23.tar.gz
 # Locally computed
-sha256  f0072e91f6bb85a878b2f6dbf4a0b7c850c4deb8049d554c65340b3bf69df0ac  gsm-1.0.22.tar.gz
 sha256  81c68a3374937ed9b5e4929c709e81a2c4b35b5d1f450ecf8c473e2daea46ff6  COPYRIGHT
diff --git a/package/libgsm/libgsm.mk b/package/libgsm/libgsm.mk
index 1c7b860ece..0e5ae9da4a 100644
--- a/package/libgsm/libgsm.mk
+++ b/package/libgsm/libgsm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSM_VERSION = 1.0.22
+LIBGSM_VERSION = 1.0.23
 LIBGSM_SOURCE = gsm-$(LIBGSM_VERSION).tar.gz
 LIBGSM_SITE = http://www.quut.com/gsm
 LIBGSM_LICENSE = gsm

--===============6151756857809367945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6151756857809367945==--
