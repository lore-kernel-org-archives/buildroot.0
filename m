Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F66E77188
	for <buildroot@archiver.kernel.org>; Tue, 24 Dec 2024 10:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42A5A41247;
	Tue, 24 Dec 2024 10:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgMyrPVpliJ6; Tue, 24 Dec 2024 10:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE4584126A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE4584126A;
	Tue, 24 Dec 2024 10:50:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A55EC757
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 10:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8812D4125A
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 10:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdOmWecUNgKL for <buildroot@buildroot.org>;
 Tue, 24 Dec 2024 10:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D75C41241
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D75C41241
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D75C41241
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 10:50:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5321120007;
 Tue, 24 Dec 2024 10:50:10 +0000 (UTC)
Mime-Version: 1.0
Date: Tue, 24 Dec 2024 11:50:09 +0100
Message-Id: <D6JVFIFMR2JL.SOPHKL8DSYXP@bootlin.com>
Cc: =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, "Vicente
 Olivert Riera" <Vincent.Riera@imgtec.com>, "Bernd Kuhls"
 <bernd.kuhls@t-online.de>, "Peter Seiderer" <ps.report@gmx.net>, "Fabrice
 Fontaine" <fontaine.fabrice@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Bonnefille
 via buildroot" <buildroot@buildroot.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241222-bump_elfutils-v1-1-970cdcc0669a@bootlin.com>
 <20241222162051.0a5b0956@windsurf>
In-Reply-To: <20241222162051.0a5b0956@windsurf>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735037410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eiRT2cTf7pfiqBlg1Jb0QehXdnzKYwnMhHsZDBMBzXQ=;
 b=CLKoiuB6HJpbpZ0CJRf4N89aBiZkYV1FzMPgFvL2BErnx7IOQPjlzNEqwe6TaRu/zv17AC
 GC0DizDTxCXoThhI8Fg2vD4tJnjN+uR+Wza/zi8fI7VcOogs2D1W/vLB7YMJyURUJMIv/V
 yYthKmaEj8r//Ej689PToIQrrqnnBxAxISfxvHP/rAWautAMihp2azx/AEiw2eDZpwT3rm
 BMwJoKZuDx26CqvoYMMeBh3zGSFseXiHql9gFTs5FYTRslplo03ARlGQAjMUqsrC55mD1c
 yuhCdQWoog47fGFAJcgt5fM2aGvA2+xrKUmNJuuMz6jhvBUWcNByo/Bq3sU3Eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CLKoiuB6
Subject: Re: [Buildroot] [PATCH] package/elfutils: bump to version 0.192
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,
>
> On Sun, 22 Dec 2024 15:57:23 +0100
> Thomas Bonnefille via buildroot <buildroot@buildroot.org> wrote:
>
> > Fixes:
> >     https://autobuild.buildroot.org/results/29502fe97a15e4926de7cf129b641505697de9cd/
> > 
> > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>
> Thanks for the fix. However, we need to understand since when this
> problem started occurring so we can understand whether the fix needs to
> be backported to our stable 2024.02.x branch.

I did investigate a little deeper the issue, and it seems to occure when
using gcc14 and musl, as gcc14 isn't supported on 2024.02.x, I didn't
succeed to reproduce the error.

>
> Also, a 0.189 -> 0.192 bump brings quite a lot of other changes. Can we
> have a more minimal fix to backport? (And then do the version bump).

Indeed, a more minimal fix is to backport [this
patch](https://patchwork.sourceware.org/project/elfutils/patch/20231210202033.151578-1-raj.khem@gmail.com/#162118).
This is something that I did and can send in a follow up patch if
required.
>
> When fixing build issues, we're not only concerned about fixing the
> build issue, but also about understanding whether it needs to be fixed
> in 2024.02.x, which requires providing more details in the commit log
> *and* figuring out whether a more minimal solution than a bump is
> possible (sometimes the answer is "no", or "yes, but very complicated",
> and that's fine).

Thank you very much for thoses explanations, here the answer is yes
however as it can't be reproduced in the LTS and as a bump will be
required one day, is it necessary to first give a minimal solution ?

Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
