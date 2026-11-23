Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF24606A326
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rwz5riKw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FC8780EC6;
	Mon, 23 Nov 2026 21:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFZ1Xu3qCvQe; Mon, 23 Nov 2026 21:25:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5812C80E5D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795469107;
	b=Q9Du+60w8xvaSW4lMSpPEbRNdEFvppLM4V2mPISdxmICDEhPLO759QGCKFIEk/PjN8sT
	 Qi5tDlFtJ8YWp8K22G2UYq0bqUr49nF0osmt4xAPOAFoge7LHDBzIReZpl1CjursHAl58
	 ByBhJWSH3NgPhsNduwG7hx36shh3sVmAiJYk3wPE40B1MUz4Uf+0haONFnSY5iHP5PMxH
	 30ee8bYsW2XfIhV+QNfGdAEiIpfymGGoLe6j/lPZVscBg8iZVOBXXY4ADQWX3y2Xl2YYq
	 3lew06jqjYUQH5HwhjV0ww72+LHCN3WwPUrxu1sIZ05gJ+i1HjMZnyUb8S4wXG8RzbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795469107;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6wxsXtyp6YJWFUIb3+PWImsH4rDta0RJwUWncO2p93A=;
	b=WGKSnDcJ1mzcqEUQMsqnXQOtIx3qYMHnnNpdquel/DBZZoSs03qYRuj9YAWFmwgyhtSD
	 uMf+yKOlFogpVg+KsW/vBkT0kUD4VmHvbb2w+joSzPaCf3VkwV7XUpP7vhpjta1VrSHyv
	 YmlFztFETuh+FDRnOsyThIEAmdpEsBWGUsOo+6ISVtqdHEvHor6p9JFX6ldjT94vrlkMN
	 66qPfkFUpqmLFc4dbK7fIISqUR9X5/4jduZm19T40ZdJLowfjM0UPymlZOeWOARrZufC+
	 Xtg35ol4SpgUk61eudDR1DLFTYv7Sn7NURqQQHKyPjKjCmhleO3waburV4en8YAssDg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795469107;
	bh=6wxsXtyp6YJWFUIb3+PWImsH4rDta0RJwUWncO2p93A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rwz5riKwfsOtgVjtMUDuqhlJZYXfyAOM7mDxoquNAFcKHE70ZtZ7xAZFuH3Vn+RPh
	 FLJn/dJ6mTDpX7yBcYIna+gLntug1GxI+2AslHHvqsJYUpNkjQxCO3yRXHNY1QF/xP
	 elhVYkuJ8gRTMS4awZJfuVcrYi9xjRjLpaR1L/wbHG/sLL1Bl3IUlY4DPVZW3GZPp/
	 zOjr7qkX/qU0p+CkApBjM9tbPoeJXUK2t3uTaQfx152n/OvYUn/bqAMn7OQ+Rtppcg
	 L8B0eE5XqVqEtl2s3CY/4lJf8Fddkp9Alhm2AsSKLk21/2i9TTrenQIU/nMhTM1IhC
	 TRXSuDNTN8p0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5812C80E5D;
	Mon, 23 Nov 2026 21:25:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3617022B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BF3580E5D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWr8DhWcylTb for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:25:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 16C0F80DF9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16C0F80DF9
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:25:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2FF6CC4EFD7;
 Mon, 23 Nov 2026 21:25:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E8C5F604C0;
 Mon, 23 Nov 2026 21:25:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6B7A11E6AA68; Mon, 23 Nov 2026 22:24:55 +0100 (CET)
Date: Mon, 23 Nov 2026 22:24:55 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>, 
 "Luke D . Jones" <luke@ljones.dev>
Message-ID: <awSvHxs4FCjhdtFn@windsurf>
References: <20230315085103.1671888-2-luke@ljones.dev>
 <20261120215433.605054-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120215433.605054-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/sdl2: add PulseAudio support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 10:54:33PM +0100, Angelo Compagnucci wrote:
> From: "Luke D. Jones" <luke@ljones.dev>
> 
> Build the PulseAudio audio driver of SDL2 when pulseaudio is enabled,
> as done for ALSA, so that SDL2 applications can play sound through a
> PulseAudio server.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to next, thanks!

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
