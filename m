Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701D9C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:22:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B84360243
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B84360243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16DC9608A5;
	Tue,  3 Aug 2021 22:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IAVc7koYkyuW; Tue,  3 Aug 2021 22:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B00608BA;
	Tue,  3 Aug 2021 22:22:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6D31BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65FE640593
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_W4dWMqcfz1 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EC3C40539
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D7CC6810E2; Tue,  3 Aug 2021 21:09:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 21 May 2021 10:36:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e5978dae8527ec7a6714920f3ae5112e2cbffa41
X-Git-Newrev: 394c62b21b1988b103ba61eb1b4dee534072fab4
X-Patchwork-Hint: ignore
Message-Id: <20210803210942.D7CC6810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils: add upstream
 backported patches to support -mcmodel=large gcc option
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

commit: https://git.buildroot.net/buildroot/commit/?id=394c62b21b1988b103ba61eb1b4dee534072fab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add upstream backported patches that allows using -mcmodel=large gcc option
that in order allows fixing build failure due to binutils bug 21464:
https://sourceware.org/bugzilla/show_bug.cgi?id=21464

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: remove the PATCH M/N parts - cfr. check-package]
---
 ...ent-relocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++++
 ...R_OR1K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...t-large-plt_relocs-when-generating-plt-en.patch | 500 +++++++++++++++++++++
 ...ent-relocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++++
 ...R_OR1K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...t-large-plt_relocs-when-generating-plt-en.patch | 500 +++++++++++++++++++++
 ...ent-relocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++++
 ...R_OR1K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...t-large-plt_relocs-when-generating-plt-en.patch | 500 +++++++++++++++++++++
 ...ent-relocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++++
 ...R_OR1K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...t-large-plt_relocs-when-generating-plt-en.patch | 500 +++++++++++++++++++++
 12 files changed, 3268 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
