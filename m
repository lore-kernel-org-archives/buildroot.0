Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A13C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 08:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73E41408F4;
	Mon,  3 Oct 2022 08:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73E41408F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S77tSBTuTs7p; Mon,  3 Oct 2022 08:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85A0E408DB;
	Mon,  3 Oct 2022 08:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85A0E408DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B40741BF271
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 08:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A06A408DB
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 08:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A06A408DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00LbzQ7Gd9m6 for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 08:05:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D501408CC
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D501408CC
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 08:05:43 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-3588d8c33b3so32343137b3.8
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 01:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YnjCjxlEXdobwG6STz+I1HaoBMOcxPOKgyIUe9TF+W0=;
 b=bZTC6rIqp61hdBnqT+7HO6NJ2u2dzsGvzSPdPlbJRZqBA7MAbukno/92EkOuB/jove
 MYhMaFSo2N4TDze8novyc5uU/NI0lkPNLVSsnoLj9EiWnSUCVr3tR5p0zG1SGKV0Mk7U
 oX0cAyaEyHM31Hq2uc/AnRaCDvSXKW+rtLvGbRzJ8yAIqT7Io/CXfm307+plB9ijHPE0
 j5Mx+dX/ly+8TmI05DfJULHBLwd1L4Qrlrt0jVZGVtJALUtYScD794kAulnTmvHJ/pPY
 CYh8Vlf2fxAYJhHUideMT5w1cypT8WluCraTlh4JfKgTDfp6+/aBKR9Qri2kFokX/Mmh
 X5gA==
X-Gm-Message-State: ACrzQf2B0qAPENoIhLhNF2zjpYfjtyqzo3vkggNH0ZPLy+PehsBtBeul
 BRfmayREdLAlmVYuCLp6thT5fJ2xNkJxVYMzoW4=
X-Google-Smtp-Source: AMsMyM5K007BlEZXYZbHOzFXccTNunaTswQcCkrwhmAXlKkPt4Qvc8vdN9o3Bx0in6+C3HLj3XnIHB6mZikHSPaGzXY=
X-Received: by 2002:a81:7bc5:0:b0:357:dea:4e31 with SMTP id
 w188-20020a817bc5000000b003570dea4e31mr10634957ywc.164.1664784342380; Mon, 03
 Oct 2022 01:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220927105835.760768-1-nunes.erico@gmail.com>
 <20221001205459.GW30794@scaer>
In-Reply-To: <20221001205459.GW30794@scaer>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 3 Oct 2022 10:05:30 +0200
Message-ID: <CAK4VdL3xSRToEv03-Cz3KREOdB6p7XNV5P4HDSvm6rCnuVii3A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YnjCjxlEXdobwG6STz+I1HaoBMOcxPOKgyIUe9TF+W0=;
 b=EWvKCzk3uOZeiozbQHVeSsrOO/MxnmgwRT7lxFdkdGkyI2mHFuXHfA3q/GKKx/EvfH
 lU3/RV6jwtjExDJmMK1fKO3+Jtk1iZAxm3dPMt7HY8+A97OIpPS1ijMYolWF+cvH8zxb
 TF/fvFkm7hcUZfh0YP7DuTUcPZ5rP178xoAWAyrbt0avcJH4L4Cw9NPPXRFkvjx9znqS
 IY3ATHCCxiAdK0/0am29YJnHyXw4MwzGOUWEpqsppc3rkS3/nGno3tqcpMS6MCShuNbY
 bwMIXl0b2VsvIMO8rwJyy9RtZSIxD7kkNuue+xKMLP9CykzATmmxMv9Qii+XvTZStegg
 Zbug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EWvKCzk3
Subject: Re: [Buildroot] [PATCH] package/efibootmgr: bump to version 18
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 1, 2022 at 10:55 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Erico, All,
>
> On 2022-09-27 12:58 +0200, Erico Nunes spake thusly:
> > Drop patches which are already applied upstream.
> >
> > Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
>
> Does this change depend on the efivar bump, or can it be applied
> independently?

I'm not sure, but I guess having this with an older efivar is less
tested so it's probably best to apply it after the efivar bump. So
drop this for now and I'll resubmit as a series once v2 for efivar is
ready.

Erico
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
