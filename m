Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83D2CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 21:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C60640F3A;
	Tue, 12 May 2026 21:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFWBZx0aZwQt; Tue, 12 May 2026 21:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D79840F40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778620615;
	bh=S/UNX3gsFXkI3uomC12ZhApOtYZgdROFeEonM5rAuMA=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=hEB7+L5aE8TDrdQJ0WGW3xvaV6J6hZG9Haxa5TFlfYW4hWKKU6otDGaNDErKiB5E/
	 gR+p5xw3N3LskVgUsAwVcRq/m4BuxW6EivETyjAFWWmT5uKwr1MMBwxKhKBf0m1eWu
	 EiOGvHHWKB6bZGgsOzQ2two7IeTxwoN2IU1/bOvnFHmlMXQeG82bOQLXdDTbEkeEq5
	 FalAuisSvf268ljWUH15k1O0xiycBTU1uWxhz2nzauhSR75v3ae2NfOn9jGXpw8cNS
	 2IJFHW7a22/TZojSB6sFh6P7aGfze/1rG3A1EZUsUf3IgBfCCjaKZRPXipy4jDuOMH
	 pLjxLdYtVayhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D79840F40;
	Tue, 12 May 2026 21:16:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9189715F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 21:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D95B40176
 for <buildroot@buildroot.org>; Tue, 12 May 2026 21:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BVGt8oIvlms for <buildroot@buildroot.org>;
 Tue, 12 May 2026 21:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5173540052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5173540052
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5173540052
 for <buildroot@buildroot.org>; Tue, 12 May 2026 21:16:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso54955965e9.2
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778620611; x=1779225411;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aXRwrsXdr7cb7czQemUcs5FpslrRZ6FR0TNky9GJ3nc=;
 b=hZ6obNx+KMz8L9FXOlD58uo78eAVlDKxo7nK0pk/XVoUIQ4anW/w5wRRm1G0PG/uzT
 rIOWLkuR6+wdOuWlehNwrrinJcbInwcrm2LbZ/wwb4y7byGmw0SlOj4VCIi4D3U4QXaF
 t/wyE+5R8vc1f1fnQsJGGGt0viZb7QG6xirTVI+9VIdVaKwBy60l1HAGscoHTfC+TRg1
 X6tG+dWFa8GOhM8o1M7kpQh4mt8xTz07nVa8bdlXKvEgPoEV9CG74kM8dOA4wXAvApbM
 tBVO+P4KoXDyWwxGsVT7CXwFfK0UecBWDB1kkSFhE7cXnzu/+Cl1Km431+PNUtnSGf4F
 9hYw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9JCa7qT1xuQp28CulMfpu8Q+5cQzjomRehiWR+rVKgOIHqb8NRvbY2jSTPgO2bE3GE09A4jWMT+pk=@buildroot.org
X-Gm-Message-State: AOJu0YzhnyNlCu4bvC8+FjNhE9blLvTnFF+FDtVbM0OeTC2uGeEuy6b3
 8giHrXl28qGjKm7PtRDeCbkLH1xShqIHwmAOVGy3GghycJiAg5Bve7DwZR2uRQ==
X-Gm-Gg: Acq92OHamrl9y9gPHMSztDjePG2hKcQy7y5AoLHpG0NXmtQ/N6vhpqwNg9qjlAomgQM
 14PuR8FvNphWI6Uorxpqc7jpTihcoMKzBB5Ig6gCO7cJIKcPBvqHMilCjt02GP4hBk3s6rhtMsP
 ZYxYCwF/Ro2NXOQCdryyxwA5Q6RfD1DlJY9gBErfhP4Votm2Z3wI5Iu/lfWtAMzJ0qB1Sc9pPth
 bCgpJxbhkObqV8tnRkkhXXMdQWr+e8gtUFsDJ+d2MAIcJM9StP5/AYWDX4va29luKlzUzjW77w7
 oxqscjey7ZnUZi5tXwz/sBx3thWnLq1iaO+kbL/nbuswUcBpB4pxZqVrVlWc2X1zCTV44MmDlFT
 U66IhdblTRlqqFh1IuXiaX6EhhbX4c41bwauugwn0TbeA6vHfmjq9eBmNvF6mKHC/ddmaZR2G7a
 YGlY9n+0k1UcXmjABMGZwr+ivF582BhtRF9iWYnSCQnK46h/oRtm58W//kyjV0
X-Received: by 2002:a05:600c:c167:b0:488:a977:8de with SMTP id
 5b1f17b1804b1-48fc9a345b8mr6654435e9.16.1778620610775; 
 Tue, 12 May 2026 14:16:50 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d624fbsm59091315e9.10.2026.05.12.14.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 14:16:50 -0700 (PDT)
Date: Tue, 12 May 2026 23:16:47 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Kanak Shilledar <kanak.shilledar@axis.com>, buildroot@buildroot.org,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Arnout Vandecappelle <arnout@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20260512211647.GA67744@pevik>
References: <20260512105602.83368-1-kanak.shilledar@axis.com>
 <20260512105602.83368-2-kanak.shilledar@axis.com>
 <1d003106-63b6-49d5-90c0-4f7c0f2f1f79@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d003106-63b6-49d5-90c0-4f7c0f2f1f79@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778620611; x=1779225411; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXRwrsXdr7cb7czQemUcs5FpslrRZ6FR0TNky9GJ3nc=;
 b=U63/3TR5mbZdfS83ynpGYJ1gkEqbL9gouZDgvWTa8ItkkZg4JfJWwnrSakYSxjEyv6
 x2uyXzO6EqVELhn6zIBkKkCz4dJJfIIQu82lzQC03r8Dr/0/XTBs3JOjwnihf4CPdr0p
 1lKIHAzRbsAwPooOcxPncmzomcQefSTYRDg/sp6ceu/XGz1CPxDhnRuXgmDmmS5pdLqE
 KyGeM3j5/D8AWFNkedM51vqRKpew8fGbOw0cSmY//EIHrQgsqiWkn3s5F61UvJ3qgo04
 Myp343GZd4HskqMNyF51CokSgPiW/szXcme6s94tMtAucWK7x7+DDQyV+OtNOEp68kW5
 WBYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=U63/3TR5
Subject: Re: [Buildroot] [RESEND v3 1/1] support: kconfig: Fix compiler
 warnings
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

[ Cc Edgar and Arnout involved in 324612d68e and Titouan working on kconfig
update ]

@Kanak I'm sorry, reading the description of the failure:
324612d68e ("support/kconfig: fix compiler warnings")

    Normally, we want changes to kconfig to be reflected by patches in
    support/kconfig/patches. This makes it easier to resync with upstream
    kconfig. However, in this case, everything that is changed here is
    already changed completely (and differently) upstream, so there is no
    added value in keeping the patch.

That means I was wrong in v1 where I asked for creating a patch.
OTOH it's a bit confusing, it should be at least documented in
support/kconfig/README.buildroot.

> Hello Buildroot people!

> On 2026-05-12, Kanak Shilledar wrote:
> > Add a new patch to fix the compiler warning given on Ubuntu 24.04.4 in
> > `util.c` warning of `-Wformat-overflow=`. [...]

> This seems to me like a duplicate of a patch[1] I sent in July 2025, as
> part of a series[2] that also updated support/kconfig/patches/.

Thanks, for pointing this out. Indeed it is. I'm sorry that I haven't finished
the review. Unfortunately nobody else haven't reviewed it [4] [5] (state new in
patchwork for one year old patch is not good).

> Also, both your patch and my series are likely in conflict with a more
> comprehensive rework of kconfig[3] proposed by Titouan Christophe on
> 2026-02-04.
[6] [7]

Thanks for the reminder. I'd actually prefer to have this update. There is some
requirement to change it but that should be trivial to fix in new version.
@Titouan do you plan to send a new version?

Kind regards,
Petr

> Regards,

> Edgar Bonet.

> [1] https://lists.buildroot.org/pipermail/buildroot/2025-July/782825.html
> [2] https://lists.buildroot.org/pipermail/buildroot/2025-July/782822.html
> [3] https://lists.buildroot.org/pipermail/buildroot/2026-February/796328.html
[4] https://patchwork.ozlabs.org/project/buildroot/list/?series=465475&state=*
[5] https://lore.kernel.org/buildroot/c8467198-efc1-45f9-86ef-0726d06df295@grenoble.cnrs.fr/#r
[6] https://patchwork.ozlabs.org/project/buildroot/list/?series=490997&state=*
[7] https://lore.kernel.org/buildroot/20260204154340.766528-1-titouan.christophe@mind.be/#r
[8] https://lore.kernel.org/buildroot/20260205082847.4b855528@pc-1/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
