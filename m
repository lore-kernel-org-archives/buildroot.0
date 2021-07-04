Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27B0C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:22:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6642C60F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6642C60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EFD0414C9;
	Tue,  3 Aug 2021 23:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPnkAduT9Z6j; Tue,  3 Aug 2021 23:22:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC10406AE;
	Tue,  3 Aug 2021 23:22:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD10F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6E7840E79
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id daV-4GlWfcOh for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C192540608
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 238D086A84; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Jul 2021 21:38:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a1c7cff1a081765c082c196bd9e6c1e72ceee797
X-Git-Newrev: 1aa3cb1090676a8af91d664142c968f4b6a22a82
X-Patchwork-Hint: ignore
Message-Id: <20210803211000.238D086A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Revert "package/bitcoin: unset
 the NDEBUG flag"
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

commit: https://git.buildroot.net/buildroot/commit/?id=1aa3cb1090676a8af91d664142c968f4b6a22a82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Setting NDEBUG is no longer done by the infra.

This reverts commit f098aff4792a0e792bda4d7d1ec22a5af1381d83.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bitcoin/bitcoin.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index f485e4ee5c..142521835c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -13,12 +13,6 @@ BITCOIN_CPE_ID_VENDOR = bitcoin
 BITCOIN_CPE_ID_PRODUCT = bitcoin_core
 BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
 BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
-# Bitcoin is using assert(...) extensively with the assumption of it
-# never being a noop at runtime. So we cannot build with NDEBUG.
-BITCOIN_CONF_ENV = \
-	CPPFLAGS="$(TARGET_CPPFLAGS) -UNDEBUG" \
-	CFLAGS="$(TARGET_CFLAGS) -UNDEBUG" \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -UNDEBUG"
 BITCOIN_CONF_OPTS = \
 	--disable-bench \
 	--disable-wallet \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
