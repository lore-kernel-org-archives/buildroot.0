Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4031EC982C3
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1420C41AB9;
	Fri, 16 Jan 2026 21:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgm7cwWeftB6; Fri, 16 Jan 2026 21:03:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6644441AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597435;
	bh=KxZbppG5mGMhxuzFtakX/JwUfUGUwT236evpDd5Fuws=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AuyhzdiWZTAbFIY5tGehqF7+uy+3MMnvPYCfaj4+d7OoDgKtOpWIRL/ihQXvP93yW
	 vAHNH9OyxTszzSGMqH2SKHAIIJlKLk0MH8lgsisEbSS+DlTS2ir93RsNYbS7jQwbrJ
	 IEZ2KGL9maJitjtcBxSd482Rqtu/I5bs2kulvg1WMNdM7ULNj1eIjXQblZ13eYFqlW
	 lRefW5MYCRZjio1aAg2kfzkrj+PdH6bPu2Uq4wSOa6bJ4Vn6gl8BEktBitcvWW96W4
	 ZSimSK+SHbs+XuNWYUYKysAs8y0EM/I0aYZbqP8md+MUap3Tv5wd9ZTv5DnZ/Jz/vQ
	 34gcHRz/MpA2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6644441AB1;
	Fri, 16 Jan 2026 21:03:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A91E223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0736361234
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2cUo1tn_Cbw for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D692661233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D692661233
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D692661233
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:03:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4041A1A28C8;
 Fri, 16 Jan 2026 21:03:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 09E9B606F9;
 Fri, 16 Jan 2026 21:03:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3B9B810B68E3C; Fri, 16 Jan 2026 22:03:50 +0100 (CET)
Date: Fri, 16 Jan 2026 22:03:49 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Message-ID: <aWqnqhOUW_Ai7B7L@windsurf>
References: <20260116123039.879487-2-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260116123039.879487-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768597430; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=1wKvcgUe61GCEQoritUNlkqJteHslPFiQrlpV2F5vJQ=;
 b=xjLRbDQKH/laW/v7Ec5OlfP1/hBJoTbUsjYocdOTBS35PRPMcpROW3KShFxdHHfar4u4tc
 2cjeu7RhEN4CIFFrqaLiE3sg94Z+856t2jy4kzNpiW4nlhYun6E4syODEGjR6clmEI7MvF
 tF/EeY+u8IMgDMjidxUKK/u1gmNlX9onSywbCLz3QYFR7ZTD9O66avPDA1A0WC8YoG1dbd
 o/8EYybTvhW4MldhVpJXWtwklyiLPbvOoLh2mM1V94OAOVhjXVSElZsOicXuLGZFfZ+Bxo
 WD+4qtkWAL+oMUK08o/xWtCejOZYDcAbRGRGh9oNMdWAU9eBBKnn4hLrMcHheg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=xjLRbDQK
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update packages for Michael
 Nosthoff
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

On Fri, Jan 16, 2026 at 01:30:25PM +0100, Michael Nosthoff via buildroot wrote:
> - i don't use grpc anymore and updates seem complicate to review,
>   so drop me from it and its dependency re2
> - add packages i'm currently using
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Thanks, applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
