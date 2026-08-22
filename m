Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6FBC5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 09:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16A7E60708;
	Sat, 22 Aug 2026 09:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNTaTSnsctOD; Sat, 22 Aug 2026 09:24:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787390643;
	bh=fJ4N4A+IqgIFpQ2nNwli+X98OFgxQ9emGStTc1B+E0s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GsQJqFUGQHJlWk3eGYEJ6yMjIIGm7dFwT+OcE849LpHxKR/gk6g3FbRj7bJzSBu7k
	 F6WwXr8LxrajBHCpZFXmsKdlG31y0JlQu/YGsqSArgNkqyAJkKOzwPSAeP8W7lvYnY
	 /1u8O9pJmfZG6wG01T6uJd5Lg79+0xPdoh+e9Nj42bbGXIckpSWSKc4TqZpfa1swbc
	 1xFMOL1nMhHOJFdVjOP5ODgBQoIleQ/sLeCvOFR2Bly88WAauHPkhywjTQwcANRqYG
	 77+WRIpWo9gEuHPx4wZ/W6zuW9caPJKiZ+GQqVflw9PvIXhCJL5dbhWUGIgO4bXwn9
	 WEITLm+o/M7ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41C07606D4;
	Sat, 22 Aug 2026 09:24:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 678934C4
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 09:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64D1A409D3
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 09:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ztLmATk_Qat for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 09:24:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88650409C8
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 09:23:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CE0734E41324;
 Sat, 22 Aug 2026 09:23:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9DB51604C4;
 Sat, 22 Aug 2026 09:23:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DF94111C77962; 
 Sat, 22 Aug 2026 11:23:51 +0200 (CEST)
Date: Sat, 22 Aug 2026 11:23:51 +0200
To: Fengwei Tan <tfx2001@outlook.com>
Cc: buildroot@buildroot.org
Message-ID: <aolqYgE89zQA3YYz@windsurf>
References: <aodS3qtR9YJL5U63@windsurf>
 <SY8P300MB0041233A165784A8729859B2F8A32@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
 <aoizvh0-63Qk71KB@windsurf>
 <SY8P300MB0041DD7E48EB9FF02AB13414F8A22@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SY8P300MB0041DD7E48EB9FF02AB13414F8A22@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package: fix builds with
 $(PKG)_FLAT_STACKSIZE
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

Hello,

On Sat, Aug 22, 2026 at 05:14:39PM +0800, Fengwei Tan wrote:

> Since there is an ongoing discussion about removing noMMU support from
> the Linux kernel[1], I do not plan to upstream the HPMicro platform
> support there.

Meh, OK. I think this is not really the right move from the upstream
Linux kernel maintainers, but oh well.

> However, I will continue to submit any noMMU fixes to Buildroot whenever
> I find them.

If support for noMMU is dropped from upstream Linux, there is a fairly
high chance that we will follow along and at some point also drop
support for noMMU in Buildroot. It makes no sense to have support in
Buildroot if upstream Linux doesn't support noMMU.

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
