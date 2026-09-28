Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69CEC9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 13:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E2FE80D4A;
	Mon, 28 Sep 2026 13:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tg0xhztMI6oc; Mon, 28 Sep 2026 13:03:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7221980D35
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790600608;
	b=aqJqNUd2++XDJTEUQiZrfMwvuu7IOD4KFJtInYA2Lzpc/hbatL8u2YXwyBCUC3cOgcNz
	 FjDF4Yp7sDenWjvLJWHTEOfzi4QQChPqszMSW1h9M/SC6PglPDH1/9VJj+dsUz8UpZDUO
	 bGpHzyaa6Y/Bujb1oOhkhf83oxcbz/vhjaig/R7AakdAd3b7J+PecOFlspIR43wxIrpJB
	 ptN46VhlPZ86gddX/KeqJHodd7Jty2uffDI3+PRz8Xfp/3+3xooDI+NOdTLcFE5/OPQ2a
	 WNDLwWZQ80XzfKd79D/kgd/afGh2AAdwd20NkXswE9WtBXvAPS/YtiXO3CUL9U4IHIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790600608;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sjIdw8+vh537VkW0I/Xp+tgHljdCBdB0/cZEzIawB1M=;
	b=dfI8D3pE4iLYE2kD9wwptJ5QIv0cIj3q62rv/IN3Ij6rpyi3aIYf+yh/a4LgooI9t4PB
	 +ZAYAlx8HbDna2ikEsutvniNJtP0N8dxOF3lE8YiAKEGzxDXLw9Oqlmsrm0rkFV42q4/A
	 c01wLTZEWA8aBdG01PnDBtkhSCMAt3UBPotITGLkKoF4k5ehTbAoBTJpciEUROVwd2s8f
	 NwlGUm9YOlRjFOzshb1gSuj1lRQ3x4kDDO1dhz4T6wEgIWZX6WBE8UMX5M/+tpao/0Qj0
	 2zxlCH5kJ8peuMs6bLT3I3hp78bh+8B/E80TRGwS+jsxv9AUmxJmYqtkWABwQYGGVcg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790600608;
	bh=sjIdw8+vh537VkW0I/Xp+tgHljdCBdB0/cZEzIawB1M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hG9K26tkef/9UJ7TcHDhfYaRo6Md0IyzYycdG6gLLEORtZQ2/HPpctkXzEqR43N15
	 zUDZEigd7CwDhleiFIOdQquafwUD7Q6MCpZIMI6NT5W4EqaHrgNuavxrlnH6040UeQ
	 x5WflgxQxtXviFXcdhqD5OG6Tyu4WvgZojFn0jPHP5IIOBuaCDXpvO8DC4tcCuL/gW
	 gXLLAaHQb28x4mvEgItPdBQUxzRQ8K3nrZhUBObxfKDDXpM7J1ajOhrKP/oCBbdd1v
	 a/LRol1puNYGOHterHAAwuIqMYfpuIyuDE7fdrw5mrUpNDcdOyH3RujlIO8/jjrPmS
	 L4gdIpvSb/w+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7221980D35;
	Mon, 28 Sep 2026 13:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BAC372
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 13:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01D4E401B9
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 13:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqeaGtXunqMi for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 13:03:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8970F401E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790600605;
 b=XGNlYDBuRco9h4KZ8N+rdHSgIZjDceP+J5bJfMpEWtXzeMeTysGjGBc53oTVX9hvs4tu
 FPnaqiIzi03N1Aik062ll3o3h9pW4c4xaNnwIe4gOO9bQGB/cNSiPHXvq5nuxNKAikc7n
 X3Dl1cq7TnX0hEa/wHwCvAG6ceI7jGc57D3olSNoJwIfCEe1Rziwhz7cYwrDztq0dq1lq
 NdgXkTePzGpwdyubIx2o/X4alq31J+r5hWUTU7308ZqVkfuRPf+vPwd7/Q+nFB1wLEPOM
 avqn42BvEMcSvAsKlarca9amukcnfCczz56fIZj8y6XFukPOUzb2ufWuhby3qgIuGrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790600605;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=bLRHp4QyGaIpb+iSQ46mfnn6ahJKSFjCQlrESgdTCnY=;
 b=aSD2aFPcWfuKtHtAgnb5nk9hX+EyqMYJat6aWPvsxLMMMxJIwTkJF63Qv8yzLcAho65v
 BqQZfnrQ61cy5Zn11lLTKPpIy7KbBNtbb7gV7kaa26mkLTVOEGYmXem7lOwsTa5kMCfFB
 +RnW1NrIwV6HjKuD46AiRu7xheUou8ToLRi21Yt4E0XTsgoc8HMDedODhHjbbGvHmDtOh
 DCdDk9er0wGmr3IRTIyxaq803tIB31Y54DXQLxDcjPAOiMS8Y4gYLwcxUAIatL5rQ7bZB
 yo7T97Bgor4BZs0OzepM/07lrf5UE6QkrorjRqZTcXec0xrnonwDkgmOb6s2lIUYQwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=P3GARQR8; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8970F401E9
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 13:03:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3FB1F1A103D;
 Mon, 28 Sep 2026 13:03:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 03E3B601BD;
 Mon, 28 Sep 2026 13:03:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B277F10329445; 
 Mon, 28 Sep 2026 15:03:08 +0200 (CEST)
Date: Mon, 28 Sep 2026 15:03:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcin Bis <marcin@bis.org.pl>, 
 Robert Rose <robertroyrose@gmail.com>, Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>, 
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>, 
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>, 
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, 
 Sen Hastings <sen@hastings.org>, Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <arplhb2WEb6bWgm7@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-47-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-47-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 46/82] package/grpc: Fix build with
 OpenSSL 4.0.0
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

On Sun, Sep 27, 2026 at 12:42:24PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
