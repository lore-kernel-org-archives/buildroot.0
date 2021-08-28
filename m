Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F49C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:49:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1E85608FB
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1E85608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C009960677;
	Sat, 28 Aug 2021 13:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VdzZKylRIYxJ; Sat, 28 Aug 2021 13:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68C9E6067F;
	Sat, 28 Aug 2021 13:49:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1ECAA1BF30D
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E46360677
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4K6446nI05s for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 13:48:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5868C60673
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 13:48:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ce:7c4d:7a73:f3f6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B084D7802BE;
 Sat, 28 Aug 2021 15:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630158527;
 bh=GsU1zG5OplXdrZ3nn3eiDHeypG6sfgc79wDYfY36+wk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tN8QdyqCm2mNMWDYl3N5dErshPG8rNUlt+1zRDdy559nJc+S6q/5oKp/aXFRI6ukq
 1PlktlGUncz199q5O/jgLqClrivlTVBoNQB3DCYJn+duBtt7P2fOPmzUR1/U/QRgj+
 rNIT++B1j8276hCyZtFfy4wJaTu3t2vxJX3odGfQ7Z1/xD8kbNfQsxgFk4EukFtluz
 IJUSyOPAri/UrUhshrycDK3S4xlOdKtQJHHQT8NJ660pdvzT4+vjImWDCnieCJsUgI
 7m/mIdMn5cfuugNnQGkuhGaskaI0pPSPKLJWBkBNa+svb4COJZPJnDeLB3XhJ6YlZn
 sHJoLm2u1pB6w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Aug 2021 15:48:36 +0200
Date: Sat, 28 Aug 2021 15:48:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210828134836.GL2661@scaer>
References: <20210724075335.804074-1-damien.lemoal@opensource.wdc.com>
 <3cd3552d-3114-d2dd-9145-aca4319e0754@opensource.wdc.com>
 <20210810164055.2d30eda8@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210810164055.2d30eda8@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 0/9] Add RV64 NOMMU and Canaan K210 SoC
 support
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
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alistair Francis <alistair@alistair23.me>, Mark Corbin <mark@dibsco.co.uk>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Damien, Thomas, All,

On 2021-08-10 16:40 +0200, Thomas Petazzoni spake thusly:
> On Tue, 10 Aug 2021 16:45:29 +0900
> Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:
> > > Finally, patch 9 documents how to build and install images for these
> > > boards.  
> > Re-ping... Any comment on these patches ?
> 
> Not yet, we have a significant backlog of patches. We've worked hard in
> recent weeks and have been able to reduce the backlog from ~600 to ~300
> patches, which is already much better.
> 
> Also, 2021.08-rc1 has been released, which means that the focus now is
> more on fixes/stabilization for 2021.08 rather than merging new
> features.
> 
> Don't worry: we use patchwork, so patches are never lost.

Well, it seems that this series is indeed missing from patchwork. All I
could find was the v2:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=252693&state=*

But the thread this mail is a reply to, does not show up, neither in the
kernel archives, nor in patchwork.

Could you please resend this series?

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
