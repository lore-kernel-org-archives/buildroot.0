Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F17FC47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC932615D9;
	Thu,  4 Jan 2024 21:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC932615D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rn2jsLs2DywT; Thu,  4 Jan 2024 21:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26316615BD;
	Thu,  4 Jan 2024 21:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26316615BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA5761BF859
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3370424FF
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3370424FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBDyOHTdeKoz for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:38:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D26C424E2
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D26C424E2
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED67B1BF204;
 Thu,  4 Jan 2024 21:38:23 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:38:23 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240104223823.1bb97896@windsurf>
In-Reply-To: <ZZckauC7K7-qR0lP@landeda>
References: <20240103102311.4048759-1-abrodkin@synopsys.com>
 <20240104221941.044adcb5@windsurf> <ZZckauC7K7-qR0lP@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704404304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CuIBvb3BbK0OwXEc2e6FJm/6dfyn30LjxhQTdIPRqBk=;
 b=nbLWGUUGQN75/W/CJlKCR1D0bnWzfVhqXsZzy7G4/lBfu7y7iXuXDEjtZ3s583QYeMSFmq
 jCwwUojVapTcCkiX8gby2tX+gTdQ/DA4HOBlHQA67pMFD2GIzrqwkfYLBDl9OFt1Q/S/9C
 IJDtpEcuyaEMwD99WwryZ3Yjo9q3EKazSAJegoVrHilulgEqsp/uNe84GfLVwgKgj2QTDt
 4+Lvy/cs/dHaBnJ8s/EJTxtKz/8xtJorJqNhrNXkbub6CEC4Ik/0WEEMIfmOnSx60FEty1
 642wdcSVe8x+AVNzCGrWu8n2zOprNZBu4WLQ3aNgeqQ0aPLXFviZkOZkeF2loQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nbLWGUUG
Subject: Re: [Buildroot] [PATCH] arch: Set max/common-page-size for libgcc &
 libstdc++
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Pavel Kozlov <Pavel.Kozlov@synopsys.com>, Vladimir Isaev <VVIsaev@gmail.com>,
 Alexey Brodkin via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 4 Jan 2024 22:34:34 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > But I'm surprised they are not needed also in the C library build. Why
> > are you not seeing the same problem with the C library build, it should
> > also need the same page size flags, doesn't it?  
> 
> It is my understanding that the toolchain wrapper is installed as a post
> initial gcc hook as well:
> 
>    package/gcc/gcc-initial/gcc-initial.mk:
>    59 HOST_GCC_INITIAL_POST_BUILD_HOOKS += TOOLCHAIN_WRAPPER_BUILD
>    60 HOST_GCC_INITIAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
>    61 HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
> 
> So the C libraries are built using our wrapper.

Hum, indeed. But then, why doesn't that apply to libgcc and libstdc++
as well? It is because libgcc/libstdc++ are built with the second stage
gcc, before it is installed and wrapped by our wrapper? I guess so
because the first stage gcc isn't capable of building shared libraries,
or something like that.

So, indeed, my proposal to Alexey is to use ARCH_TOOLCHAIN_WRAPPER_OPTS
in gcc.mk. This will allow to get rid of the special -matomic addition.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
