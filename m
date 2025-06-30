Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85D9C83029
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 19:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F0841A28;
	Mon, 30 Jun 2025 19:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDOOXYy3xTP2; Mon, 30 Jun 2025 19:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F60541A18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F60541A18;
	Mon, 30 Jun 2025 19:16:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC6891C9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D3FE83E75
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOD4zRTS3-G4 for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 19:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CF1183DF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CF1183DF3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CF1183DF3
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:16:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 22FCD6013B;
 Mon, 30 Jun 2025 21:16:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Jun 2025 21:16:27 +0200
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 21:16:27 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <aGJY1xO5eNpFV6Pr@yd-6wlzhs3>
References: <cover.1750845702.git.yann.morin@orange.com>
 <6250e91113bf6a48ab5035b038cad4db1931d57a.1750845702.git.yann.morin@orange.com>
 <1b61fab1a3d17e9cb757e12dc9958b51@free.fr> <aGJY1xO5eNpFV6Pr@yd-6wlzhs3>
User-Agent: Webmail Free/1.6.11
Message-ID: <096438a4c362a4deb4dbb2dfe9bce9e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751310988;
 bh=pQaCGn+jdRkyk3rsIauygkPrkbP/3iUGURzqMPQVuJI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bdM9dwGDD5STer9F/h2KbaKz7ntiQZewfoast6yB/XC7wz3FWjjObW4T0TM0Go0pV
 Fvjz1AYrEQMh/qzV0zJmWnw18kRrQlxsGEXQ+FNSWpGfaIB2CWYft2EaAG5ZrSa7oN
 ZTaW5z5JOuMOXFArq/M/yVDL06bMQYedZpg+IpViMfCabmurwrTYxC2nZwoy2XslAG
 NM33E7bc+77D5GDwV6WQW2Y33vAvyOEF7aMsvW4Uhtw+UD7biIHdxH6B42U4LsaNSf
 G5F1PHszXF0wLnNVyd+4ho4tL5JYpZR7QJZXuisEBKaCWAqdAJSlecu3ZUesz8YpTC
 zzJjlnRAZJpcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bdM9dwGD
Subject: Re: [Buildroot] [PATCH 1/2] boot/syslinux: fix install with
 top-level parallel build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 30/06/2025 11:28, yann.morin@orange.com wrote:
> Julien, All,
> 
> On 2025-06-29 12:16 +0200, Julien Olivain spake thusly:
>> On 25/06/2025 12:01, yann.morin@orange.com wrote:
>> > From: "Yann E. MORIN" <yann.morin@orange.com>
>> > We fix that by first installing into a temporary location, as part of
>> > the build step, and by then copying from there as part of the install
>> > step. This ensures that the boot files are easily available, without
>> > needing a dependency on the target install step, that we can't express.
> [--SNIP--]
>> Series applied to master, thanks.
>> For info, I fixed the commit title of patch #2 (by adding the
>> missing "l" to lpxelinux).
> 
> Woops, thanks! :-)
> 
>> Do you think it would be worth extending the syslinux test to cover
>> this new option?
>> I'm thinking about simply adding BR2_TARGET_SYSLINUX_LPXELINUX=y here:
>> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/support/testing/tests/boot/test_syslinux.py#L23
>> If yes, could you send a patch doing that please?
> 
> I pondered it, but that would only test whether lpxelinux builds on 
> not;
> checking that it does work would need a much more complex test. And the
> build test is (suposedly) covered by the autobuilders already.
> 
> If you think that is still important to add lpxelinux to the runtime
> test although it is not actually runtime-tested, then I'll cook up a
> patch...

Yes, I think I'd like to have it build-tested in test_syslinux.py.
It does not cost much to add it, and it won't cost much in test time.
This way, we'll make sure the option is tested at least weekly or when
a tag is made.

> Regards,
> Yann E. MORIN.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
