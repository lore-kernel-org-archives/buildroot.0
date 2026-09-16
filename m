Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8BBC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186954070B;
	Wed, 16 Sep 2026 19:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iitHTyVtEkKy; Wed, 16 Sep 2026 19:11:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F116C404F5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789585897;
	b=KVf4cuET7hFry5xiBlFgZysxerkVpKbZVju1ygfWe/JnwpXi1Iko9wWYKufxUnZr5zT1
	 VbFM/4XR/mjYESdgWLFrxTbyYDnRcHpDJkVTtfJmv+/KsMh9mHYyplWKqDY1zo0RZTUGs
	 EaJOjd+CbMLD88Nbuam52rsb9kO6YbdWdfWxJFLMA4Ovx8m0h+ZjQBSISOtIvpZHzgwP2
	 +vmd0xsUy6Bzg7DvMXcSm6INMtScp2uAV/uKnHiManCAkgc2Q5m9Wq5B9vXOyh6qjgKom
	 ZB8CU8GBNH0LHLDxUX+iFn+/wVzH0smFxys+ZngFs8KaUdpSDjmJoCa9YPu0PFhzpOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789585897;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SWu/4HGfYpWz1wpsqFbjurZR7tPNhFcgoIiFJ63LSRA=;
	b=dgEXOPWhVWrXVwYv5oHJeNY3F0MdFB3s8H63EI3y0ZHwxQSPaOFRzRHoKAGxb9ngDQrg
	 x2HIialihhf7LuttWELt9qrVB9OJHWkdZTdjxXephLH/5F1OMZueej7kIVNCJTWUudb38
	 zLsCih4DZXwJLXQIt253KgChVFtrmLRrwCdG2//HorZ82WTT8EmgevCPWAxk/ov+TKfgc
	 o/Bs05rS5j5UektfF2wtRrXrU10Lqh3KZT/tAuoBPZmK4X8HbOGWzH20p2JJRylZwDND5
	 RARf14bYUyMVAGDIQomKObxHvDvkpQYEY26joPLioY4btAzXiMv6LAV2Uiqol6bEZFQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789585897;
	bh=SWu/4HGfYpWz1wpsqFbjurZR7tPNhFcgoIiFJ63LSRA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kfvfdvuHK20Lx17fFiK+eCEb4U7N59bJSs8Kt646On2FSznmwpGMv5Of2muyomswX
	 DszyflPaWPrBI3Lz+/Mhq92uvKfHC7x5/14+8xhOFOqQ0suATi6XVuDwbAUVp3FjQh
	 nVzO7bdwbhJQx1OMGLZUwhcKFcG+fUo9crpBq7olYPcaPcK23MOo5cAoTArw1KZkpR
	 unsH8G5/ao0zfE0oYhPl47D2HlNGRWnGW28wW48m+RjB0FaxU522LLujEBOg6xvQPV
	 om452kdr8BPorqvDob+zZpQ3vF69gJv9wxw8mRhzifLe9c4ItVRw6TCeLDGjWItJBO
	 /FKBQkrCRF4fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F116C404F5;
	Wed, 16 Sep 2026 19:11:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BF9B422
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46D96400B8
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TUoANwPFHb0 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:11:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6F12B4006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789585894;
 b=G7YHJf2waU9ThCHO2UtF1kBm4ufwuSmUkGmbrytQbg9EacJmoO0gFNvL1wx/1G/YrT4n
 jjd9iuptjkIaq6bysFwDDsJ6WamyUS92tM3m5lGOt+dX+pfr8E8yhgmeXsEfW40E3KY45
 Ss3cXsIv+iZSCbR1sjQmz0hjNm6tSo4LfDj6x5UNLaal6ZsKfBXpmt6RbnsVZ/UBfanJk
 h4v2YwCvO2AAVfEmtQcsSPmja1suznF/ZCLoZZQR72MQspOxY9UadZ6PKHqxy6+iExUxn
 slzQaKI5kSawgkvDpG1NP4iOkgoFv8icX1kIpvsltfvpfIifsG50+Vb37KftNb9d09A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789585894;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ngeV9W6LsitvO757luodaZirnLtS/N86JbaBcJtisAE=;
 b=TeCgjk8nycv/vzvNCYL46hFFaSjezyO7oyH8Dwd1rE40xracIR7V1v6Zx54iA3zmakpb
 QFR2W2kASXJTp1Ip8ypE9tsa9nlJbFEz3Z2I30NpocYryoDSoIM1hjRaUG74QYtXADwKy
 XBdn6fb+U7H7NEwleCyDwcZlrA2ooWzHNyb2JExIVfMoW6r0slR3GIclYcAa1Y2IYN7qe
 lZevSyNKu00hBPw7jmvHaXtcf4W74blDrxZBL/UtEXMR9ljiWZ4u7RVLoKT5SjQefG7eX
 GnoZhdsbmPu40CdAomgVe/xNvKQdRZt6LPmYm7HvA3wGKaCs790eTb9lLV9njskv8Qg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EpIZlzbp; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F12B4006B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:11:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4ADD44E40757;
 Wed, 16 Sep 2026 19:11:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2291260337;
 Wed, 16 Sep 2026 19:11:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4499211C7B048; 
 Wed, 16 Sep 2026 21:11:27 +0200 (CEST)
Date: Wed, 16 Sep 2026 21:11:26 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>
Message-ID: <aqrpq30jh80sswHi@windsurf>
References: <20260909081345.3114385-1-bernd@kuhls.net>
 <20260909081345.3114385-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260909081345.3114385-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/4] package/lttng-tools: bump version to
 2.16.0
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

On Wed, Sep 09, 2026 at 10:13:43AM +0200, Bernd Kuhls wrote:
> diff --git a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
> index 4bc9239c3d..bdf621b4ec 100644
> --- a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
> +++ b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
> @@ -5,8 +5,9 @@ Subject: [PATCH] configure.ac: add --disable-tests
>  
>  Allow the user to explicitly disable tests
>  
> +Upstream: https://github.com/lttng/lttng-tools/pull/162 (rejected)

Considering upstream's feedback on this patch, I believe we should:

1. Drop our patch

2. Disable lttng-tools on architectures that don't build

This would follow upstream's guidance on this matter.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
