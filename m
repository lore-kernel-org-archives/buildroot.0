Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C33CA0EC4
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 21:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB67141A64;
	Thu, 29 Aug 2024 21:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H71VyX7Dk47a; Thu, 29 Aug 2024 21:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8212241A6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8212241A6B;
	Thu, 29 Aug 2024 21:44:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B352C1BF5E9
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 21:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD26541A6B
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 21:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQHBjfvzjNMs for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 21:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56C1241A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56C1241A64
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56C1241A64
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 21:44:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1624320002;
 Thu, 29 Aug 2024 21:44:17 +0000 (UTC)
Date: Thu, 29 Aug 2024 23:44:16 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240829234416.4131264b@windsurf>
In-Reply-To: <87ttf47nr6.fsf@dell.be.48ers.dk>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf>
 <87r0a994or.fsf@dell.be.48ers.dk>
 <20240828154253.206391b0@windsurf>
 <87ttf47nr6.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724967858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qg7+WtqrmlgemXO0GD35KylXjcRbh0PZQsUmhB2gftg=;
 b=PVglgiNB9YZzXFFaYiXpYTok/JLBmNalkbYaFjjczRkCGv8ulWOD+nDGyUuS+F4wdw10jq
 bUcv4x17Vpmis6ccORiWrt5/YXiWKM+HojQXdeGjZHhfLDao3tBuy1+G7zOjDMpI0wHQnE
 /Qj+kf4gNYAd+zaQhwdP5QCtGRI5bVdFJL47YEnDf8K/5qZbFMnQb/HRF6if8rz4adteFW
 xKdPWj/Xc/nlU8exv04D65Q9NsntumHRky+g2vleua2731tbRcP6/kLw835vsFZHgdlobX
 TKA1jhW3FvkPXGLu7x11nVLBPiPvK2ESK/aOhJMxYmXC/TZkxvHxMEamp3WLmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PVglgiNB
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: michael@amarulasolutions.com, Xuanhao Shi <X15000177@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Wed, 28 Aug 2024 15:58:21 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > I understand your concern, but compression is also what helps in making
>  > those sparse images small.  
> 
> NIT: No, it is the sparseness (E.G. the holes). Compression in fact
> breaks the holes (replaces them by zeros):

You didn't understand my point, and Arnout explained it better on the
chat.

My point is that it is *very* easy to lose the sparseness. You copy the
file around, you share it in Google Drive, or download it over HTTP or
what not, and bang the sparseness is lost.

Instead, with a compressed file, you get a file that has pretty much
the same size as the sparse file, but you can move it around, transfer
it, it won't consume its real size. And the bmap metadata file allows
to use/flash that compressed file with the same efficiency as the
original sparse file.

In fact, bmap is quite useless is the file sparseness is retained:
instead of using bmap metadata, you could just ask what are the holes
of the file and skip them when flashing. So really the whole point of
bmap metadata IMO is that they allow to do fast flashing (skipping
holes) even if the sparseness of the file has been lost.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
