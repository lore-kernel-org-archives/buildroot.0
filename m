Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33251C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 10:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E8654037A;
	Sun, 30 Oct 2022 10:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E8654037A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNlX8LyFjmNY; Sun, 30 Oct 2022 10:52:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C54C40357;
	Sun, 30 Oct 2022 10:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C54C40357
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C29251BF2B7
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D61B812AB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D61B812AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEknbM_UumoR for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 10:52:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ACD8812CE
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ACD8812CE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 10:52:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 81275240008;
 Sun, 30 Oct 2022 10:52:06 +0000 (UTC)
Date: Sun, 30 Oct 2022 11:52:05 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030115205.0fab7010@windsurf>
In-Reply-To: <20221029170023.219493-1-fontaine.fabrice@gmail.com>
References: <20221029170023.219493-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667127131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XW3todxNlJBrSlihQVlCnEO7FRlcSKPkIM7m5N0EHmA=;
 b=pvRoIb/G1xr2lg6t0sSZUgJA4zJJ6mGPgPphCN30qPpErDlRVycFlXwL0bjmF3FMXSm54A
 QJFEbmK79NJROrZLC1Tvr9Fnr0WI5eOkElTkpCT1iwWIs9x0pUXpDrOTCkIi1GhGqPnkQI
 M9xXSniCnNvpQZYhZ4n/ru2xX3DAG4G+VS1PMhUkguHcTIlcIxdAhahW+R1fMNrVoCr1nf
 Sbx7WuUTW8g1rH4W1xgXeZkCPAve53cyoSJ93MhMA3Zd6mmFO6cmyJjJBLtbFJmjt/koUq
 lwQ+WoMrDiDkSIe/xPMgb/TpD/rCDrjYtaRVaAvx7T7DZD9avPGLmHjccRzDoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pvRoIb/G
Subject: Re: [Buildroot] [PATCH 1/2] package/f2fs-tools: add lz4 and lzo
 optional dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Grzegorz Blach <grzegorz@blach.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Oct 2022 19:00:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> lz4 and lzo are optional dependencies (enabled by default) since bump to
> version 1.14.0 in commit cf566658f28f3e4b362cc8f9235e6b7768af355c and
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=b585244e726c1024f7b842033689992a383808cc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-configure-ac-fix-cross-compilation.patch | 88 +++++++++++++++++++
>  package/f2fs-tools/f2fs-tools.mk              | 18 +++-
>  2 files changed, 105 insertions(+), 1 deletion(-)
>  create mode 100644 package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
