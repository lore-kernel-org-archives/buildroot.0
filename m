Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BBDC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5311060A6F;
	Mon,  8 Jul 2024 20:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dMZaoYpkFeD; Mon,  8 Jul 2024 20:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A0460A5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A0460A5C;
	Mon,  8 Jul 2024 20:20:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 011521BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E66DA40133
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iOApfTPPhu4 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC5F54033A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC5F54033A
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C693683FF6; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1dc5fe6050f4b49a2b2b7b0593246bfc5f1eb408
X-Git-Newrev: 18b1197e9165ac537b19d990091ff85bb22124ad
X-Patchwork-Hint: ignore
Message-Id: <20240708202012.C693683FF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/monit: update the patches to be
 applied with fuzz 0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6383084528268474073=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6383084528268474073==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=18b1197e9165ac537b19d990091ff85bb22124ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, monit fails to build with output:

    Applying 0001-no-force-static.patch using patch:
    patching file Makefile.am
    Hunk #1 FAILED at 85.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.am.rej

    Applying 0002-configure.ac-fixes-missing-config-macro-dir.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 8.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/monit/0001-no-force-static.patch                          | 8 +++++---
 .../monit/0002-configure.ac-fixes-missing-config-macro-dir.patch  | 6 ++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/monit/0001-no-force-static.patch b/package/monit/0001-no-force-static.patch
index edb619b541..4634a951f3 100644
--- a/package/monit/0001-no-force-static.patch
+++ b/package/monit/0001-no-force-static.patch
@@ -5,13 +5,15 @@ still dlopen()s the NSS libraries.
 
 Reported-by: Peter Kümmel <syntheticpp@gmx.net>
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -durN monit-5.7.orig/Makefile.am monit-5.7/Makefile.am
 --- monit-5.7.orig/Makefile.am	2014-02-20 09:00:42.000000000 +0100
 +++ monit-5.7/Makefile.am	2014-09-05 12:49:43.711104001 +0200
-@@ -85,7 +85,7 @@
- 		  src/process/sysdep_@ARCH@.c
-  
+@@ -97,7 +97,7 @@
+                   src/statistics/Statistics.c
+ 
  monit_LDADD 	= libmonit/libmonit.la
 -monit_LDFLAGS 	= -static $(EXTLDFLAGS)
 +monit_LDFLAGS 	= $(EXTLDFLAGS)
diff --git a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
index 325dcc17e1..31b20b3cbc 100644
--- a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
+++ b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
@@ -8,6 +8,8 @@ so that m4 macros are properly loaded upon autoreconf use.
 
 Upstream: N/A (specific to buildroot)
 Signed-off-by: Jens Maus <mail@jens-maus.de>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  configure.ac          | 2 +-
  libmonit/configure.ac | 2 +-
@@ -17,9 +19,9 @@ diff --git a/configure.ac b/configure.ac
 index 3c3d30a2..f4c5ea07 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -8,7 +8,7 @@ AC_PREREQ([2.53])
+@@ -8,7 +8,7 @@
  # Example: 5.0_beta2
- AC_INIT([monit], [5.34.0], [monit-general@nongnu.org])
+ AC_INIT([monit], [5.33.0], [monit-general@nongnu.org])
  AC_CONFIG_AUX_DIR(config)
 -AC_CONFIG_MACRO_DIR([m4])
 +AC_CONFIG_MACRO_DIRS([m4 config])

--===============6383084528268474073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6383084528268474073==--
