Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41634C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBEA880CF9;
	Tue,  4 Feb 2025 14:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuSH4B4yIN9q; Tue,  4 Feb 2025 14:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF52480CCC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF52480CCC;
	Tue,  4 Feb 2025 14:50:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C214185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20EFB80CC1
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nktodCyNthCs for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:50:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC4F180C82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC4F180C82
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC4F180C82
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:50:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.123]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7QxB-1tN5Pc2XZF-016Otd; Tue, 04
 Feb 2025 15:50:05 +0100
Message-ID: <d17b85a7-96a0-4e61-a17a-33a55b530b3e@gmx.de>
Date: Tue, 4 Feb 2025 15:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>
References: <20250203120130.2332720-1-fiona.klute@gmx.de>
 <3dfa6faa-9307-4091-9a8b-f327a0be19be@mind.be>
 <434ed0ef-17b5-48af-9c93-1c7bb75c857f@gmx.de>
 <087a8c52-81f6-4031-b0ce-712fc8857034@mind.be>
 <bf504c35-cbe4-40dd-b56d-bfa3b62e552c@gmx.de>
 <CA+h8R2qSoHp-YPNDAtNiCMrsEEULhYZGZa_EveNnUuPHkeucMQ@mail.gmail.com>
 <CA+h8R2qfjy2PWktigLvq96Tg-GHvVk=uxicdkgW_pp84OvZBCg@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CA+h8R2qfjy2PWktigLvq96Tg-GHvVk=uxicdkgW_pp84OvZBCg@mail.gmail.com>
X-Provags-ID: V03:K1:d5A7HU0fG0XVfSo/DwVRGxRiXlMR7Czzf7qx/6uhUsmMWgsWbGK
 aQ9MxP//ABHRvImopXaocMsMo1QL2su3xiNCVLbm8AM8EeBU7zKmY8Rpnq1ZS7gO2hdzv61
 Rwtc3Iw9PmpIrFa6VlMiXdRqYPf/FGzILMd6HL/A3XiO8qcvzu/efQvhga3+JfscG4Q9St8
 NRZ4Xhd3wiwbBpMeZC6Pw==
UI-OutboundReport: notjunk:1;M01:P0:16dAH/tWLCo=;qj1Gsc+A02VLDDBegIeDRWHs3rD
 VUHk3JdMq2K3IvBktuHzDJ3CLSZcWV2ixWpDNJSOz5U/2SCYo8bFZRdyNVNShkHKDFvvlhZv4
 gAQsMIUZl78d9nc/F6pf1sgDWtInyMeZBKBmE0EnE6GBzOGJaTEkeS4VEe8oyTLKn5eOcgM30
 i9BlFre/9a87/1k3gAc2sWuq3evGkLAW7hZ+D2ZaHGTG9FX9d1oD0qmg7CmE6qdN1Yi4SrvBZ
 NjynsfAUMwY/Z3CWLkls1GTMHW6EOtp95w7jbdVsyQkDAmRnWRRyD3OpTTP64RhuSobRxJLSh
 gFrhh64fd+TZQs4hHtHoPCJl5HowfwysN3SrvDV2XxhBO1emBiol9lcJ4Uu5+sfba1cifcr0h
 Cr3K7J9VGRVDZdr9ritvGK8Oy5ng8D1f8FaSKae/Fy7JGqF+EiAIhvQOZJcaq6lhOpo4o5TQv
 8HoW6ldK8Sdo/UV2ZTwtN+IyAQCTZhlaV/S0pd90DiEIwJ68ECeXjjg2z6kqj+ggWlT+FlvsL
 mcqcLsTqo9zqGweB+RXr98cI38wpPprwalzA7EyD0cDUokCmNmSU7QN+oQPAiOVBr4zkcob0g
 +Us6+B2mDI+wPPrtOMImRsyEvvneZ9GDQW3pB+Phseh1CbTPykZpiOdoPSZ4gfTmqR1DkqRaM
 tUsAhXRMFc1uYRkfRSemEFUlRo65pQgPt6ZWBkrdYc14WaLkgELtwOA5NxOHHf09hNMiCz9ml
 cfmjXJ1CC0cig5rYeIAi0oeU8QVX2PMX6jSMIVY5wj3mhnadonlsm72o9dtrRL5o4uiWDQNqU
 gDS8KLTKZSFFlnjIlZ0MC+F8WcUcM8r9XyI8fZHIyAN1roOL349dPeh0aveGUnoi4775GeeLJ
 nTLnedCMlRisDep9YD9pkABFPR4juFKHAFlfJ/8I8OV3fQ2fvBnxJ5H0yuifaShst7LmMLPml
 VMzMtTFRXJSAxqrNWG0JEC6V8DOGdzZnag/fRwBBLJntIH/53taj1fH46lw2LJsu38FDaOLMO
 F1XpyBkTXsKB9XsALZjsu5pd+q29lGxsNknYbZBC+h8xtdIJlmQh9nlSB2RvGX/JikGkHQkTc
 3TcemEyfH8VkSHXiiJqSAljUqLyDw3aPfYVTNKv77xYNyEdbt7HAP7y4TzLP1qsMzDjUMFFiz
 ZUMXOY5EYfhjm6ywXIOdVyxbc3YyhZ+u2fNn6mX5MAbenVV0AveAtFx5YUg5QTPSyd9f3ef/1
 Bg289KVOtmWRsFARLKP03zyDA6T16EZvqPSDOuU6JBjaAf43nveRRQRW76XMtHgB3tl19Shcc
 YWUscHpeQAgQQgJxBLcvbCaX2IEiTFkOQnyU/EXr+40ENjcxzd7wDIZQY6cTKsJJuCMVlRCGE
 Yk3fKIqHhRgW67iCbGkhBnR3Me0mIWOabNAb8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738680605; x=1739285405; i=fiona.klute@gmx.de;
 bh=aUoKRcnf2JU7BMDIKe6WNxSzxh7dlE0JHfczVa86Azo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FBQHoNhyNC1izb4S2H2mZL/1x8yfGOna/q88XmILCDmQOWCrueba2gwgjtzw4aGh
 zT7inKuT6K6D2TicuXMHqRKKf0srruz53l8qJHRSCb+a/AbJWDP/F+OfOCWnbeceN
 aV6F9xyyADt8+Ynnv6OdwPJ1+zwTDVIEwS4Lg30mtGUOY9vVednL02BIcRdPLPSJf
 r8MnW6O4zmAoN24YGrI7QSMPVQiX/JETt6eeNrHWSeG12mNKhyaDiFuwd9dMH9P5v
 ZAqzSR0e5QsKFvgQSxwrdmvD4YerMYeEvpCcc2n94Mfa4sF9uVI+sdmCHwesJACQt
 QN77/50YCjd6+/ng2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=FBQHoNhy
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian!

Am 04.02.25 um 04:41 schrieb Christian Stewart:
> Hi Fiona,
>
> Does this PR more correctly address the situation?
>
> https://github.com/golang/go/pull/49748

It would fix my issue while not breaking the build for people who use
older toolchains with Gold, so it'd probably be preferable to the other
patch if we go with patching go-src.

But considering the EXTLDFLAGS approach works I think it's preferable to
use that, because it should also work with go-bin.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
