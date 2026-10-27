Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FA2606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i3aXrc9z;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=VCdXXGIs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C43E1607A2;
	Tue, 27 Oct 2026 14:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrDfGNM6jDBl; Tue, 27 Oct 2026 14:18:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8D3706078A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793110713;
	b=JLlsihXv0nUzGfzABi4WoTbYXXTgKcOW7fpLc/a48XPdI5uR8ex6+s/51TCyHXQ0UNpT
	 XllQ3tJdS/k9g91oLYqbAZuBJ8avxHBGnW37hJW8+Sx89ieBhjMPLXe5prAg4vXWwB2l3
	 XPuLqAekBtLDM9wZlCy2rp8MlJ79yZ+v9kN4gQlQqasBwurfZOcjNrra3ztJBkf6uo6hU
	 VSxKFDoOpPVRFMmkPRgO3J5a4KKz3sUZ+zagu7wNxScZV4oX00DIO97kBpRgt6NCsr1sN
	 MJ+HaDTKrcRlFAz2V5UzIrHCle/2J1stpO9MJZCVBMzm2KXhq12zgrtIISno4N6epeQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793110713;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Errors-To:Sender;
	bh=tNr7+we/osiBNAH9P9noMe8AbAU6T+sGelLJkEFKcCA=;
	b=gk7M+Q1FihJLx4Ti+in3PbEL4GRqPxBh6AIZc7iRTKEmw80AE+dg+poZDJEUJmNOnWmd
	 FUaoMacFDMxz0WvTtndW2YWjYpJXCvdbDtUVE+Ii9u40ZVnp602rk+u3EBzbwrqWR+PVc
	 u4beyBDivdL3Wm29f7qaoWKpKI9fRp8SJ9SC6G9JFQ6wGLnZnZPxHVVzuHlV2JYSSx90D
	 +JQzV80qPMDqHvse6Q5+7xgDbONcg90RXbrehDdrE2ZIWv7y+vIewhGq0LVxmZmNDyEvq
	 6bg0wQI09DcEf+57OiQioI1sGE6/19yu9V77Or4bsU9HoIzNZHzw8B6AGiqPfSvXJ3A==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793110713;
	bh=tNr7+we/osiBNAH9P9noMe8AbAU6T+sGelLJkEFKcCA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i3aXrc9zENyKTid8Gt3qlKMqHbXqj/VQrvw+x71pKR03/WAMiH+oQkopaMM7QY1ab
	 Bq9DFlwQ88v9g4YDcmHCpFYypsyUaWGrM4Xcld3io6M37Gj+b+OsejCtkUnTg7YhPd
	 sRZAvPl19ovaYCQKPP7LWERyu9ASgK74ZK4nLaIM3JKIMf7ARq8vIfDqGYrp2BGC9r
	 J34pt46TNI7wYXQggZGj94hIyvnyCPGMpWqzDeqqz0EPNn3ug6aOMMcD8FXJQBnTMF
	 9Wd6AgU+AT+kZKyRbSNWlsgRtBjZdiU9MpHwrUeyXrDT4f8d8BfcsNN1ny/uWodjeb
	 hNHGP5A4peq4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D3706078A;
	Tue, 27 Oct 2026 14:18:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3665A32
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B50FE80CAB
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35mm-4k3DVcy for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 14:18:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 35CC380C0D
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793110710;
 b=f0MHwvvOKbnSA0AlU7S07yVy2fYPh03Axwre6MOR2SCRDiztfl+WiGvUVHGxCyiQfRvW
 Y84Aziopyz6cCx9IbVHpyexlLGXGAkmr021bTJh/Kf3zPBSHvB4IPYke8Uqq0q3rjPgqx
 S9hlK41mBdODHHkEy/2UDkC2932EUb7scYGvcvBMZZ9IfBOYr+80j+cNtXooFjztncIz1
 ym8l91eeZ9JDinkAN69JqqAPSWcFMTcT5NQ9luT7ZCKNATfEPBh3b/zC+YJj5kPxd1fvD
 UWZKGflChkW3tV+qCMUcMW8rmbuXk4uXhVyE0IVU6vGb2vawqWcNtZQCdpuWo2GtHLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793110710;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type;
 bh=NI8kymzVUBpDRsmCVKaR2t+eSwiZ0dz3QxLvZD8PF+M=;
 b=O28f2gjIyvRS0CSVfjZwhzbSJG0Z95hcPLEdObAIh9NwUlXzTyBmcq+CcZxyB3ge0+dm
 tqec7AF6daowhshgw4NYzNW1t4R458BqEg4d8I7KaBeVTFHxiBjGcqY/5R93Ku9dvUhsK
 pWNo5fXMoE/4TRKH46dScLRaxvFyP7jYY0QVqwu+Ne/XvnHkle6WFmGlI2ZzpvQv9kVoa
 397mEyKFjEd2+dKUCgfSuGxbwTVuLZa87bnfg/bIfosZl3OUGDrVUE133UebmqeqEKKwT
 nuEF8/Q6ti5cfvCmePNe+fdFb3jJ+4LfMcacaL/JR1D1w94aLCcdve6vxrEn3aEXDew==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VCdXXGIs; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::531"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VCdXXGIs
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35CC380C0D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:18:29 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6acbaec0d70so898397a12.3
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793110708; cv=none;
 d=google.com; s=arc-20260327;
 b=Faa9SxAm/zAG399qW29HVNzVSp9/WJN4v+BQ5ppca391/IV8Pm9SbUYo0P+QWXairQ
 /lwMEU22BMhHjec07Ss0qzNixaU/7m0iK5q7qeqJBEQTI0liaZwWwrNpJ2mD00MO+1c1
 STZpKHGijhcGhiHe1ZPUcvZm18WyfSXopvosYRe55fq7Y9Dr3fTR334ZM1rVayKvuTdu
 S2XhZDFsx5lOeZPHk2khUy6QmzkgSHzKThSwUpfhVS5BqpBDspFgssT9ZKjc+m1K/jOU
 ibDWkZnOXa3qEhny8MyoKFmrNTkEkbgW3jfYkzFKYxYsi9jQtMVN3zdvemwSRwHrr343
 dN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NI8kymzVUBpDRsmCVKaR2t+eSwiZ0dz3QxLvZD8PF+M=;
 fh=MvSVtw9htDxv9r9FhpzWqQhPkO+GQIclCZqzVC/ikTg=;
 b=VDbeNw1YuI6ozdEV12dOfoIxkr+biESTwaHWT6OrR7zwoX2FaJ0VxJODAn8lUCA2c7
 tzFy0xqW1/s3YkjL5MM54jJNoxAWerZT6ldZFNKwrqL0+b2lW8lpFf77EFCZmKQDZ5Vb
 MYHMPrWPxZrPGd00+045myUL1XW73OgeM3WUVpu28bbNw2ROCI7KJD6v9a+NrFc2dhkv
 D+OmONK/9B9CAWsJznXd44yBOnHCDvoenSp9oTj1K4oaRgK4t+bc91/LiFVp082rsQDg
 UrXx5xFVREkeRVab2b3sqOUSoQbGfT9eJOfu3BgeRCeSbYTCC+1UsinJUi5051bdT3iM
 EpAw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793110708; x=1793715508;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NI8kymzVUBpDRsmCVKaR2t+eSwiZ0dz3QxLvZD8PF+M=;
 b=VCdXXGIs0vBRME1m1mXKYn13gtZW7Tp43f2vD0wOC6nGZNjBEtoE+xX4CGv8mn8pOD
 BHqAywhCdL8VzWCTYoFtih+XAp48knwE8hQGSNATBvSTFujP5W/OkNfsBdIBUbyCpR0l
 hwek4GGbcfjJN6qmSoYX0PrJ9KCH0x3sM66Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793110708; x=1793715508;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=NI8kymzVUBpDRsmCVKaR2t+eSwiZ0dz3QxLvZD8PF+M=;
 b=ce5jeI526oWrRaQsKrUaLnXEtMY/zwMROxecmOW8j6kPyNI3c91ah+4OtJIOR26s1i
 cjIjPl/KM8/luu86G5cbMl2IqLhGiir5v1hnWjV2u26oEm/sCAr2VrlTNoqlBRBTXtRG
 bHZ6GSD3F0KMOril45FbQSfB8hAD+8xl1A2woSxsHl96V7wlY3DD0aCdGJz+MRrEJ1hx
 hNrUT2CqErKjsSw2wqDy3HM5Wn9yhB3BBZuan8g7XKleWmkh5w69yAy5wDJ4pPDSYlc9
 jUCW/LbhFfDQo24CgOAzfndcPWY0UfWOmYeLcTOqhrz3d4/Tq9TXc0JuI1s+RbMh76eL
 Ngcw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxF3Kxz5Wr/n3Xxwuvm/lYoYJKytqoixfEZzq/+y0K8Ssi/BQAn6+a6OA3PsDLYvdSYNQT2HXTNI+Q=@buildroot.org
X-Gm-Message-State: AFq9FYK5LRVRmUzkROE7pl8Jv2gbWx6V1014vsHOhxzt6PSvjWLJizx7
 kTmsShCziM/fEI4P1quv/SuokEWmuUhVsF3sbiKD1tNq3RX5hOL06OD2ZhPkesbBCnOsUJ0zAsX
 bbGyXdROaNB8YQNJo6wKSmhqTQa5grDWAmishJJIJvo4TaTKM3rPVWOM/wg==
X-Gm-Gg: AYBFou2MbsBeHuNujTIpLtTRUq9TBc42+PITXPi97+c7EDPVWnUzS0PM4gynbb2sNtt
 sOa7TlsB+sQs5+JEuKipzpIEI4x5NKhujo/PKm4lkVNpZeONPNyl8I9euYA1MgiVIgsyK4A7Y3m
 II7mR1EgCHCBdiASUPILXFfcRkGPoN2Kq39q7xsXpZHM1z+8wqccTcsN5t8s6y40Mp8xPVZ+I4c
 iqJEKYKxkHI2DhMdCEmDrTHE98f+0FCQ/tIiMlHDKF8hkcP5UP76GIkOSvAo4zcRT+y8GmajBfq
 zbIuAiMyMwuDpaqg59x9x3Bb56ymD3gftzT9pf5bWW+uFfPMgWuTCtndCgVE6tTPw9BJJ19YhB1
 ASXPBw0xvaAj5lzdyGt90jR486D3sOZVn4Ol+2qdbCusEeFPx3QkLULRO6MW7yn/AL8SnEOmqw5
 vGsBRNxnZnMuXytGdubYo+RFpTZJ0=
X-Received: by 2002:a05:6402:a509:10b0:6b4:2f4:fc49 with SMTP id
 4fb4d7f45d1cf-6b4429fd6f1mr10751144a12.0.1793110707406; Tue, 27 Oct 2026
 07:18:27 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027101235.2876416-1-titouan.christophe@mind.be>
 <auCgGxiJaYUrMKSA@windsurf>
In-Reply-To: <auCgGxiJaYUrMKSA@windsurf>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 27 Oct 2026 15:18:12 +0100
X-Gm-Features: AclHuK8_vW_pvkpS-3HuR-Bfmq3Lipnqz8VeBSvdO1RKC074gNuqsSbpCklcMkM
Message-ID: <CAHDQB6PGTdFpdKPo3BZj-W+zU1mvNuwYjjWB+R0i2hkcfQMeOQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH v2] package/mender-update-modules: fix
 LICENSE hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4798187216462425819=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4798187216462425819==
Content-Type: multipart/alternative; boundary="000000000000c21bbf065ed31e42"

--000000000000c21bbf065ed31e42
Content-Type: text/plain; charset="UTF-8"

So crazy that I have a pending patch I submitted over two months ago that
was
not only reviewed by you Thomas; but I responded, and then the patch was
ignored.

Then this one is committed in just a day?
https://patchwork.buildroot.org/project/buildroot/patch/20260807125510.1285300-2-adam.duskett@amarulasolutions.com/

Adam Duskett

Business Development Manager

M. +31-627-966-675

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Tue, 27 Oct 2026 at 13:59, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Tue, Oct 27, 2026 at 11:12:35AM +0100, Titouan Christophe via buildroot
> wrote:
> > The SHA256 sum of the LICENSE file was incorrect, leading to a failure
> > when running `make mender-update-modules-legal-info`. This seems to be
> > the case since the introduction of mender-update-modules in Buildroot:
> > the license file hasn't been updated upstream for more than 7y [1], and
> > the buildroot package was introduced in May 2025 as Buildroot commit
> > a474642fdcd8 ("package/mender-update-modules: new package").
>
> Crazy that this has been incorrect from the start!
>
> > [1]
> https://github.com/mendersoftware/mender-update-modules/commits/master/LICENSE
> >
> > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
>
> I've added a Fixes: tag:
>
> Fixes: a474642fdcd8 ("package/mender-update-modules: new package")
>
> and applied.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000c21bbf065ed31e42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>So crazy that I have a pending patch I submitted over=
 two months ago that was</div><div>not only reviewed by you Thomas; but I r=
esponded, and then the patch was</div><div>ignored.</div><div><br></div><di=
v>Then this one is committed in just a day?</div><div><a href=3D"https://pa=
tchwork.buildroot.org/project/buildroot/patch/20260807125510.1285300-2-adam=
.duskett@amarulasolutions.com/">https://patchwork.buildroot.org/project/bui=
ldroot/patch/20260807125510.1285300-2-adam.duskett@amarulasolutions.com/</a=
></div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" style=
=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;vertical-align:baseline;white-space:pre-wrap">Adam=
 Duskett</span></p><p dir=3D"ltr" style=3D"color:rgb(34,34,34);line-height:=
1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fa=
mily:Ubuntu Mono,monospace;color:rgb(0,0,0);background-color:transparent;ve=
rtical-align:baseline">Business Development Manager</span></p><p dir=3D"ltr=
" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:10pt;font-family:Ubuntu Mono,monospace;color:rgb(=
0,0,0);background-color:transparent;vertical-align:baseline;white-space:pre=
-wrap">M. +</span><span style=3D"color:rgb(34,34,34)">31-627-966-675</span>=
</p></span><span><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Ub=
untu Mono,monospace;color:rgb(0,0,0);background-color:transparent;vertical-=
align:baseline;white-space:pre-wrap"><a href=3D"mailto:adam.duskett@amarula=
solutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a></spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Ubuntu Mono,m=
onospace;color:rgb(0,0,0);background-color:transparent;vertical-align:basel=
ine;white-space:pre-wrap">__________________________________</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:10pt;font-family:Ubuntu Mono,monospace;c=
olor:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-=
space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubuntu=
,sans-serif;color:rgb(0,0,0);background-color:transparent;vertical-align:ba=
seline;white-space:pre-wrap">Amarula Solutions BV</span></p><p dir=3D"ltr" =
style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:10pt;font-family:Ubuntu Mono,monospace;color:rgb(0,=
0,0);background-color:transparent;vertical-align:baseline;white-space:pre-w=
rap">Joop Geesinkweg 125, 1114 AB, Amsterdam, NL</span></p><p dir=3D"ltr" s=
tyle=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:10pt;font-family:Ubuntu Mono,monospace;color:rgb(0,0=
,0);background-color:transparent;vertical-align:baseline;white-space:pre-wr=
ap">T. +31 (0)85 111 9170</span><span style=3D"font-size:10pt;font-family:U=
buntu Mono,monospace;color:rgb(0,0,0);background-color:transparent;vertical=
-align:baseline;white-space:pre-wrap"><br></span><span style=3D"font-size:1=
0pt;font-family:Ubuntu Mono,monospace;color:rgb(0,0,0);background-color:tra=
nsparent;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:in=
fo@amarulasolutions.com" target=3D"_blank">info@amarulasolutions.com</a></s=
pan></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0=
pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.com/" target=
=3D"_blank"><span style=3D"font-size:10pt;font-family:Ubuntu Mono,monospace=
;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;whit=
e-space:pre-wrap">www.amarulasolutions.com</span></a></p><div><br></div></s=
pan></div></div></div><br></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 27 Oct 2026 at 13:5=
9, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">tho=
mas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Tue, Oct 27, 2026 at 11:12:35AM +0100, Titouan =
Christophe via buildroot wrote:<br>
&gt; The SHA256 sum of the LICENSE file was incorrect, leading to a failure=
<br>
&gt; when running `make mender-update-modules-legal-info`. This seems to be=
<br>
&gt; the case since the introduction of mender-update-modules in Buildroot:=
<br>
&gt; the license file hasn&#39;t been updated upstream for more than 7y [1]=
, and<br>
&gt; the buildroot package was introduced in May 2025 as Buildroot commit<b=
r>
&gt; a474642fdcd8 (&quot;package/mender-update-modules: new package&quot;).=
<br>
<br>
Crazy that this has been incorrect from the start!<br>
<br>
&gt; [1] <a href=3D"https://github.com/mendersoftware/mender-update-modules=
/commits/master/LICENSE" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/mendersoftware/mender-update-modules/commits/master/LICENSE</a><br>
&gt; <br>
&gt; Signed-off-by: Titouan Christophe &lt;<a href=3D"mailto:titouan.christ=
ophe@mind.be" target=3D"_blank">titouan.christophe@mind.be</a>&gt;<br>
<br>
I&#39;ve added a Fixes: tag:<br>
<br>
Fixes: a474642fdcd8 (&quot;package/mender-update-modules: new package&quot;=
)<br>
<br>
and applied.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000c21bbf065ed31e42--

--===============4798187216462425819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4798187216462425819==--
