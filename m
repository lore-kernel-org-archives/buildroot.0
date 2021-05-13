Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB076C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:12:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85ECB60F0F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85ECB60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56667404BF;
	Tue,  3 Aug 2021 21:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgUD7VpSt1eY; Tue,  3 Aug 2021 21:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A2BA40357;
	Tue,  3 Aug 2021 21:12:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17D2D1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C18474045E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsSCj9gyOLBT for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BBED400E7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 951608B43C; Tue,  3 Aug 2021 21:09:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 May 2021 09:47:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6a075914849457d0c52e6bb3235faa9f3fcdbefb
X-Git-Newrev: a7a58df5f0de618360c8b4e39ec5f5f6b2da0975
X-Patchwork-Hint: ignore
Message-Id: <20210803210935.951608B43C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bitcoin: security bump
 to version 0.21.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7a58df5f0de618360c8b4e39ec5f5f6b2da0975
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Tag as a security bump as having an up to date bitcoin is important:
https://patchwork.ozlabs.org/project/buildroot/patch/20200202085526.35742-1-james.hilliard1@gmail.com

https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-0.21.1.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bitcoin/bitcoin.hash | 4 ++--
 package/bitcoin/bitcoin.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 3c65c3d730..6ea3398037 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,5 +1,5 @@
-# From https://bitcoincore.org/bin/bitcoin-core-0.21.0/SHA256SUMS.asc
-sha256  1a91202c62ee49fb64d57a52b8d6d01cd392fffcbef257b573800f9289655f37  bitcoin-0.21.0.tar.gz
+# From https://bitcoincore.org/bin/bitcoin-core-0.21.1/SHA256SUMS.asc
+sha256  caff23449220cf45753f312cefede53a9eac64000bb300797916526236b6a1e0  bitcoin-0.21.1.tar.gz
 
 # Hash for license file
 sha256  96fe807030b21f88305adc32af62f9aa19915f2783509fd6f52aea02cf83f644  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 5f1684879c..142521835c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 0.21.0
+BITCOIN_VERSION = 0.21.1
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
