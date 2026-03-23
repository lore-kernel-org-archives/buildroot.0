Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38253F483E7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0266960844;
	Mon, 23 Mar 2026 19:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heIRgkdZ0FMj; Mon, 23 Mar 2026 19:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01E836078F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295423;
	bh=Twf47Q4mGA/SCdbSOV9FeuzgIDhJA6dsyfQ9W/cmbe8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YtSh5jkD27yLR5QaNOVVlDkv6oOXATQCyoxZIXxSj0NSNS+TUsdf9gZTOWQJ3+Xz1
	 XmJqyoP0WSccB2SXL7++IJkCXKWWIerlFGzT83JEgACDU3Im4jN8Vs0rxf/IFRKzAA
	 io3MD+01grcU5vasclxp4EEhhICrQJDL/4YwRgz8GgWacQvSxUw+qVOo+Ujh59BMrz
	 nmImphokOhZApPGhiJGgaex2OD6azixcsz4KAj0rF/XznykM0ils6AffkaNrCr6107
	 lIdrWKjWMG556hGadv9HaWn0KL3pUiWH/wlx/xOmV7V63/IS1Z64H8LCgZc4RczCep
	 uT186F3iFjbfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01E836078F;
	Mon, 23 Mar 2026 19:50:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B6C5353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60C744027F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXll1d4lx3gB for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:50:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D99B54007D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D99B54007D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D99B54007D
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:50:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 65A0620039E;
 Mon, 23 Mar 2026 20:50:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Mar 2026 20:50:15 +0100
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 20:50:15 +0100
To: Vincent Cruz <mooz@blockos.org>
Cc: buildroot <buildroot@buildroot.org>, Danomi Manchego
 <danomimanchego123@gmail.com>
In-Reply-To: <944599437.25075953.1774262079707.JavaMail.zimbra@blockos.org>
References: <20260323102609.711228-1-mooz@blockos.org>
 <944599437.25075953.1774262079707.JavaMail.zimbra@blockos.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <56e9059f2e25572923f1beae15b7b1d7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774295417;
 bh=pKjme3gZ3a71OPf1eBLexeKV6dHEkTBR/Z3ZgQlrnIA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mTtzeyAZ/YVr5jVgfS0JCuql62E2ulk+h+yhnGoG/9C9r6TIn2CTMThQrsvgY9l+c
 lgldspDR+sEpYwHfcOVww1NXqEjP7HwnlLaiu/RQ9oddo7qplxF6MHpVgd1j7Fs+7x
 6BsoBE2TZIlJmiYC9uRI9xuH3cYefYttOmXf6/jfShyKGj7N09/UHxvxv1mNarTGeY
 pPcAA6WZEVg2k0AP3bY5NYOVWhca5eHp4pzYhQA/MHc0LwdbZNXh9YUSYvouLMOYZp
 M03f9iTT37vp3bnYSUwe2c6lKQ9hYYeKh/ykZAK4HrvJxEe6twdeXCX6vRwxhLOskA
 ss1CKN3pQUIJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mTtzeyAZ
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: bump version to
 4.5.7
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

On 23/03/2026 11:34, Vincent Cruz wrote:
> Hi,
> 
> Sorry for the inconvenience, but I managed to send the patch without 
> the changelog link.
> Here it is...
> 
> Changelog:
> https://github.com/warmcat/libwebsockets/blob/v4.5.7/changelog

Applied to master, after adding this mention in the commit log.
Thanks.

> Best regards,
> Vincent

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
