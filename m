Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44789C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:34:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55F960EE3
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A55F960EE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D9AE80C38;
	Mon, 25 Oct 2021 11:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xvum8NFKi-aX; Mon, 25 Oct 2021 11:34:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FCD380C40;
	Mon, 25 Oct 2021 11:34:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6246B1BF37A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5055240373
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fBxs-YDlFVTA for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 11:34:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4413F402EB
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:34:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 727E68871A; Mon, 25 Oct 2021 11:31:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 13:33:02 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6ed711ce3ed896e6b5f5d167973ca239793ea041
X-Git-Newrev: 17bc6bc16517b566370c637a8f4cd751483021a1
X-Patchwork-Hint: ignore
Message-Id: <20211025113112.727E68871A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gnupg2: bump
 version to 2.2.32
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

commit: https://git.buildroot.net/buildroot/commit/?id=17bc6bc16517b566370c637a8f4cd751483021a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- removed 0001-dirmngr-Fix-build-with--disable-ldap.patch
  (from upstream [1])

- fix/update signature check key hash

For details (since 2.2.28) see [2], [3], [4] and [5].

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=c6900f5723b4edc899aaea267ed599b5ad724142
[2] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000461.html
[3] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000463.html
[4] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000464.html
[5] https://lists.gnupg.org/pipermail/gnupg-announce/2021q4/000465.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1f654d357c0743d69731975d60fa414014dacf55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-dirmngr-Fix-build-with--disable-ldap.patch | 43 ----------------------
 package/gnupg2/gnupg2.hash                         |  8 ++--
 package/gnupg2/gnupg2.mk                           |  2 +-
 3 files changed, 5 insertions(+), 48 deletions(-)

diff --git a/package/gnupg2/0001-dirmngr-Fix-build-with--disable-ldap.patch b/package/gnupg2/0001-dirmngr-Fix-build-with--disable-ldap.patch
deleted file mode 100644
index fbdd7fa4a7..0000000000
--- a/package/gnupg2/0001-dirmngr-Fix-build-with--disable-ldap.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c6900f5723b4edc899aaea267ed599b5ad724142 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Fri, 11 Jun 2021 10:30:02 +0900
-Subject: [PATCH] dirmngr: Fix build with --disable-ldap.
-
-* dirmngr/dirmngr.c (parse_rereadable_options) [USE_LDAP]:
-Conditionalize.
-
---
-
-Reported-by: Phil Pennock
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-(cherry picked from commit c8b2162c0e7eb42b74811b7ed225fa0f56be4083)
-[Retrieved from:
-https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=c6900f5723b4edc899aaea267ed599b5ad724142]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- dirmngr/dirmngr.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/dirmngr/dirmngr.c b/dirmngr/dirmngr.c
-index 915e0e601..330983f3f 100644
---- a/dirmngr/dirmngr.c
-+++ b/dirmngr/dirmngr.c
-@@ -770,6 +770,7 @@ parse_rereadable_options (gpgrt_argparse_t *pargs, int reread)
-     case oRecursiveResolver: enable_recursive_resolver (1); break;
- 
-     case oLDAPServer:
-+#if USE_LDAP
-       {
-         ldap_server_t server;
-         char *p;
-@@ -791,6 +792,7 @@ parse_rereadable_options (gpgrt_argparse_t *pargs, int reread)
-             opt.ldapservers = server;
-           }
-       }
-+#endif
-       break;
- 
-     case oKeyServer:
--- 
-2.11.0
-
diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 023ec9bb1e..caf5dcc883 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
 # From https://lists.gnupg.org/pipermail/gnupg-announce/2021q2/000460.html
-sha1  5f92b7b32d594cf21ea2b48cdaa2e460daccd6e3 gnupg-2.2.28.tar.bz2
+sha1  81684626720c91060ae9920936c768df9fc8b2f6  gnupg-2.2.32.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.28.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  6ff891fc7583a9c3fb9f097ee0d1de0a12469d4b53997e7ba5064950637dfaec  gnupg-2.2.28.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.32.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA
+sha256  b2571b35f82c63e7d278aa6a1add0d73453dc14d3f0854be490c844fca7e0614  gnupg-2.2.32.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 6bd957683b..32c22b8257 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.28
+GNUPG2_VERSION = 2.2.32
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
