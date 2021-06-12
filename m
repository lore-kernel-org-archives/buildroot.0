Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F12C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:47:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E845D61029
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E845D61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C3B405BD;
	Tue,  3 Aug 2021 21:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9Oq6qb2foeo; Tue,  3 Aug 2021 21:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 223B6405B4;
	Tue,  3 Aug 2021 21:47:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 094FD1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D03C4608B2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1wpDP8oN19z for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C87C607BC
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 870FC88523; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Jun 2021 14:31:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 89fe69225e0a9e19c16a4f3be7ba0b6f356e27b3
X-Git-Newrev: 49ef039b88bcfd90fc20177906fb4529a18eee0f
X-Patchwork-Hint: ignore
Message-Id: <20210803210949.870FC88523@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/freerdp: needs rc4
 from libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=49ef039b88bcfd90fc20177906fb4529a18eee0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
    http://autobuild.buildroot.org/results/b21b21a66bef2bc09231e475037a8f9be5584fa4/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freerdp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 5705ce0e0c..14c5f98671 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_FREERDP
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBGLIB2
 	help
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
