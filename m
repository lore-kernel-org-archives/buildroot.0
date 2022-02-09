Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3255DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E082A60BD5;
	Wed,  9 Feb 2022 19:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0gS4YCLektM; Wed,  9 Feb 2022 19:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C19360B4E;
	Wed,  9 Feb 2022 19:55:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9A41BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 291F560B4E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ej0exqjtq4LH for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:55:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35E53605E8
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:55:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 616321BF208;
 Wed,  9 Feb 2022 19:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644436519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVhDvekeoDPK1iTiFYGGHFthg6EWHXbzsYNQXIYlGFs=;
 b=CPFoYw4QCmrHXPzTD3yX7CVI+VI8obl4ETtp0umMrsOHt5qHAh/2+Kjj5RQhUCydfz38uN
 p3vav4HD8oOsvX9WxX8fgGuEwtnZX7QIjhlGBa4dUbXN1XDsejbsyOqsXZwo1T47wFWDKT
 7rI/oAKEKfbXGsElWdc1I6DSoTgn+9HnWmWy5ZDgDSky/xJGec3T+x6PLgV/77+fm05SEo
 9pH94VQA1eKfqzadisWAB93x8yQ+SOSTS/d1LOLiJcfbnt1QiZaXBCya1d9czmbO/XPwWo
 eB+R9tR+LYZiBqXbtaDC5lNqe1aeopKbLuhdlGLcCxeBzsrj1pWvFXetKJiGpA==
Date: Wed, 9 Feb 2022 20:55:18 +0100
To: <yann.morin@orange.com>
Message-ID: <20220209205518.18d720ef@windsurf>
In-Reply-To: <9430_1644422939_6203E71B_9430_485_1_951512fc2010b31a4d2d50fe12c2ad86f3a0c1a1.1644422916.git.yann.morin@orange.com>
References: <cover.1644422916.git.yann.morin@orange.com>
 <9430_1644422939_6203E71B_9430_485_1_951512fc2010b31a4d2d50fe12c2ad86f3a0c1a1.1644422916.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5 v2] package/pkg-cargo: host-rustc is
 also a build dependency
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 9 Feb 2022 17:08:45 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Currently, host-rustc is a download dependency, because we need cargo
> for the vendoring during the downlaod step.

                                ^^^^^^^^ download

> However, when using a package in override-srcdir, there is no download
> step, so host-rustc is not pulled in as a dependency which breaks
> running the build of a single pcakge from scratch:

                                ^^^^^^  package

>     $ make clean
>     $ make my-rust-package
>     [...]
>     [...] cargo build --offline --release --manifest-path Cargo.toml --locked
>     /bin/sh: cargo: command not found
> 
> We fix that by adding host-rustc as a standard dependency too.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
