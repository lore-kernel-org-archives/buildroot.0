Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C542C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2840D4048F;
	Wed, 10 Aug 2022 21:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2840D4048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OmYiDX3Ts9R9; Wed, 10 Aug 2022 21:58:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C873B403D0;
	Wed, 10 Aug 2022 21:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C873B403D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55C5C1BF40E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30AA8828DA
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30AA8828DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5jI-JX0SsecO for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:58:11 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E839D815AB
Received: from smtpcmd13158.aruba.it (smtpcmd13158.aruba.it [62.149.156.158])
 by smtp1.osuosl.org (Postfix) with ESMTP id E839D815AB
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:58:10 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id LtbVowrmUTCpULtbVoCn28; Wed, 10 Aug 2022 23:51:06 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 23:51:04 +0200
Message-Id: <20220810215104.107714-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBfMpnNDuQCzMpmUxHArmTGYTGPf0SzaWISvTKimxcZAuXKS4/I2NZGMwBN1P1FyGODt3yoIom2qe0HEFQGFqPF9EWJv5wJnESOy8Yvfp9dqVLnMkG+d
 aLmztRmKKJ+v1QCCJMJRX4qGC4Q6fSKt0QqUgDXxOuZZvTUPwjFUEPdQCWH5QzN99CCa05LbKELDjzo62hmr0b4XUld+13JrhAiPA9Cmoa6woMAUKEcFsVvu
 /e7rHuAbMk1lLLiEY/POdqUyWSUJ9EY8KPTiExhz2rdHPIswuiCTR4t13aDDzMlbVZmU+H6qtvVtH25NBUzQotF30aEyiJipNe8i4hamUJCL2SPujRNX92+U
 jEZXT6SQ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660168266; bh=NlHBvwuqfBQkJ8UxjGNWhFwb0DeZl43b+O6/0r5ub7U=;
 h=From:To:Subject:Date:MIME-Version;
 b=m4bp6xzdlyTKlF/+LHXUrne+mfJhm5lqT/1CeiDi+hfmq81LN5OkQuyjrdAlwIQut
 Aet22vPBp7aJ/telSLwcA4MREF2CaGBC/x4FAbL/cR3c0q73rHRenBjH6GHyio2YwI
 87Ppud8wYClCUh+evpSPf6uCLHL+6uJFJ2PyF36RVm0sgfmXOaIb7T2+xp3GdFIfsp
 nClwX4BU1xxIKjYTHOpbup5IGG7bubqWpKwT01emL+Z4eYlZ0iZ2TZH4AtIfbHvhCg
 7WCnvZcVB58EGy+NF2Q+LgCjmXJGoZO+A+TLBTbLLfdVXJTXFY+NoJPl5dJgEKteQ7
 VYZav77mPisLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=m4bp6xzd
Subject: [Buildroot] [PATCH] package/nfs-utils: improve local patch
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As Thomas Petazzoni made me notice the actual local patch is not a good way
at all to deal with pkg-config with Autotools. So let's rework the patch
according to his comment that represents the standard of Autotools
pkg-config usage.

I've resping this new patch upstream.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ead-fix-linking-while-static-linking.patch | 39 +++++++++++++------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
index b8dcea63f7..9477415296 100644
--- a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
+++ b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
@@ -1,31 +1,48 @@
-From a69014a1b4e5b8068630abe3109f31eb64b6a076 Mon Sep 17 00:00:00 2001
+From d9abb221cea81dee5956bd987c6efa680c03571a Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 10 Aug 2022 00:10:51 +0200
+Date: Wed, 10 Aug 2022 23:38:17 +0200
 Subject: [PATCH] nfsrahead: fix linking while static linking
 
--lmount must preceed -lblkid and to obtain this let's add:
-`pkg-config --libs mount`
-in place of:
-`-lmount`
-This ways the library order will always be correct.
+-lmount must preceed -lblkid and to obtain this let's add in configure.ac:
+PKG_CHECK_MODULES([LIBMOUNT], [mount])
+and in tools/nfsrahead/Makefile.am let's substitute explicit `-lmount`
+with:
+$(LIBMOUNT_LIBS)
+This way all the required libraries will be present and in the right order
+when static linking.
 
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 ---
 Pending Upstream:
-https://patchwork.kernel.org/project/linux-nfs/patch/20220809223308.1421081-1-giulio.benetti@benettiengineering.com/
+https://patchwork.kernel.org/project/linux-nfs/patch/20220810214554.107094-1-giulio.benetti@benettiengineering.com/
 ---
+ configure.ac                | 3 +++
  tools/nfsrahead/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ 2 files changed, 4 insertions(+), 1 deletion(-)
 
+diff --git a/configure.ac b/configure.ac
+index f1c46c5c..ff85200b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -273,6 +273,9 @@ AC_LIBCAP
+ dnl Check for -lxml2
+ AC_LIBXML2
+ 
++dnl Check for -lmount
++PKG_CHECK_MODULES([LIBMOUNT], [mount])
++
+ # Check whether user wants TCP wrappers support
+ AC_TCP_WRAPPERS
+ 
 diff --git a/tools/nfsrahead/Makefile.am b/tools/nfsrahead/Makefile.am
-index 845ea0d5..280a2eb4 100644
+index 845ea0d5..7e08233a 100644
 --- a/tools/nfsrahead/Makefile.am
 +++ b/tools/nfsrahead/Makefile.am
 @@ -1,6 +1,6 @@
  libexec_PROGRAMS = nfsrahead
  nfsrahead_SOURCES = main.c
 -nfsrahead_LDFLAGS= -lmount
-+nfsrahead_LDFLAGS= `pkg-config --libs mount`
++nfsrahead_LDFLAGS= $(LIBMOUNT_LIBS)
  nfsrahead_LDADD = ../../support/nfs/libnfsconf.la
  
  man5_MANS = nfsrahead.man
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
