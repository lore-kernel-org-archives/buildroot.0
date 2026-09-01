Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0C5C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64D8A40A28;
	Tue,  1 Sep 2026 21:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mt3xzmvN6XOX; Tue,  1 Sep 2026 21:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788298592;
	bh=uWrASATBsqagFdkpFMBiSFQtLuaXDw9sSVFJ4UvTDpA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jmz1z/7exR2L1+anAHgEhHbGHGfaqbHgr/PPufLSwAyC99DUDWoQDK5y3Lr8mUkmU
	 dw54zGhr2V03v+SqBXpuSq9FBm8rA+4pHJLsJao1t8YJDCK0KnZH9LtyZEtnL/AXOE
	 avy/Ek40udoU9XtXBjG5yW6qzVYyiaYeBKI5lWHrRgbfT5fjIC1ZEilJFkqee7rFpI
	 KGX+qrxgck7uck57ROulPYL2lrxBR3peQSVgiyGXZDb6DQPGwS4ugYahEKaLFz/7iA
	 CaQ6ljD0jXrCybK6vloPA0vMysnwaMnPRly9RJ3TQzQnf+19wsu/3uqWXNLdVbbo7d
	 jFA79I7gwWGDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC4E9407ED;
	Tue,  1 Sep 2026 21:36:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5215279
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A9AC40143
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58X3i4A8N0RV for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:36:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3CFF400D5
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:36:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D25D04E41499;
 Tue,  1 Sep 2026 21:36:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 99C286053C;
 Tue,  1 Sep 2026 21:36:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E3CC11C7927E; 
 Tue,  1 Sep 2026 23:36:21 +0200 (CEST)
Date: Tue, 1 Sep 2026 23:36:20 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, joseph@anodize.com, ramin.moussavi@yacoub.de, 
 thesamprice@gmail.com, ju.o@free.fr, lordrasmus@gmail.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Message-ID: <apdFL45ytN1A-28U@windsurf>
References: <20260817115616.4081110-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260817115616.4081110-1-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze frame
 unwinding fix to v15 and v16
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

Hello Neal,

On Mon, Aug 17, 2026 at 12:56:16PM +0100, Neal Frager via buildroot wrote:
> Add microblaze signal-frame unwinding fix back port to gcc 15.3.0 and 16.2.0.
> 
> Upstream: https://github.com/gcc-mirror/gcc/commit/4ef64ad1a
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Thanks for those patches. However, they need an Upstream: tag and your
Signed-off-by: line added to them.

Could you resend with this fixed?

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
