Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573E1C61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 22:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2704A80E46;
	Sat, 29 Aug 2026 22:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIfEyvEox7vS; Sat, 29 Aug 2026 22:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788042273;
	bh=WUBs+e8VM50kgKfH/Tm04EXcCsO5PzIBrBiO+47Xyao=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ob+3NCdQ9wSVwJ+LVV3P32l/yNtgl/Ig281TLUl0ACACkKexvxgT3NeSzWEK8RMwa
	 WOU+AYhwN7/Xe8A++fv36csSSUfssBF4XiSMKUi+QQLjnCTkT8TU1BrIphMsfiuamt
	 aiFiM3ZrTwa5Nx+E2PzpiX7SXOqcoqHIRvk2Zjzif/DwlKRNPCsfFCRcpZz7IggFPc
	 m00bGARORJ0PmzC9Y0jVZ933razVOwWeNNzt+AMfvZ6kMNqAugOZ6f5BTHlSsJcKV0
	 wGhJWlrEUt2PJR0n7GDA2CyHa/048BOrUlgVi00nManEAnFzJ1/zNLuEgMj01SbcaW
	 n23MNpf0fpfmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56AA780DDC;
	Sat, 29 Aug 2026 22:24:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3F3E2FD
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9E40406E7
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aex2kDH4MVM1 for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 22:24:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEA1F406C0
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:24:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8A50C4E41429;
 Sat, 29 Aug 2026 22:24:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3DB416053C;
 Sat, 29 Aug 2026 22:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9B2DB11C78365; 
 Sun, 30 Aug 2026 00:24:21 +0200 (CEST)
Date: Sun, 30 Aug 2026 00:24:20 +0200
To: Mattia Narducci <mattianarducci1@gmail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <apNbdgIRuxlTeWB3@windsurf>
References: <20260816195616.279864-1-mattianarducci1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260816195616.279864-1-mattianarducci1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/4] package/gensio: bump version to 3.0.4
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

Hello Mattia,

On Sun, Aug 16, 2026 at 09:56:06PM +0200, Mattia Narducci wrote:
> Changelog: https://sourceforge.net/p/ser2net/news
> 
> Static builds are no longer supported starting with version 2.6.0 [1]
> even when compiling all modules (gensios) in the library.
> 
> Updated licenses hashes due to upstream commit:
> https://github.com/cminyard/gensio/commit/859e4465cf5788cb99da1002a4c38cd8841c1bb7
> 
> Removed patch 0001 which is now upstream.
> 
> [1] https://github.com/cminyard/gensio/commit/7b3786f5fb733cd593e631a7b75d4b47f5a4b95f
> 
> Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>

Thanks a lot for your patch series, which I have applied to next. I
had to fix two things:

1. In both package/gensio/Config.in and package/ser2net/Config, add a
   Config.in comment about the dynamic library dependency

2. In PATCH 1/4, propagate the !BR2_STATIC_LIBS dependency to
   ser2net. You had done so in PATCH 4/4, but logically speaking, it
   belongs to PATCH 1/4, otherwise if we partially apply the series,
   or bisect through the commits, the situation between PATCH 1/4 and
   4/4 would be brokien

If you are interested by those two packages, don't hesitate to send a
patch adding yourself as a developer for them in the DEVELOPERS
file. This way you will receive e-mail notifications when there are
build failures, CVEs or new available upstream releases for those 2
packages.

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
