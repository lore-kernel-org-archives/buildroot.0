Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B16C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C89F417D0;
	Wed,  5 Feb 2025 14:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogSCvgVgar-M; Wed,  5 Feb 2025 14:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BEB6417B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BEB6417B7;
	Wed,  5 Feb 2025 14:00:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EC6212F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31D1E60A65
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjV2GoAUhSTZ for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:00:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB67160017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB67160017
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB67160017
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:00:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.32]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3Rs-1tzwMD1Zmg-00PBvA; Wed, 05
 Feb 2025 15:00:31 +0100
Message-ID: <e56eae70-a4de-4b9c-a7b9-134103d2176e@gmx.de>
Date: Wed, 5 Feb 2025 15:00:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
References: <20250205113531.4161633-1-fiona.klute@gmx.de>
 <Z6NSSKTVr43PjV+I@yd-6wlzhs3>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <Z6NSSKTVr43PjV+I@yd-6wlzhs3>
X-Provags-ID: V03:K1:XIjI+qFQ/Tdw1K36+iSO0/riwj8rnRPdAEckd5J8XV6oyiX8tO7
 VkAFFx36y96/8QhmyMbhjOA31go+iJgVIXF6gcnRWTsjtJHV5Nw7sj5a24EtH1zWlRvGMzZ
 GlQPICx+fmRT+luX12Sj6NzaQJH4DtLS9XsL/WYSXVcpYxKaeLxVv/ZRfUvsx2t70Hccv9l
 O3/i5x+IAfp1xal4OZe6g==
UI-OutboundReport: notjunk:1;M01:P0:3aXovm5A5e0=;E+gLpv7vwtDU3bEJqtUkznlLvcz
 5fgnVT5IBmg20gn+b9cq1+A64VaLFS2Z7b8kWGtK0IAX5QkPetLeYrw2FmXy8VLtxHPeQob75
 iRtXdKgPzFBIlfCPsm0TjmGQ4riU+YuLscOCcgfqSDgTWenB/Okp35LBL4y9wBoVcTEkeyc2q
 SZXAMmH6BTHmeFTvHZMaSqyieNUIpswUUSvvDrSvbLazXLo2pEQxt1CjdaY1P042Ag6OfW5CO
 rN0P0cEPJcjDoi1NdYJnoJgSDocJHIKXlNylDgLa0KpOXhZU3ZI8+ajm+6t96xHr/1inAOI4i
 2JTyEDvEfTUOsi9JWPv3D8v7DGqvGvcNCPJieiZdvfvhnWXVNul4QTfPSjIen4vs5FVqz2jqQ
 eWTRlshlIQkAszlc9qDv7/R3K0JNj7C1nsOo80ycGGv6MZ9kkRjWI7DJFfpKw4WopM+ALmus3
 xTC7EN8wSLnJ23knBqrOskfBcRSZJBW4a6LGxh9Ha313A8z7EqsWnBh+DobIovwG48kT6/gaZ
 YRfxNQk5H7dKnLkgmyffjTbmA7i8NqGdEApN+cM09kMLtpl7HC2FuVrIDwgQzA5UmeQAD0XFD
 jK37FQQJjMjbsfyRMcSMy1DbJVuRNFkQKeU/S7Gw3k8IqRmmkSVlPb2J4aJfL34zR594TuG/V
 rtDEZcgYZJeaoxMKCaPBrXzVA8qzc7NTPOHK7xpCVvz1YQ0hSCvMVG8yYu6zNBz1ISkokVO8/
 rLKyCWgznR7/Avin/TCB/wAzBoj3mnMKJPWIZBi68T8I0CTPwhLXoBezT6mcP1JbbPrBwfovA
 uU2QYfwf+OKl9jCtnXUP0xkIqKZdXwhOEeIaqDWP/4wytvITAmcVJW9nGZRLrKnzGozfmx5UV
 bP+eS/anDOeKgSrQ8ECbgGkuKiv9kgAEwMRZGA0GqpR8+8ozleVjRn+7WCQjOCA0hxket9VnE
 R4QVSble7V8jLwFS6vRq84vpt9J+S/Lw26CufcocXXPkTXU29uf6FTuSmh/xdu8rl/iRKet02
 bDk9FsvO13vfuYiYhfSN/EuaDoqT+vSTFHO8nGB8YaEsLVcBfui36mypqnUpgwjSkSctPmp9I
 Iai0v/tyGtwphoUEGHQ1vvct9omKAOW2Jwcd5jX2Dsm+N910l2KJvzctaDCJwqhMhYMUPEIhF
 JDfvEohL/SN/YlPdYvNbJF01TdCTCWZtDizGYv7iFBgb7QKPQvMDWYcIsQF4w9n+J20lildyP
 ieHj+lINw03uHJYhCTqDo/ybTtDLn6FA7XhuWeTY/zg53sTPuTFeLaJ+uBith+p2uCAQaIayU
 UL0cggarvG7qcRjjThvoSGOzCnfTO5fWXkYULmKkFQs4Kdxu9LA2mWqzr9NN6KYf9zYQaoJac
 2enfmiiBFgoffLrkKeN8pykFPMTPdKNleftlK48i2EYLjj5CIq9bgNprcIe2yC1W4x6Q0Xo3X
 wxpbsqA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738764031; x=1739368831; i=fiona.klute@gmx.de;
 bh=KdKyJERNK865qvu0kzERxfJCcMffMINZbtdjQswUKUA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=sj1JBVHzLWZdLJa0ismXRQfM0E7wkl0SRJCD/ZY4WGr81L6VsAwbokrKaZyL41Wd
 t3YqGC/mxE+Pb/Lc4YM6yOtySk4PmUDdb+rZBOoKWBAsuMYUQyN40Q17MBYKcPI0M
 t6rzQ6knukkLLJ9HhCl5U4aYjqwc59ELzdVPGoP6WYcLSqhrrC+IUDsAfejN8ldFN
 qZnqzsdW5TxDSaWVVAmg2iC0VyAuoiSpjVR3TLZ1KBrpf8Mb87lYi+EH+4rIlLp/E
 K7eK28szlGJIG6zDNUZns6wzu6+VInHv6qwInXh+dG7lQy7i6ZoDFC5Nk6lo98j52
 Oz0Arlxl1nxrZ1eDrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=sj1JBVHz
Subject: Re: [Buildroot] [PATCH v2 1/3] package/pkg-golang: allow packages
 to provide extldflags
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
Cc: Nathaniel Roach <nroach44@nroach44.id.au>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 05.02.25 um 12:58 schrieb yann.morin@orange.com:
> Fiona, All,
>
> Thanks for adopting this patch! :-)
>
> On 2025-02-05 12:35 +0100, Fiona Klute spake thusly:
>> From: "Yann E. MORIN" <yann.morin@orange.com>
>>
>> For some packages, it may be necessary to pass extra extldflags. For
>> example, some packages will need to be able to specify what ld to use,
>> and so will need to pass -fuse-ld={bfd,gold} as extldflags.
>
> The rationale has now slightly changed, in fact: it is not packages that
> will need to add -fuse-ld anyore, but the infra.
>
> So maybe we can rewrite that commit log slightly:
>
>      Currently, only the -static extldflags may be set in the golang-package
>      infra. However, in some cases, it might be necessary to pass other
>      flags, either because they are needed on a specific architecture, or
>      a specific C library; packages may also have a need to apss
>      arbitrary linker flags when they use CGO linking.
>
>      For example, on AArch64, go forcibly uses ld.gold, but it is not
>      available in all toolchains, and ld.bfd works nowadays (following
>      patch); another case is musl, where PIE is not supported with go.
>
>      Introduce FOO_EXTLDFLAGS, which we use to set those flags, and that
>      packages can set to pass such flags.
>
>      Migrate the current setting of -static to use that new variable.
>
> I guess a maintainer can update the commit log without requiring a
> respin.
I've updated the commit message in v3, together with the update to the
commit message of patch 2 you requested.

Thanks,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
