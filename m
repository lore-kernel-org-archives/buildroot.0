Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55282C74A5B
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 06:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7185409B7;
	Wed, 29 Mar 2023 06:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7185409B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30BfcqCu3X8P; Wed, 29 Mar 2023 06:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1688405C6;
	Wed, 29 Mar 2023 06:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1688405C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 740341BF364
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 06:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59D6341C46
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 06:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D6341C46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANMqLEnZZIrv for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 06:44:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2BB141D5F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2BB141D5F
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 06:44:00 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C482D240002;
 Wed, 29 Mar 2023 06:43:58 +0000 (UTC)
Date: Wed, 29 Mar 2023 08:43:57 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230329084357.78d68e38@booty>
In-Reply-To: <20230328193849.GB3204460@scaer>
References: <20230327141122.103829-1-luca.ceresoli@bootlin.com>
 <20230327141122.103829-2-luca.ceresoli@bootlin.com>
 <20230328193849.GB3204460@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680072239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DxwEE2RHcoYDnqNvlhf09OuWkk7mjOtaNq7eGNx2zs=;
 b=f3gbm8gMXn+da8UU8g8e4HxpO8Sizpf0QpluL3f1tkYG6YzcE2KNykSJgB2mow4H3WyiZY
 P7h41rE5xxrw+4w1hkLeeHVvnM/IVV8GubR3mUOgscCLJ8Kr+9PdbuatEzauA8iAO1Mxuh
 vCr8D29t0fGksiT5uj/b8TlE10zrZoZ0cR5IjYON+1Mmwdn1pQdQp7c7AD5bGTQFTiGHrv
 GG5YXv+02CjZZXdpnzcE8dzfEkDAad9sY4FpfFmXLNM97Hvnts+wrr/XIYdkSLeuPWxh7d
 5N2jLFWfMwAkRczBJ6V83Jp/+gUJss98CI3kgVreGM3+OAh/gdlJqQ4jU2uRfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f3gbm8gM
Subject: Re: [Buildroot] [PATCH 2/2] docs/manual: ditch redundant -f 'rm'
 flag
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Tue, 28 Mar 2023 21:38:49 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Luca, All,
> 
> On 2023-03-27 16:11 +0200, Luca Ceresoli spake thusly:
> > The value of the RM variable in make is 'rm -f', thus the additional -f is
> > redundant. Avoid it on the docs to avoid developers taking it as a good
> > example to follow.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> 
> Applied to master, thanks.

> 
> Will you send a tree-wide cleanup, now? ;-)
> 
>     $ git grep -E '\$\(RM\) -r?f' |wc -l
>     47

I think I will leave it as an exercise for the motivated party. ;)

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
