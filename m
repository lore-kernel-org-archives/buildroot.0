Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EABCC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:41:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B5F60555
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8B5F60555
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1DF94272B;
	Sat,  4 Sep 2021 18:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNLd8EVQ4MGq; Sat,  4 Sep 2021 18:41:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2388542725;
	Sat,  4 Sep 2021 18:41:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 449E61BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DFD9402C8
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plFFDByvZpNS for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24A4A40272
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EEB7F8834C; Sat,  4 Sep 2021 18:23:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 23:21:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95cfc71779eeb07894128f6de49bf1284106717a
X-Git-Newrev: 55746e44c43da92742610c58a218144563dc1076
X-Patchwork-Hint: ignore
Message-Id: <20210904182354.EEB7F8834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpv: add staging install
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=55746e44c43da92742610c58a218144563dc1076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
