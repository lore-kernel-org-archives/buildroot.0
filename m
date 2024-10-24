Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FC4CE8E7A
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 14:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 241918116D;
	Thu, 24 Oct 2024 14:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMnTOSuxx9k7; Thu, 24 Oct 2024 14:13:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A6CF81136
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A6CF81136;
	Thu, 24 Oct 2024 14:13:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63A2D4960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 14:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CF0B608B6
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 14:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w22OTKg9xWuV for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 14:13:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2391B6066B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2391B6066B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2391B6066B
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 14:13:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 433061BF204;
 Thu, 24 Oct 2024 14:13:26 +0000 (UTC)
Date: Thu, 24 Oct 2024 16:13:24 +0200
To: Ayrton Leyssens <aleyssens@idtech.be>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20241024161324.086d8f3b@windsurf>
In-Reply-To: <VI1PR06MB89264486CFDAE541386E7431AD4E2@VI1PR06MB8926.eurprd06.prod.outlook.com>
References: <VI1PR06MB89260BFEC656834C6E385BFCAD432@VI1PR06MB8926.eurprd06.prod.outlook.com>
 <20241023223046.448ff10a@windsurf>
 <VI1PR06MB89264486CFDAE541386E7431AD4E2@VI1PR06MB8926.eurprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729779206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0+Ztauf5fB9wCJOmf6YUxBrj9vZVRZlkSMR/w8vwBs=;
 b=FesEqAj0sVY1lg+9SlwKdYmb6dyKrwABL0Dvee/bqKn80aWwUyJFS1/2L9KXRD45FDM5xH
 Nke218Zgbwaav2k7ACphH739HWcCMDTM3f1zyQKnKb2H+V+vLq0d6W8AGt2QXXytmlM0Tn
 rjC7aXjSkK6gh2MwgEzF4/UeJ1DoyaVRg24t6zIcRTZW+D6oWptMzkJhw9HNBaoLzGEkAw
 +2MwcYZ2QifUtdUBi4IILkjlp4vImKtNqgJWGWvJb4gG3pggNOfMQ+F/fvga7M07pBJkD/
 S6Qkg+/s64mYXadNNbmRbnHrYtdIxh9l1AtYcL57egsdsVb56hvsM+xDWTa3+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FesEqAj0
Subject: Re: [Buildroot] [PATCH 1/1] package/libtevent: add libtevent package
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

Hello Ayrton,

(Thanks for your feedback. A good practice is to strip the parts of the
e-mail you're not replying to. See below how I did it. Also your e-mail
client doesn't seem to wrap lines properly.)

On Thu, 24 Oct 2024 09:04:27 +0000
Ayrton Leyssens <aleyssens@idtech.be> wrote:

> > This whole file looks exactly identical to libtalloc. Is everything
> > exactly identical, and needed for libtevent as well, or did you
> > just copy/paste? :-)  
>
> Indeed, mostly copy paste.
> Since both use the waf-package system and the sources come from
> samba, they are quite identical.

Quite identical, or fully identical? Basically, I'd like to make sure
libtevent.mk is not more complicated than it needs to be. Is everything
you've added in libtevent.mk actually needed to allow building
libtevent?

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
