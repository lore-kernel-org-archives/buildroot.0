Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5912CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:00:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A9560FA0
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20A9560FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB488422AB;
	Wed,  4 Aug 2021 00:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFqEzkCYmWiu; Wed,  4 Aug 2021 00:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A008422A9;
	Wed,  4 Aug 2021 00:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5977E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47984406BA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3p3hQFxZnyPZ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D67B440683
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 293BB87B09; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 21:17:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ccff6bff09438d5a88c70fdebd5d80201fe9de50
X-Git-Newrev: 288df3d9e9b9879ad1ffee88c872436c4dadefd3
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.293BB87B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fb-test-app: Move
 'rosetta' prefix from VERSION to SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=288df3d9e9b9879ad1ffee88c872436c4dadefd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Move 'rosetta' prefix from VERSION to SITE to have version be
in a standard format.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fb-test-app/fb-test-app.hash | 2 +-
 package/fb-test-app/fb-test-app.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fb-test-app/fb-test-app.hash b/package/fb-test-app/fb-test-app.hash
index 3068caf278..ff7730ef8d 100644
--- a/package/fb-test-app/fb-test-app.hash
+++ b/package/fb-test-app/fb-test-app.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  45d490ed78a6e4425d9a760e81e99dc503af01704e17ab5bf186b87a31c5e3db  fb-test-app-rosetta-1.1.1.tar.gz
+sha256  45d490ed78a6e4425d9a760e81e99dc503af01704e17ab5bf186b87a31c5e3db  fb-test-app-1.1.1.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index f6e949015e..89d533ab15 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FB_TEST_APP_VERSION = rosetta-1.1.1
-FB_TEST_APP_SITE = $(call github,andy-shev,fb-test-app,$(FB_TEST_APP_VERSION))
+FB_TEST_APP_VERSION = 1.1.1
+FB_TEST_APP_SITE = $(call github,andy-shev,fb-test-app,rosetta-$(FB_TEST_APP_VERSION))
 FB_TEST_APP_LICENSE = GPL-2.0
 FB_TEST_APP_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
