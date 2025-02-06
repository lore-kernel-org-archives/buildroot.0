Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F10C02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 22:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4AE982217;
	Thu,  6 Feb 2025 22:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPjRIh00Y_zp; Thu,  6 Feb 2025 22:21:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE9E68348C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE9E68348C;
	Thu,  6 Feb 2025 22:21:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 529E5C5
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 22:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6152B40526
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 22:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Fb4ZFR7Eweo for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 22:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B23F408A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B23F408A8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B23F408A8
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 22:21:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.123.5]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIdif-1taKhF11LZ-004WOo; Thu, 06
 Feb 2025 23:21:00 +0100
Message-ID: <5818ad77-5f99-40ef-bd55-3997f8537b4e@gmx.de>
Date: Thu, 6 Feb 2025 23:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dave Peckham <dave.peckham@gmail.com>, buildroot@buildroot.org
References: <CAHWkT_D+bdHGBOwG_Go_=oBeG6jfEDyZuePger5QsjNGzBUtRA@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CAHWkT_D+bdHGBOwG_Go_=oBeG6jfEDyZuePger5QsjNGzBUtRA@mail.gmail.com>
X-Provags-ID: V03:K1:Jxh4Ht1uT0X4FDy3qPSV+MXT0zufpzU5Psx9elWZh8IpCNnr14B
 LA5cd1bWRfyrxYJG5OuV48Nykd4KqyKcXq9yzvH1Y5H2snyNzdNPQsmFCYSOv2KKPZxMXY1
 RSxpTDk7jqQnEoIdRh4rd/B5CpPMxTQHI5vQNmxVDTnz+LfmsY9yVfgwSP9/xlVX0GvJHVA
 lSpLR+ZtreY5NJsJRzlMg==
UI-OutboundReport: notjunk:1;M01:P0:Hg16tih07sw=;sKBKe3mn8eesUiPooh75SE24fAU
 l+LF4OXZHeZa1CywEkHPrBUF8VMR0NjIqW9ysLMUkupIf3cizfS0724Fa3hyZPajtLwo0yuFg
 YDh83C86/YuUQVU+AsQNrVthEWuNH/5GExQm37nCLQZY4APCuTjf9wENZ0Byqq3W7ix4zbj+j
 +CruoyW17oAIf53GgjJwW65mZIHG/vffcuiyCBp81nnPz9a2Kq/d5wWCeEvKVH+IHnpcDxz3i
 FMoi1NIphLaliMAj40RhxZedsLmfJQODnWmMdguQFfy2lrP+yAsqG8kM/m+YOuoVpP63EbFD3
 VbQjNrW39E7gxA1YDBYolK8Cteh5h4TG2QmD+JZ5aFSGGKX6Ab29kHnsl4ZxWvvHakptHAQ9N
 SJoGze7A3XOqc9H+t+OWM9d2jNBPT9bswc85zquVjEFncuNAFF7+0ItB6ngIL0hc1wmItyyQv
 k3DSfNqiX7AMTKNaTwD4IyBwFzL0J6zA6DZZCq2g90MmbEh640C48dBanda596QiE0UJ37Aye
 m1PqS27pOwpOHf4XPZG/rxSttLD62LXd1gkUO3K/Pen/TtiC6tGcetp/wtxlAjYeQVnfHPpYW
 XWDJbzwHXIARRR4p55KtReoe1DXlV9HNoALKAe+q+0eudnL27h+tT0NjspdirboveNfeCahtb
 G4iY8xGry4v8dCJsGg7VfKrXfoQYL1R6GA0b8f45/qnl6T9Y/blstlPP/mHZfx0U8lELo8hL9
 X6aZO3C93C7XhVk3TSxwCciY8HIYNeUhf0wFa2dHSUU+t0We4XEIPmZA+2e7dtksBWX1J3PmO
 tx+cXeQ59AZ4Khb+LqN5yrXCu8Ea8RNEsjLYFyWk+YXpIXBCQPMXqniEU4+/9wves6Afhdsvs
 lh+AdfU2q97PQ4YfodTdlUOqLCLKi6dC+l1wcXBNl0Vcb2V+SBUyHwMLysWA7lI7hiUl4iLy2
 WeZHjDh27zw39zlwVcKAX5cMrrDze8ueh4n7yZrczwRd9LtjYG8bGX2uMeqzBOSyDvA9UVOk8
 QON8XaGhbPegRrScwA2+vCCH9437VxO9oP77w+hlcgNbLPaA3IlinGJO6n/WKP2P6OejtSc5O
 MKv8wthJjHheUuBQr0n8hVxs9bh/UY3TYvyjRsRBpMFhYBBa/i9U1VsMNvb+4JITZsiOqkTsL
 HCH7aw+P1WtlPuG4P5EF3Y3Bxo7GrAQGQ4VHxDBTMKCVtAk79Sw3N1fg1InFmw8ncBJSXV+lk
 fhy0qi/k7wX4I0R/OJJc+PuhXi7QWtURMHZ06s3WnBTDzt4I090cDA67vvBA3R2qv0YnvAaA4
 CNpKrFtDUa7LAheDtnbPx202ZmL5KeiMctrHTWvJKSMYnu4YQsga6r2fTcEq1vlnK7DBKfNDB
 UMHlyNJRbAOjyurQW/UnnCca7PHUFhlQQrG5iBe8t9QrOW2kxB35EF5PtKa5bfNNaIyicpK71
 VbjckLMn2SZZC7IjjxPgiwhXwMoDYse3upDxxJaCoSnw8DCKM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738880460; x=1739485260; i=fiona.klute@gmx.de;
 bh=Nl18UtF11dyPBPQT9DDKUi51c2LjM/4c3GVidsPAWD4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MsgfapEfE1K3hyxDVwaOBHIGn+gKbV1+c08GRk1jcbMd11zZ3lOX9cQhROrI6mG5
 bwH7gNoCr6y/k65IC6S1o+RZZjr/akmWxoce/Q3bVzyfeoYodlqAASfXLK5//xhzK
 NCFOyBfrFMrGVyYcz/H6RX3FQZRiMJXB5I/ZbDdLe+lHoFuqg+mdF5xNVCT7xbn6U
 dYM89BVMi4k3tMlDKpBVFjONwvW3RtQu9UAwdQzkLDPXJFAe3B22nvPETPDGGtjWU
 w8QrEqcaDoTUkqm3/7QaEC00NUMEVljP3Op3WmIU8J+TpmwIN3HJ7fPfHLk0H4Ooc
 U4XytaS9Q+38c+RRdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MsgfapEf
Subject: Re: [Buildroot] github broken?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dave!

Am 06.02.25 um 22:56 schrieb Dave Peckham:
> Hi,
>
> I found mail discussions up to 10 years old that this has been an
> ongoing issue. I am using buildroot-2024.02.10 and getting the
> following error from my .mk file.
>
> Current API docs suggest a different URL for the archive.
>
> https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#download-a-repository-archive-tar
>
> Am I doing something incorrectly? Or does this need to be fixed again?
> Should I submit a PR with a fix? Their API does let me get a tarball
> of this particular repo.
>
> I noticed second attempts to connect to sources.buildroot.net. Am I
> meant to submit packages to be hosted on that archive?
>
> BR
> Dave
>
> ********
> GO_SDL2_VERSION = 0.3.0
> GO_SDL2_SITE = $(call github,veandco,go-sdl2,$(FOO_VERSION))
Two problems:

a) There is no "0.3.0" tag in the repository, "v0.3.0" exists:
https://github.com/veandco/go-sdl2/releases/tag/v0.3.0
The last parameter in the "github" call must be the tag or commit.

b) FOO_VERSION is not defined (that's where the "//" comes from), you
need to use GO_SDL2_VERSION.

Try:
GO_SDL2_SITE = $(call github,veandco,go-sdl2,v$(GO_SDL2_VERSION))

That said, there are a *lot* of newer tags, the latest non-beta seems to
be v0.4.40 from last May. I'm not familiar with the package, but
packaging a current version might make sense. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
