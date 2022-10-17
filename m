Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD84C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 18:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC47B80C5E;
	Mon, 17 Oct 2022 18:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC47B80C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9_JY9dQCtkM; Mon, 17 Oct 2022 18:48:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F225482BE7;
	Mon, 17 Oct 2022 18:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F225482BE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE291BF31C
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF65660A6C
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF65660A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qv9wV92aPir4 for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 18:48:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9586058D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A9586058D
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 18:48:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6CDC0FF803;
 Mon, 17 Oct 2022 18:48:20 +0000 (UTC)
Date: Mon, 17 Oct 2022 20:48:19 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221017204819.47cb4078@windsurf>
In-Reply-To: <20221017175500.GB3666@scaer>
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-2-thomas.perale@mind.be>
 <CA+h8R2qwa-bzHzogQoVRubbapo1EwKmzyPML_hJQww144DWv6g@mail.gmail.com>
 <20221017175500.GB3666@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666032502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XTYljWLMryzKwIFqNVvV6pxPzNf3CwFfqzR8v/HFSEc=;
 b=A6DLObESAxA6ATpgek4uvTY2NCWVB0HjDZgz69TWzwZ9Z88trgeh70gk9fWOgNi04yanSw
 dz5mLIR7Ooy4fM/QNB+Jdu6yZA7tTICcWN5igCdwvPyUtxhyfcnxzy7eAElELAIYUlbJtR
 FTBWHctNaHlobItqYbT5w4jAyimqc3RmwLeiphPcz1b5cK7hM4wnFWgeV6l0oEIAodcDvv
 mTD/CGOV8ktxDtbmbHdo7M7rWb9IJNs7kcS+yNABJBnIs+LUbQyyPob8W+s4XQVj8cHejl
 SzOQrIQT2jETdEduDJxJ6sEDC2KHAbt6RhY3LGPCjJPDyQNk0ib1UCXh2JIviw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A6DLObES
Subject: Re: [Buildroot] [PATCH 1/4] package/goc: new virtual package
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
Cc: Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Oct 2022 19:55:00 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> In fact, we want to have a similar implementation for rust, go, nodejs,
> so (without looking at the details of this series), I guess Thomas
> Perale took the same approach as the existing rust situation, like
> Thomas Petazzoni did in the recent host-nodejs series:
> 
>     https://patchwork.ozlabs.org/project/buildroot/list/?series=319967

Yes and no, because Thomas Perale changed all packages using Go to use
host-goc instead of host-go, while my series keeps host-nodejs but
changes it from host-generic-package to host-virtual-package.

Also, I'd like to recap the naming we have:

 - Rust (existing)
   virtual package: 		host-rustc
   pre-compiled package:   	host-rust-bin
   from source package:         host-rust

 - NodeJS (proposed by me)
   virtual package:             host-nodejs
   pre-compiled package:        host-nodejs-bin
   from source package:         host-nodejs-src

   The odd thing here being that host-nodejs is a virtual package, but
   nodejs is a regular package building NodeJS from source for the
   target.

 - Go (proposed by Thomas Perale)
   virtual package:		host-goc
   pre-compiled package:        host-go-bin
   from source package:         host-go

So Thomas aligned on the naming used in the Rust world. I must say I do
have a preference for the naming I have chosen for NodeJS, which IMO is
clearer.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
