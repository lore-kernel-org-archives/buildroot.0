Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CDAC5DF87
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 10:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B35F80FB1;
	Fri, 21 Aug 2026 10:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaJopZJw0Q6q; Fri, 21 Aug 2026 10:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787306617;
	bh=hTwG9FK4nxuxAXSGyNIiSoAAtD016HPpOospCzlbtEY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VYCog02N2ApAd7Xxg4L6wQi58gMEEMPwKRQ5wZZrRtrIFzbLKOUVEUMVOstV+8/Re
	 iQwz7JO+5yDySKEIdbsv2ndrmIuD6VdrOrLyzBo0O4J9t5BrUzBNeA64NTnu0PNyno
	 i2CQLjtgBCaGkLQ4wXv6Z9AckZg16UM2p3WUpC6wo7oafzXoGxe4R4AUfroW2qRbZN
	 PE77HMutJAXb0hklcbt60t1vcHwuahjOayy89n8ilG2abVrTq3NCtAKxx5/lg6Uw9W
	 Rx6TiRfn8R1Ga1u44F+/ixJ+c8M0LwQQqEu8qT1HmBLYSyolu/+9Yxedvu2jSiTimU
	 XzLe9/Z4J0frw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D060080EEE;
	Fri, 21 Aug 2026 10:03:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7849263
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CC61408D0
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oo1egUAuk9CS for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 10:03:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E334408C0
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:03:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 631B04E4131B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:03:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 37EA8604AA;
 Fri, 21 Aug 2026 10:03:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A21AC11C76E7C; 
 Fri, 21 Aug 2026 12:03:28 +0200 (CEST)
Date: Fri, 21 Aug 2026 12:03:28 +0200
To: Alessandro Rubini <rubini@gnudd.com>
Cc: buildroot@buildroot.org
Message-ID: <aogiUVircwwTTE61@windsurf>
References: <amaCxq1lFi8rsIyJ@arcana.i.gnudd.com> <aoghe-d8Lvcj_qlr@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoghe-d8Lvcj_qlr@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/jpeg-turbo: fix aarch64 build using
 an upstream patch
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

On Fri, Aug 21, 2026 at 12:02:26PM +0200, Thomas Petazzoni wrote:
> Could you adjust this, together with hopefully some explanation on why
> -Os triggers the issue and not -O2?

Ah, and also, in your commit message, you can add a reference to the
autobuilder issue being fixed, as follows:

Fixes:

  https://autobuild.buildroot.net/results/d5321270034c2f14b613d69519e562ec16135ac0/

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
