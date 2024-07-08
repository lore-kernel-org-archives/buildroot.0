Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04143C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 12:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27EC80EA4;
	Mon,  8 Jul 2024 12:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZp-EE13uTCO; Mon,  8 Jul 2024 12:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA40481198
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA40481198;
	Mon,  8 Jul 2024 12:57:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C26EB1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD84581198
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHNG92UnFz_U for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 12:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AE4780E4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE4780E4C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AE4780E4C
 for <buildroot@busybox.net>; Mon,  8 Jul 2024 12:57:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.108]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjjCF-1rxDXH05hj-00i1PP; Mon, 08
 Jul 2024 14:57:20 +0200
Date: Mon, 8 Jul 2024 14:57:19 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240708145719.0f046597@gmx.net>
In-Reply-To: <20240708145436.55ec576f@gmx.net>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <3c9f622a-18c8-4331-a594-4a8b39639d93@mind.be>
 <87ikxgqjxj.fsf@dell.be.48ers.dk> <20240708145436.55ec576f@gmx.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:84II3BIgk4HF370LEXVlOJBXEHwbq+jh+sqsTWkAwn96UinklYe
 T3AUxOHJ/Z980yBHnU4YGuc8yA6Ytc0X5YNiCcnmsTlE37uWCrl6Df+tC9nUjjm2nIIbrV9
 ti929aIhe650HJzNefOFyQ/rGHVhhQ2yUF3N0cegMxn4YCF4O8QJmosAIRnyBsMMVM/pgNt
 2oEYOPXhczKdhu1h3FzGA==
UI-OutboundReport: notjunk:1;M01:P0:qMbgHn/DpBk=;KaxO9tY68Xopb8toz4C5TPujujh
 dh33sCS3wJBH86WVC/7yKyfL9VIQSWXjWtPjr+5gmBKskBeVtG3QExrJJPzvUhr6Rbuasw5UJ
 PBsvuG4Nt2VlnAU//FKI5o2om6YDhwWJZl+cBJVYskGW6PoadsxVFK5jzdiXOdFezbopXghpi
 twA4yyMOD0LlmGDcWo1uBZnvyckYJakPTjIVXejIPlZds0f7U+WoIAcigtvfpbrrwQhVUY0gQ
 iGSJgbQkmKFDhQFONCynrOUlpz1zBsEwzULNPHK6c7DwtUmVhledeqvOJ8Gx3ImCFXcFoSW7x
 FpaIz86XJJR3k8F1f77RVwMi2MTqbUdTwRgTkn6oKsrvuluhQmsoVGH5ZGSMNLeKA7VOjnYPZ
 1c7cyDq1DDkHFOFAh+sudxFgynzWAHjSHfXDbqYWRHtKg/4yDZ63/ncG/HDUyUv44Zm2lMSV8
 U/q+xIn3fK5gmKL/ywqzjCXPTI88NJBQWkhb7QsgTjBNao1T0xRVl/wFR7Z9GYK1M9fYCU2l/
 L3S2muVydnS7Bia1ySy8gTrYXPACBiyjdPC2joBMTNmIgJxZiea2MuXaFDm33rvmKwSeg9iPK
 P+52PgEpatOEtdG9gyVBA+IQzsWlfW4/oKoU/Qu6/2YlUYgXnjEwfZYPMPwgjNkzM68uERf6P
 8hvZlLxKboxmm2QOCXyJ2U0WUTxdGxJ0+mdoVw1BYD+uKrHkTGi3ypEfmL7PkMtEPRgPm5SE0
 RiFaBhMhhEz4b0K0qzYW0AGhI+sE7CrOxFYtGl0jGHMVlIHGSQR5cgESG3mkVimWrNqOkpxzJ
 H5AmMYN5+X2dIb55/+BrX7z3pmPtpLdcvj36j46AcyP3w=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720443440; x=1721048240; i=ps.report@gmx.net;
 bh=fj31fn/XACyAbltrTtvenQkIjfh47GPyAb29V2mNlnQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RWp4sxoWy2rJzf2rKjHXSggr78Rfi684PHEFZ8AUXpZ5RJqnxkpH9DtZ9QHMTT/F
 Z0EHn5+6M4rUSYeru8FIUwAWtfOOaUs+V8wISrs0DnzRut304+nWKGebDoCemmaoX
 6J08YiovfaisCj5ucIAAQEHx7CRH/Pr+nzy+7Z7hepadc9pUNXXzhjpbAkGMO0mtX
 gH4iWmMcZcCD0hSeqZHUhn3KBTgGUmSVWNm9Axzdoal2fLeyrfkcRXA2pbOGe/pPn
 auW7Ad0IT1/ZNLmRycM0b/R5zUM6E2aeg/wMXAS58U2P11Iq/sHJwW+Pof9YCmvH2
 jiSyzs5KE3Ldpb2HUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=RWp4sxoW
Subject: Re: [Buildroot] [PATCH v2 1/5] package/xz: bump version to 5.4.7
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 8 Jul 2024 14:54:36 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Peter, *,
>
> On Mon, 08 Jul 2024 12:04:08 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> > >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> >
> >  > On 12/06/2024 15:57, Peter Seiderer via buildroot wrote:
> >  >> - add key hint for download signature check
> >  >> - update COPYING hash due to [1] (change of home page URL)
> >  >> For details see [2].
> >
> >  >  I've added a statement here to make clear this is not affected by the backdoor.
> >
> >  >  Peter, this is for 2024.02.x and 2024.05.x.
> >
> > OK. Looking at https://github.com/tukaani-project/xz/releases/tag/v5.4.7
> > I see a mention about a shared library regression on mips64, but I am
> > not sure where the mentioned patch can be found?

See "[xz-devel] Build system fix for XZ Utils 5.2.13, 5.4.7, and 5.6.2"
(https://www.mail-archive.com/xz-devel@tukaani.org/msg00682.html)...

Regards,
Peter

>
> Do not see an upstream issue nor an suitable upstream patch..., the only
> linking issue I know of is from the buildroot autobuilders see
> https://lore.kernel.org/buildroot/20240703105013.1bd207f1@gmx.net/
> (affects 5.6.2/5.4.7 but not 5.4.6 - and could be fixed by
> 'XZ_AUTORECONF = YES')...
>
> >
> > The 5.4.7 bugfixes do not look very critical, so we could alternatively
> > also just not bump the version on 2024.02.x / 2024.05.x.
> >
>
> Fine by me...
>
> Regards,
> Peter
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
