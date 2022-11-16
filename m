Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C5EC4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 12:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9642160B48;
	Wed, 16 Nov 2022 12:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9642160B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YAevEs7oEja0; Wed, 16 Nov 2022 12:57:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3498360B73;
	Wed, 16 Nov 2022 12:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3498360B73
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E22E61BF232
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 12:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCD9B60B73
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 12:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD9B60B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9M1Ker0OXd59 for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 12:57:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98A0260B48
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98A0260B48
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 12:57:37 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id b62so16607034pgc.0
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 04:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ifbk5V8+5zkaCvC85BwbWyUmeInRsbmcTE0rl1bD8Gg=;
 b=7X8sMzJOlAjijiZ78VEJHk/Db361RstM6nWNJryJCZ8LHJLt9LJIUOdx0xx2zMuvO9
 0Fvk69yJdXUZtiUMKQiNLEiFeHG/1jUmOBn84uIj8d9QIoqv/9d5EanUe9MK359oVc10
 ZPtyq9Y9KK5fKJRxRFLef2fnsqLXG27V9j9L4W7xD170XalyqF/bC8uzXYygs923ctCz
 UbdTObt2A161Vu4k/Dl0a07PaOz+lj0+obkkIFx67VdKdkOddRCdMeIStBmB6ldk/GaA
 xAVtVD4XMG5Y3iAPqa8/IVT41LjJQn9S+crDWe3slkIkUuffy5adQWrVXRvXP7H5esqJ
 eMVQ==
X-Gm-Message-State: ANoB5pn01ae25N1lwVNsbI52bzMgUWMtnfZbdh3l0Bo1jnrUj+I8xYZ9
 dk0WBAgSQeyWwWF3gGi1NqI0o3UkeBR3ELs/1+KszQFJ
X-Google-Smtp-Source: AA0mqf7NgVEo5WSqUCjttuc5KEq9mkNcjbYI43xqpI0YzcStKZuxVvyS9l0HLb213wGGxWZjeV/7j3OQXlQWRR3zmH4=
X-Received: by 2002:a63:1e05:0:b0:434:911a:301 with SMTP id
 e5-20020a631e05000000b00434911a0301mr20991940pge.50.1668603456855; Wed, 16
 Nov 2022 04:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20220918122239.189147-1-arnout@mind.be>
In-Reply-To: <20220918122239.189147-1-arnout@mind.be>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Nov 2022 09:57:20 -0300
Message-ID: <CAOMZO5CqhKB5nAeZW6jg888SPu7T3PbbqtmaOaAwmHgaAkPSLw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ifbk5V8+5zkaCvC85BwbWyUmeInRsbmcTE0rl1bD8Gg=;
 b=gGHSb0qxGil3E3+R51T5irddhFcvE7MyQSFRgEOwZt+zmKTu3u4NJFMvn1g3b56YQL
 b9PxEkoDYKsP4lP+W98cDwEaCLEO1uo8CdwEtnzpa0pZxFmAtbo3KhlNpAIGKbiZXTeQ
 FLAMU8wT6IKUWzlrAs3qjGfitagnRniMCCwVzty/TeQuhYqOzFCvCfnko12FE7Rh7LVE
 9MWrqO8dQx3IIAUKhKC2g7weFPgoLehT3Bo4VviSlXD4FA8ELRvqLVCmFI113DRQUZgI
 oFA5o6mIiAySVk+JXHdrUtECb15+2ulzhqtajM7BtdMnqs8UaQGzLKdmLtg8TQI79h2F
 DhUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gGHSb0qx
Subject: Re: [Buildroot] [PATCH] package/pkg-golang.mk: add osusergo and
 netgo tags in static builds
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

Hi Arnout,

On Sun, Sep 18, 2022 at 9:23 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
> CGO (the Go language C bindings) normally links dynamically with the C
> libraries. It seems that passing -extldflags=-static is not sufficient
> to make sure they link statically. As a result, a build using CGO will
> fail with
>
> runtime.gcdata: missing Go type information for global symbol .dynsym: size 72
>
> There are two modules in the standard Go library that can use CGO:
> os/user and net. Both of these have pure Go versions, however, which can
> be selected with the osusergo and netgo tags. Since these two are
> standard library modules that get used in almost all Go programs, pass
> those flags in the common infrastructure.
>
> It's not entirely clear if this is always the case or only depending on
> the specific way CGO is used. In the former case, we could instead
> disable CGO globally if static libs are enabled. However, it turns out
> that this doesn't solve the problem completely anyway (delve still fails
> to link, with different errors). Also, it is possible that other cgo
> modules do still work. Therefore, just stick to adding the osusergo and
> netgo tags.
>
> Fixes:
>  - crucible:
>    http://autobuild.buildroot.net/results/c2f/c2f29f55b461899e8e15c0494578304e6f74bf51/

I am still getting reports about crucible failure.

Do you plan to apply this patch?

Thanks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
