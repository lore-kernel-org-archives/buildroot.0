Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF534C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 19:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 758B7605F3;
	Mon, 24 Aug 2026 19:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trt1uKqIsi-t; Mon, 24 Aug 2026 19:19:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787599184;
	bh=5aTD7YHYJQl+G07sAXCzr58w2S4Me3d7i2EWTDQPQUs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dYwXtjlmiE0vbQ9mhl+L58/3rLS+Az9kyxswwgBk/k+8P1hdY552/2wLMxwuKGUyY
	 Ck8TXDFsEPxdh7oa/9hsJU2a6VlvK5mFX5j41kClx06ml6RvPIqwrL48wJqnt6xVJT
	 xpEOO3D38K8pGTUM/UjUSozXayF7OX7G3mkYD2pgLqFssJefUMez8RYQ0Rid9iyFpG
	 sKOVjiaBRIMm1Sib7neVB2A5Fc4L+Vas8SybQs7A7SpsxjDaZcm0UZ2+EZsuWHrr+L
	 6M0TQFX0TchrKYfBfZCDHdmAS8TwmsxOBOGYuTE2/gkM04CgflGwIgTN6cURic+fYi
	 JM+wcd/c7+iEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90CE4605F7;
	Mon, 24 Aug 2026 19:19:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26EB32FD
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C80F605F7
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuhuEdMI02Kh for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 19:19:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C55F605F3
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:19:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BA5FB1A1804
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:19:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8EEAA5FFC1;
 Mon, 24 Aug 2026 19:19:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4076511C79B2C; 
 Mon, 24 Aug 2026 21:19:34 +0200 (CEST)
Date: Mon, 24 Aug 2026 21:19:33 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, 
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <aoyZLwLGQ0Qq6epO@windsurf>
References: <20260811120530.130487-1-thomas.perale@mind.be>
 <20260811120530.130487-2-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260811120530.130487-2-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3] website/lts: update release wording
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

Hello Thomas,

On Tue, Aug 11, 2026 at 02:05:30PM +0200, Thomas Perale via buildroot wrote:
> Update the release wording to align with the documentation.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

This is the patch that I applied to master, for real :-)

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
