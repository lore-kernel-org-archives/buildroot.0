Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFACCC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 743E0405A1;
	Wed, 16 Sep 2026 20:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SToL_aHCnbTo; Wed, 16 Sep 2026 20:43:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 946B5404F5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789591410;
	b=UHkVwbQKofUc7ch+HXHjZFAscxKRTOzSYG+vZO3eE5JNlVQ/Exsy9Y/BsgM+Ph6Jwe3T
	 ETh0nf5IayB80dVlZlnPXYpVlM/EAlk9ILnJzysUU7UHJteTIbDUoXNggrcgi30je7Kpd
	 S5VVpSMXaZ/6FsgNz1hmvm1LnlliAYgsu28QpygovU2WXIpA2bYQIr8VeI9bFZNA23cfZ
	 NXYM3dsKWthM0Uc4vUOhGg1+a0JAziq0h+Gnpn/+NrJPeC2AsASWmq20n5IRqmciwE28x
	 63QufmvO1dxLc5eX9eCzqwnJPD3LbUAJGI3Rv8P/6l5o7GflJjzVbS2CK8Qeqoepe/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789591410;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7tg9j/bYQZTOnupnAGWalVwBA14TtfWuyAToOivfjDo=;
	b=A3QkcqUAvQhOMrD8ChqnRRgczjRrF44xe7MKjdqlZEYjrfaIFiez3wT3oZ1V6tOJ4Xjj
	 jxDRo5Qio8VJGNHnWYlSqzxtpc+drny9RAmcM10lRFk2/l0Wd76KVqGJQ1dey42/GE5DU
	 vw1DM/LlkB60EiproJq7GwE8kn26TdMJqLXaCV10DHi9Wug5DbRlfUjqcZEzh72CGFFsA
	 yQS2ZBmrr27D7iER5LIFt9rAQJnZzEEBofalgvu1+aLFadkFC1DdX81VWqOiz8LDJQfaa
	 gY9ZwRHvjycgeLageUtMk2y52oZ9cVpP2+c7GEiklwAuVPhzAoW4OIctkjA+U3D/GAQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789591410;
	bh=7tg9j/bYQZTOnupnAGWalVwBA14TtfWuyAToOivfjDo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eYlMPF6k6xq5VWleMPYoRygJMO6LmUFGFOhVD1zgnuMQ0mvwtfmAF3v8OGArL2LFl
	 TqCWwqEjN/9FzM7E0JUtpeApWEezhoDSAV5st3tkg40b35F7DZvWmoNIgy0/95whYO
	 VTiDhsaZL3m1m/ocQynJbDh9LVQGPMHyjAXJ/Pt5nxx+malojiPZTRR82r2na1/op4
	 aEK++YENp6TZTcOfCCsgdcmJ/782sZW1qT0uXKpIhyVqlDkJgu/ya7/EOjM5VC5/6h
	 gEPnzJWhT1rFgNOr6nrlFr63dB0hwXwB5Liy7acoVCMfLLbwScDXD4Uvs2+81EgPOD
	 2UuPOueucPKhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946B5404F5;
	Wed, 16 Sep 2026 20:43:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8DFA13D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE8AF80E02
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQvZWauWvvgb for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:43:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EC18A80AAA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789591409;
 b=Spol0mLBJiXo6QOAJEM77n5XiwBbtu6aMRXcA8pAuaJp8S1rRm1fM4webi8EnQL1vYfk
 OVMmyEJpzxfCCFUJuolP4yXtteHWKmV8LKCPCS73q5iSj/GXg9Gx8OnLF9wVzhObzMPBk
 MY4USZvYM28RQrMobB7kmxSlUueiyMrsSgae9ZN01YWnv24tMjMBoODE0J5zKgGrCmjYa
 0BCgnC7ovhSDd87DvFMyfMXG8Qe01usOmGRvv4POcsckFNbd48GQ1JKXAWF4n/kjNVtMV
 zVMPGmrvOMF5zV4/pF+nkHxzhtZFH3xPxehkgzW5Y038C8rvacWaqNFChYJz7WRGtHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789591409;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=iEyfJQUZg50GT2hoslKFE4OsFBI2y/T4ISkSYS0CHcE=;
 b=TpyPONaz1C3oxGCmFcGFdYOqaK8G+RDNjPaOr74beMPRez94lKyCQvZl5KjL5XuyW8a+
 U7bnhM8Olqaj6Y3EUJAkBxCIL/TNetyunK9j6yxB95/Oa5pkQ51fOLVz3Rww8jyk1jd0T
 FjTtCS4wztGc4yvrtKLEU1brkhwEBh4nszhV0YTG9npkHmgVGQFpP6bkCVX3ok3eOHcz/
 zQU27XOIV0bNzkyvK6YN4eS7oGXktxX6LOD9Zbu70Im2MT0lAOI23fTXhD+bj2DUO+EUl
 LY//V6y6jrggD9MaTbfxQkuz8xSbCwcGLajMFLIGEGvGznCwfbbUKZnAiCDj1znJNcQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BZA4XDHO; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC18A80AAA
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:43:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 24B664E40754;
 Wed, 16 Sep 2026 20:43:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D137260337;
 Wed, 16 Sep 2026 20:43:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C1FB11C7B053; 
 Wed, 16 Sep 2026 22:43:20 +0200 (CEST)
Date: Wed, 16 Sep 2026 22:43:19 +0200
To: agennart <antoine.gennart@quimesis.be>
Cc: buildroot@buildroot.org
Message-ID: <aqr_LqE8v4cN8j-_@windsurf>
References: <20260916104739.853249-1-antoine.gennart@quimesis.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916104739.853249-1-antoine.gennart@quimesis.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/nxp-mwifiex: bump version to
 lf-6.18.20_2.0.0
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

Hello Antoine,

On Wed, Sep 16, 2026 at 12:47:37PM +0200, agennart wrote:
> The previous version fails to build with Linux 6.13 and newer because
> mlinux/moal_main.h includes the removed net/lib80211.h header.
> 
> The header was removed by Linux commit 02f220b52670 ("wifi:
> ipw2x00/lib80211: move remaining lib80211 into libipw").
> 
> The new NXP release skips this obsolete header for kernels newer
> than 6.12.12 and includes the corresponding Linux 6.13 cfg80211 API
> compatibility fixes.

Thanks a lot for your patch. Could you please resend with your
Signed-off-by line, and ideally with a From field fixed to use your
first name + last name?

Also, your patch was PATCH 1/2, but I didn't see any PATCH 2/2. Did
you intend to send a second patch?

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
