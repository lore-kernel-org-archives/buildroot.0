Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08EBC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:05:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7733A60525
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7733A60525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 545174229C;
	Wed,  4 Aug 2021 00:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gC-bQc9vhhQO; Wed,  4 Aug 2021 00:05:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9437A42281;
	Wed,  4 Aug 2021 00:05:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7E141BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF6FE40678
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6oqHMBxVqXA3 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11751406A1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 57C3782926; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 23:13:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 56b886848987a310eb4c859f3295f3c815dd5e54
X-Git-Newrev: 92d8b98c28921778ec73245c3558d91ec14bf5ad
X-Patchwork-Hint: ignore
Message-Id: <20210803210959.57C3782926@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnupg2: bump to
 version 2.2.28
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=92d8b98c28921778ec73245c3558d91ec14bf5ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://dev.gnupg.org/T5153
https://dev.gnupg.org/T5234
https://dev.gnupg.org/T5482

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-dirmngr-Fix-build-with--disable-ldap.patch | 43 ++++++++++++++++++++++
 package/gnupg2/gnupg2.hash                         |  8 ++--
 package/gnupg2/gnupg2.mk                           |  2 +-
 3 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/0001-dirmngr-Fix-build-with--disable-ldap.patch b/package/gnupg2/0001-dirmngr-Fix-build-with--disable-ldap.patch
new file mode 100644
index 0000000000..fbdd7fa4a7
--- /dev/null
+++ b/package/gnupg2/0001-dirmngr-Fix-build-with--disable-ldap.patch
@@ -0,0 +1,43 @@
+From c6900f5723b4edc899aaea267ed599b5ad724142 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 11 Jun 2021 10:30:02 +0900
+Subject: [PATCH] dirmngr: Fix build with --disable-ldap.
+
+* dirmngr/dirmngr.c (parse_rereadable_options) [USE_LDAP]:
+Conditionalize.
+
+--
+
+Reported-by: Phil Pennock
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+(cherry picked from commit c8b2162c0e7eb42b74811b7ed225fa0f56be4083)
+[Retrieved from:
+https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=c6900f5723b4edc899aaea267ed599b5ad724142]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ dirmngr/dirmngr.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/dirmngr/dirmngr.c b/dirmngr/dirmngr.c
+index 915e0e601..330983f3f 100644
+--- a/dirmngr/dirmngr.c
++++ b/dirmngr/dirmngr.c
+@@ -770,6 +770,7 @@ parse_rereadable_options (gpgrt_argparse_t *pargs, int reread)
+     case oRecursiveResolver: enable_recursive_resolver (1); break;
+ 
+     case oLDAPServer:
++#if USE_LDAP
+       {
+         ldap_server_t server;
+         char *p;
+@@ -791,6 +792,7 @@ parse_rereadable_options (gpgrt_argparse_t *pargs, int reread)
+             opt.ldapservers = server;
+           }
+       }
++#endif
+       break;
+ 
+     case oKeyServer:
+-- 
+2.11.0
+
diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 2b376ea0b5..023ec9bb1e 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2020q4/000450.html
-sha1  074b21dd07419575fa31c0c5d3116596d5544cbd gnupg-2.2.25.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2021q2/000460.html
+sha1  5f92b7b32d594cf21ea2b48cdaa2e460daccd6e3 gnupg-2.2.28.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.25.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.28.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  c55307b247af4b6f44d2916a25ffd1fb64ce2e509c3c3d028dbe7fbf309dc30a  gnupg-2.2.25.tar.bz2
+sha256  6ff891fc7583a9c3fb9f097ee0d1de0a12469d4b53997e7ba5064950637dfaec  gnupg-2.2.28.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 2f62890db6..6bd957683b 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.25
+GNUPG2_VERSION = 2.2.28
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
