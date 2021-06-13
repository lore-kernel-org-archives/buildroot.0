Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C597AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:03:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F46E60F8F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F46E60F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D57FC405A8;
	Tue,  3 Aug 2021 23:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QU3bRRP5zJX; Tue,  3 Aug 2021 23:03:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 018CA405A6;
	Tue,  3 Aug 2021 23:03:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3251A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E92E940651
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIxss8NKNKbN for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D2444062E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AD295873E2; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Jun 2021 12:01:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ea02ac3e061b36da1bfc0277b1f84126cd96328f
X-Git-Newrev: bf32928bbb03adaa6844bac159a7855c1bffeb7f
X-Patchwork-Hint: ignore
Message-Id: <20210803210950.AD295873E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnutls: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf32928bbb03adaa6844bac159a7855c1bffeb7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Tests can't build with NDEBUG is defined. Since commit 5a8c50fe05afa
("core: enable 'NDEBUG' unless BR2_ENABLE_RUNTIME_DEBUG is set") NDEBUG
is defined on !BR2_ENABLE_RUNTIME_DEBUG. Just disable tests.

Fixes:
http://autobuild.buildroot.net/results/9ec31793484a69c14a66b7338d795089c07b9937/
http://autobuild.buildroot.net/results/6ef8f1534237f2df4cff0a0bc0364fe9a46a5343/
http://autobuild.buildroot.net/results/05ff156687138627f244ca3f6cb58f1ce7d127c4/

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gnutls/gnutls.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 14855bcebc..6fc9ffad0b 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -23,6 +23,7 @@ GNUTLS_CONF_OPTS = \
 	--disable-guile \
 	--disable-libdane \
 	--disable-rpath \
+	--disable-tests \
 	--enable-local-libopts \
 	--enable-openssl-compatibility \
 	--with-librt-prefix=$(STAGING_DIR) \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
