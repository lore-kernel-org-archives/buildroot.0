Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB0FC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:22:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 156F760462
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 156F760462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E845F8106A;
	Thu, 19 Aug 2021 21:22:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yuEIPlyl-6h; Thu, 19 Aug 2021 21:22:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF6181947;
	Thu, 19 Aug 2021 21:22:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AD9D1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AA7C8106A
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yA13Ijyyz6S for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:21:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC85C81A1C
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:21:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8C01E8D662; Thu, 19 Aug 2021 21:21:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 23:21:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 95cfc71779eeb07894128f6de49bf1284106717a
X-Git-Newrev: 55746e44c43da92742610c58a218144563dc1076
X-Patchwork-Hint: ignore
Message-Id: <20210819212112.8C01E8D662@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpv: add staging
 install
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

commit: https://git.buildroot.net/buildroot/commit/?id=55746e44c43da92742610c58a218144563dc1076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

MPV is not only an application, but also a library, which should be avaliable in staging.

Signed-off-by: Zeno Endemann <zeno.endemann@mailbox.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mpv/mpv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index d4d4d4811d..98a7328c83 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -12,6 +12,7 @@ MPV_DEPENDENCIES = \
 MPV_LICENSE = GPL-2.0+
 MPV_LICENSE_FILES = LICENSE.GPL
 MPV_CPE_ID_VENDOR = mpv
+MPV_INSTALL_STAGING = YES
 
 MPV_NEEDS_EXTERNAL_WAF = YES
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
