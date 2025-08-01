Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90983C87FCA
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 12:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2383461BB7;
	Fri,  1 Aug 2025 12:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKp9SwPwNjMB; Fri,  1 Aug 2025 12:30:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 527F060A44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 527F060A44;
	Fri,  1 Aug 2025 12:30:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20168C8
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 12:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06322412AE
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 12:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAhnqrftgH_R for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 12:30:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0C8241285
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0C8241285
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0C8241285
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 12:30:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8B137B00593;
 Fri,  1 Aug 2025 14:30:22 +0200 (CEST)
Received: from [192.214.236.6:57460] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 01 Aug 2025 14:30:22 +0200
MIME-Version: 1.0
Date: Fri, 01 Aug 2025 14:30:22 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
In-Reply-To: <20250801094612.2c64fd28@windsurf>
References: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
 <20250730223753.2f400524@windsurf>
 <d2ee394a-1efe-492b-b89b-c81c4d1f92f5@app.fastmail.com>
 <20250801094612.2c64fd28@windsurf>
User-Agent: Webmail Free/1.6.11
Message-ID: <35038542df823aa9ab7b0c937fc69e1e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754051424;
 bh=AxosIuWuWxFEoWyNa21VIgPUURApFsTHR7F1fQQAZQo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nmt7gepRvsv+/5JjlFjGtRu5F8Y1hTZKSMHTY/qDI0P2h+kZy0jFfYO94mmrqbN7s
 PWm3NosXVVjfEQjLXBwp1M/iuSqv0Fldf6HReLOnQ2BvtaIF16JNEznRNOzj56hbHU
 sLo2Ps/R3fzWCBijnsuwkZc5TQT2pim+2D94pvlDi1U6sCbqlgoBkydxL9Jzi5bSPm
 KBLqWDyoSJX8ICYqh8UcUGSATiKYb7Mg3KYsIwXQBpgBMGcMig4CCE+i3yFgl+xI21
 BlkqlaMkH+xj11q274jsYn7Xe5OGMGM/646uns5CXi4+rNZPZlCg4f6FyhzwMithUX
 PlxBbM4h+fCgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nmt7gepR
Subject: Re: [Buildroot] [PATCH v2 0/3] arch/loongarch: Fix a couple of
 toolchain options
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

Hi Thomas, Jiaxun,

On 01/08/2025 09:46, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Fri, 01 Aug 2025 12:13:48 +0800
> "Jiaxun Yang" <jiaxun.yang@flygoat.com> wrote:
> 
>> Sure, sorry those emails slipped across my email filter.
>> 
>> I'm actually looking into fix LP64S and LP64D ABI in GCC and other
>> libraries but trapped by various failures. If I'm unable to get them
>> fixed we may need to drop them in Buildroot.
> 
> Thanks for your feedback. If there are known broken features causing
> those failures, I would prefer that we remove/disable them now, and
> re-enable them later once they are fixed. There are currently way too
> many failures on loongarch64.

I agree we should disable the lp64f and lp64s ABIs, which I believe
are a major source of those failures.

For that reason, I reworked and proposed the Jiaxun's patch doing so:
https://patchwork.ozlabs.org/project/buildroot/patch/20250731134401.30301-1-ju.o@free.fr/

Jiaxun, could you please review and test it?

> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
