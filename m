Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649A1CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB246F5B3;
	Sat, 30 May 2026 15:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8EOOclVtrlN; Sat, 30 May 2026 15:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D5856F5AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780156378;
	bh=UKdtIfVLGDaVfmK+tpTaXuKbpUg5HhXlRZRqJ0BUxhs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b98LrWP8eaMwBZ2MzuyNFz0bd3F9IZJ815UTY7lV7LvHzYUFJfXAim9Woew339a6p
	 Uryi3hQJiFKTvCgE05avKR67+/xMRdxkTBr3tjqIT261y5WRcVJmyTDiKb+vv6QjOq
	 eNCDr6aQB5JyupSVfl9UJD0yzYYdpY6il9IDtabzswlKmyL7oDNpAcA8FR+T7PqhK1
	 Fi+YFlH72FOtUBBpmZNv/dhNP8FAeLy4C/A41WmsuQIuldxU3Mrv8YwNNyveOyvk3A
	 QTwbBae+0oR/2XLimHieK8jGKSpm2KvkxyAj/eJ82fwro3hy7W4RbEKQP/NuM+aFpY
	 wFHrMhuwR2TBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D5856F5AD;
	Sat, 30 May 2026 15:52:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A22B8D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87AD342D6B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrThkZV8OXWB for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:52:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A373142D62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A373142D62
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A373142D62
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:52:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 74B5DB97C5F9; Sat, 30 May 2026 17:52:51 +0200 (CEST)
Message-ID: <92e32912-9e2f-4117-94a6-4679e2d33f38@rnout.be>
Date: Sat, 30 May 2026 17:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-11-jeanmichel.hautbois@yoseli.org>
 <ahmYo01FFmj7ewrC@windsurf>
Content-Language: en-GB, fr-BE
In-Reply-To: <ahmYo01FFmj7ewrC@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780156373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=6igJdp6/FPkIr0yau+lQCmYMAkv2eA1OUGZPtYriwE8=;
 b=mI6KGRHGggr/tylHUKQ0/bjhnZQJsV2KPHlDdK/fSt8Du3fhYQCFuWFgyd91vYjJy3iQPU
 e9BfEUsaTyJWpIAG0LmkQzXMkmsxV2c4g3mxPNlvSMH4VlwkVUAiPU7oLSY+k+ANnsMwJ+
 aiU/H46z15KH7nMDzBzYyrpx9Hy6w8oti4VSPu5KM7uioBwJ3/weq+ZbL+ltwX3HBwsT0E
 dWndxoOcyFnTihKbBpDvWRYXXr5h8OD56JpLeGxYMqFJNe9uQyTPnmCr8jW53ioCNj+Uar
 oFZNcXlG4qRIoeGekMyXGIyS2Og6srQeafyMHLpQyiNxKh7wzBzAyKSukReKgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=mI6KGRHG
Subject: Re: [Buildroot] [PATCH 10/11] package/mawk: create awk symlink on
 install
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/05/2026 16:00, Thomas Petazzoni via buildroot wrote:
> Then, you also need to avoid the conflict between gawk and mawk. After
> discussing with other maintainers, it seems like our preference is to
> have mawk win over gawk, so you should add:
> 
> ifeq ($(BR2_PACKAGE_GAWK),y)
> MAWK_DEPENDENCIES += gawk
> endif
> 
> This way, we will be sure that gawk gets built before mawk, ensuring
> that mawk wins.

  When discussing this I forgot that it doesn't actually work like that. What we 
have to do is to build gawk _after_ mawk, and make sure that gawk doesn't 
install the awk -> gawk symlink if there is already an awk installed. That is 
what busybox does.

  It has to be that way because the final target dir is not populated in 
dependency order, but in alphabetical order. It happens to work because mawk 
comes later than gawk so it wins, but we shouldn't rely on that.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
