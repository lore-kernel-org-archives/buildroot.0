Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2805CA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ABEE80AB2;
	Mon, 28 Sep 2026 21:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTjK9FFEu1EN; Mon, 28 Sep 2026 21:23:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8B19080AFB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630609;
	b=ZNqy/Lm5LHdaKykQiu+/pLaLkS4Ubt5DaBTA4tdIX00aEpyIXytyGFuFtIF1lMXKMHP/
	 khg1rF1i4qe4WxP+SNblGCPFJhPJoF784pcU+E00F88YWYh9Yhj3cWpPISQMkE1XPEaAH
	 0r72oV/Z9owbc21orO70nA8SxuQkJEXfKEVESk7tAUOke0p/UQVphRAbepxIRcYUj25HQ
	 ewG4OhNdUUhgV1Wc/JViA5+E/Th5ZgVrGdP4f/PgepMxn7BXhV6Ii1Fgv3UX9Z2d7VY6V
	 2oNHKyaWjh3m8h4b/k8rzVPMGgMlp80hbfPvThONsQldpSpGZh4FjfXAw4BDvOi9Ccw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630609;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TBChR2p5NE3B1FyeHZKXzZ5ys4yQPRH0cymx+grPIio=;
	b=i4JDTcrbjqueL8MEHqUFSFTrcqcYAJSHswrmLP1h69M87wg3cpRvG3rY4L8q13IrBPnH
	 e+Px1YoLrVYsZr3Wq47UXcf3yhqCKoYaQmgP2dUKpM8oogn9cbHbUfMHgD0NKUcWvItUr
	 xdZEX+nBoNn3MpBcO6zFaVLsClzrk2Ng6wSqHeaw0WL9sL/7FpT+XvfD5SMpc9YS8y2uc
	 gdQJZBmepgr5y7+pPL0pwFzztHA6H93qOmv5CnzrudKLVPzHhoc4QzHZT+z8Z8ciCWwmV
	 aUsqyKNMKXrXi1bM7FY+SW66zpekvet+8nvcYmot9epVoi7lkqbS27XVEMGkYpohRcw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630609;
	bh=TBChR2p5NE3B1FyeHZKXzZ5ys4yQPRH0cymx+grPIio=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FTMDaLCqgQialDq5Y4At7HBqWUFyFQ/+BjCHbUvUVyn1WlqbxdR3kguK8LWNDQXnZ
	 BaJyjwJzpcr4n0XIGFpdP5MazDOmu2+I2TfKRcu0t2XkzLibkNJ+nI5y416GYt/r4J
	 hzc1E54dEss0er02/T3EFTstH5SslqavahC7/JwHWdFWre8Tk/gT3N4lfKN6nxTLmx
	 cShXvDECkAm+TABaGNszuqa3lFix0YDxaDix9jNLe0a0tl2kN+hwo4k6leJDijhagN
	 2HhWlRTA3voCfQiInD+JLajfS9pXHzu4lVv+GQoOc3IRxwBN8jSQ9awW7sNvaFcVE8
	 XR540G6FRKwNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B19080AFB;
	Mon, 28 Sep 2026 21:23:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2123B335
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 069374018B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDmyQ3n7iVJH for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:23:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org AC53E4008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630606;
 b=INNwM5+XcT6Rg0qW5fkhbLRDMeywz0vLsBHrHXO/f7gsSHptLSJSoz2BAXRplKeGhKSy
 c0ZHsOmOy//63psgJn1new1yyHB5GaXBYsZxwwvIkgHeG2bW3RpVC0BFwT+8pbxokrqyl
 6pTyvwks+Dm5yy2aD0H6k3VG7/t9XCLrYw01z+ehD2Cnv3nDW4v5HbwOkNgEpU3Kt0whc
 iLqdEK1j/r3dvnqJUnnb9WRMzOmo0C5KgnUHj6MTCM1BZbypTzM5boLq82WVPU7DjG9Pu
 Yv2ejxcdAx2UTYRjK12M0P+UNQyNsRTTI0Vv+dJWSpz+Frt07iq0VrUxRGZnA9rz1xA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630606;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1NOMoZp6PJtnUP+mEPExn6klclvNFz9XsnLm6Hz/jVo=;
 b=AQHzb232JFvBowbiUBuI1bNZGi6ploj7abR0D6sPBrlUX20pAQePnCBvMrYReuJnmV3U
 rAWUbBVdFOM6a6xQR06lvMkjRYdwtOy4q5ErRBb2YwGMHqXffi6nTOVkY6WCAMt8Yzvy1
 mcb1e+h06/3Vp+8Tyc0PPktYuhWVZioUO6Zxmoe0e2EPFTvs8dhfg112VBGgyaaWPQjdC
 VWBbNUo6FCw2/08re7xDyBo94H9yPj39dcDn1c+EgQ0qgfBxYufZdG9SN7wPjSZPv0Q26
 7sY2zAMHm1ssgWfF0GcXvZBoiAxy4PS9oQWevLCTQdhfqDM2IkkK8H7HmAcwOl+iZvA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LogCUUnl; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC53E4008A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:23:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2EAF34E41098
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:23:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E1D58601BD;
 Mon, 28 Sep 2026 21:23:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2637910329728; 
 Mon, 28 Sep 2026 23:23:17 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:23:17 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <arraunh5i2HYIRh8@windsurf>
References: <20260928162203.3465543-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928162203.3465543-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/less: bump to version 710
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

On Mon, Sep 28, 2026 at 06:22:03PM +0200, Dario Binacchi wrote:
> For change log, see:
> https://www.greenwoodsoftware.com/less/news.710.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks!

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
