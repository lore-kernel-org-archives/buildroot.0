Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572CFC54F52
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 19:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19569813C3;
	Tue, 28 Jul 2026 19:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjfFIR08T6uz; Tue, 28 Jul 2026 19:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB9481384
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785268019;
	bh=7/fDo6Gf3TF+9glvy/6WlemErHrq4BEZLo6XHyXH2Cc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nOV1ZMk0VcPkFPuKHBll2YsPqbFJlWnDuEdHbc7HvFQptC3/VMfHah5vsHaxO0Zxm
	 M39LZYBnRoXuFsUse5tuoj376cEFP8I4nVG59rfTp2zfxja15meCCABDnJZcZ2T/Ux
	 WxCElJSkGbrfRTzBOStvlylJgUrTZmCtoA7INFwJoLtSO4PMb7C9Zs+wv8WTAzPJtb
	 lgj7LCxDylrjahMP4OtJzfybcaPMFmk886sri6mdQ5Ojnc1XxttddfrVX6SmfFlGf2
	 uxS/ek+bxhjQ6V08N6mArN9YmJuTThpeENQaTRVrwWXw1QQrvaFbD6l051EpnTReoA
	 rfImjsE9jWtaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CB9481384;
	Tue, 28 Jul 2026 19:46:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99D75788
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9733B81384
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IeunVFctRPq for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 19:46:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEE7B8136B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEE7B8136B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEE7B8136B
 for <buildroot@busybox.net>; Tue, 28 Jul 2026 19:46:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0F30B2003D6;
 Tue, 28 Jul 2026 21:46:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Jul 2026 21:46:53 +0200
MIME-Version: 1.0
Date: Tue, 28 Jul 2026 21:46:53 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260727065108.409958-1-francois.perrad.86@gmail.com>
References: <20260727065108.409958-1-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <1d691f7d129a24a2f43e9f0865b8075b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785268015;
 bh=XOmWV7qWxAxTpuBUby9/e/sdpL24i4Vu52Yu7vdmVZc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LXU7eRYSYoAuETZUg1KmZekfUye0TWxoEN1gg/X6EHossq/2IVMqf3Uqx33DqlYEe
 LblkoZKQqglJ9GYkwtG4THrb3udzvh4N56RIFuIj3qPeeighKQnYvdd0WZQ0roKJBk
 aMsLOv4/PMma26niEIrhxSYGYUchzxmTGuFkwfSZ4ZSZ9xPTagwfhT1eXN/bSHey94
 bu/5kWCptIShErVGMxV/YK3eKMgTvHCWoNHklwoTwYj1snl7ruK11fJGU1AvCjhFx9
 lJ17YLOlFBxVX+w5CUjrx5qs02g3LBP33BpHvPv5a7PAK7X1TLzHHGFLNuaZOtHf1q
 JxUuM8Jw/2o1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LXU7eRYS
Subject: Re: [Buildroot] [PATCH] package/lua-lyaml: bump to version 6.2.9
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

On 27/07/2026 08:51, Francois Perrad wrote:
> diff LICENSE: update copyright years
>     -Copyright (C) 2013-2022 Gary V. Vaughan
>     +Copyright (C) 2013-2026 Gary V. Vaughan
> 
> for changelog, see:
> https://github.com/gvvaughan/lyaml/releases
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
