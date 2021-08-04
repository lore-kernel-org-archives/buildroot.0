Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F355AC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:27:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75E4C60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75E4C60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8839608A3;
	Wed,  4 Aug 2021 21:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id au7K0NrpV08H; Wed,  4 Aug 2021 21:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E4360653;
	Wed,  4 Aug 2021 21:27:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C59441BF9C1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3F0A400D9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4dlqKMwOWG9 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:27:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B97DB400B5
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:27:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A58C182A68; Wed,  4 Aug 2021 21:27:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:57:50 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b0a9055da358d737c45a4c93969b6b851ef037c5
X-Git-Newrev: 8a3ed32b052e46a784f44c464bdbf755dbface3a
X-Patchwork-Hint: ignore
Message-Id: <20210804212704.A58C182A68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/binutils: add
 upstream backported patches to support -mcmodel=large gcc option
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a3ed32b052e46a784f44c464bdbf755dbface3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add upstream backported patches that allows using -mcmodel=large gcc option
that in order allows fixing build failure due to binutils bug 21464:
https://sourceware.org/bugzilla/show_bug.cgi?id=21464

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: remove the PATCH M/N parts - cfr. check-package]
(cherry picked from commit 394c62b21b1988b103ba61eb1b4dee534072fab4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
