Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7736C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 15:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB4B580E57;
	Sun, 16 Aug 2026 15:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIjZhRt5XBGd; Sun, 16 Aug 2026 15:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6355E80D3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786892897;
	bh=dsnkD7tMoxnYVdwSjiETCw0ZyOsqUhfyUv3en3ABgpg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bonjaPrq8fPFTxbN3ShEQgGJGnwGSPo52RdB26jvtGpBUuBoDUYyvqwHA8v9/u6/s
	 ITc72I9V6SjJr8oNgcLgfrpsem8WKILlxcZJdftiJWxqwq7WnVvSVmTpEmcXI6HF7N
	 nKoWYYmddFC0bpiM4U8EVqJ/z7SKUWX5YL/Rp4YeYfA0jBQ+xXNNghmEJUvNMY/rO0
	 Odmg5j32jftcJ/nqVcSWpiPuTDbZ+8q/FkkUFPxEGSHZLNtlZ+PD9ViqDXLJhuonaC
	 Nl9R/1x3TDdhMP75OU8ruuCUjHIkZUMIttcgviRg+mgvuwGlVh2FBMXD6lsAnyE6XL
	 hi8gsSk2xJi0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6355E80D3F;
	Sun, 16 Aug 2026 15:08:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B646A337
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7F9A6060E
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZywJJkfosuQ for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 15:08:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9432960604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9432960604
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9432960604
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:08:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B78DD1A1696;
 Sun, 16 Aug 2026 15:08:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7607D60352;
 Sun, 16 Aug 2026 15:08:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BCA8E11C4F99C; 
 Sun, 16 Aug 2026 17:08:08 +0200 (CEST)
Date: Sun, 16 Aug 2026 17:08:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aoHSI9MWvRFbPAWO@windsurf>
References: <20260711110327.862832-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260711110327.862832-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-lib: force -O2 on i386
 with gcc >= 15.x
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

On Sat, Jul 11, 2026 at 01:03:27PM +0200, Bernd Kuhls wrote:
> Fixes build error on i386:
> pcm_dmix_i386.h: In function 'mix_areas_16':
> pcm_dmix_i386.h:52:9: error: 'asm' operand has impossible constraints
>  or there are not enough registers
>    52 |         __asm__ __volatile__ (
> 
> Fixes:
> https://autobuild.buildroot.net/results/fd9/fd9e6a6f9e2d37df3cfc1ed36707aef9a338f24d/
> 
> The oldest build error to be found dates back to Nov 2025:
> https://autobuild.buildroot.net/results/3b6/3b606e0c6160563e410535d38a0e7bb09041f223/
> so a backport to LTS branches should be considered.
> 
> The build error does not occur with gcc 14.4.0 and was reproduced with
> gcc 16.1.0.

I have no doubt that passing -O2 works around the issue, but is this
the right fix? Especially since it didn't happen with gcc 14.x, it
does seem like a regression, no?

Could you make a bug report to GCC? Note that they want the
preprocessed source code to be able to easily reproduce.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
