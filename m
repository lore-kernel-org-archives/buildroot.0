Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A96CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 702AA80E45;
	Fri, 29 May 2026 16:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVK3NfunMD3w; Fri, 29 May 2026 16:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A19B8838B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780072421;
	bh=1CWfsEcwPk89osy0MLd2zLZ4lw7mUsnxFWVazxCFyjU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=exCtkGkrah6nzL0tkTJgdM/s4jnT1bqRyWGv/b8CRFMicmOaK8Q6aSs9DM8sywhbE
	 f27tO6+6OtUBj6wiu0WghjIV8Qts2QHmKq/ey5Dz839Eb5F76ffrMUCr5Rbkw4x+Pe
	 ydRHF+X2CTr0gybGbWYCUz8+zGN/7J3vrgqqQ3Ft3QweYAhaqWHA05uKzjO+huDepW
	 RJdLxQdes4FuL3A/M8LePS8WjCzBES9fiq7HnAhGo1/8ie1NGynUt9MgOX50c9aeYz
	 jrM90kqtrTo4ieIXPaCjT1PdGtAAQJ6IfOOdPSjLdXbJDNxUJwdUIEUiofb8yCrSQj
	 QQnKXSJAuUdaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A19B8838B6;
	Fri, 29 May 2026 16:33:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDB3B288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D479A838B6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_EkHs_z7iDO for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:33:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CED7C80E45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CED7C80E45
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CED7C80E45
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:33:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 735281A373A;
 Fri, 29 May 2026 16:33:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 47F43601FA;
 Fri, 29 May 2026 16:33:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 697FF10888CBC; 
 Fri, 29 May 2026 18:33:35 +0200 (CEST)
Date: Fri, 29 May 2026 18:33:34 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <ahm_S6o3d_4dm6iQ@windsurf>
References: <20260514093731.1726256-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260514093731.1726256-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780072415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=6m/4NLhSphs8yuGVC/ZyhACH8ZRyskQN+HHBbZIw5dA=;
 b=bMaeOHl0GLMeWfNlp1202MUFnXdq3UJHzM9Iup5JEXno+TpUWsr42Chy+MZsojENWqU+On
 ZiwjeLIYFTXwCCTnw+T1enSXZz6mtSischSUhLtDLtth0CWQ6FZECumA6UmGrIRNB3hs/A
 VgA6J2pxjblff1EkFBJKyV7+pPEDO9BvXVNGzfg1A4mKiONBmJmZY3CGSGXo+I3fmIKbgq
 3SFQ0BuJ797H2sd/upNVrpQht+SF8TWiY2dyM/ByfsTRTeDZ1Ai4MzdqqDYxYStrU99xYU
 LTigYo8KfiRVsRDGADNEPdRSSCrf6yrPZ2oSBVE1YHcMTl5LxMg+zpNZeR5Rtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bMaeOHl0
Subject: Re: [Buildroot] [PATCH 1/1] package/babeld: fix linking error with
 musl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Thu, May 14, 2026 at 11:37:31AM +0200, Dario Binacchi wrote:
> Building with musl on some architectures (e.g. loongarch64) fails with:
>   ld: read-only segment has dynamic relocations
> 
> This happens because the default '-ztext' linker flag conflicts with
> musl's dynamic relocations. Fix it by filtering out '-ztext' from
> TARGET_LDFLAGS when using a musl toolchain.
> 
> Fixes:
> https://autobuild.buildroot.org/results/c75643713fd5f27fe063c226630680d26a8b9487/
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I think this patch is missing the whole point of passing -ztext in the
first place.

The musl dynamic loader doesn't support textrel relocations: when a
program uses such relocations, it will segfault at runtime.

To detect these situations at *build* time instead of runtime, we have
added -ztext that tells gcc to error out if textrels are used. So the
fact that babeld fails to build seems to indicate that it uses
textrels, which makes babeld incompatible with musl.

So your patch is totally papering over the problem, and basically
turning a problem noticed at build time thanks to -ztext to be again a
problem at runtime.

Did you actually try babeld on musl after your patch?

I believe the right course of action is to disable babeld on musl
configurations, because it uses textrels.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
