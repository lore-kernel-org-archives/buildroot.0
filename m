Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D32DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 113D84094C;
	Wed,  9 Feb 2022 19:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5L3ysGpohYsK; Wed,  9 Feb 2022 19:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 389FD40930;
	Wed,  9 Feb 2022 19:55:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 562571BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44C8C60BA0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZVOCJTn5JoZ for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:55:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 461DE60B4E
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:55:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 569CC240006;
 Wed,  9 Feb 2022 19:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644436545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4PLaERcQw/9soEs+obMOhluMEGoE00ZVyl7aW7wbKSs=;
 b=Yq3KKCNH+UQpzt9pE8r6djLRMYvD3AL/vHvWdMxWCfZeT9vooL/FUZZfI2ThlQPAPG6Qh2
 Oy2mLLSi3wFU4k7QZ/xyYUYlxLhm9UBcL/OOlcYfVBANLXES4yGldg7kH95+UA4sY1DSec
 +IIJ0oZjPpPAW1/m9stzemgJ30RIib9e2UAui5/BNwrntYjSvDirhTOzNsPr12N2u/AOgp
 /tgx0T16T0isfV/6/4ZmiHfXFzlOWWQECHB5/6zEgAhrAOnC8g6SUkoP8WxAc36bA0bStS
 /KzjQblzd/+Jc6yhCFUPKC7OT3AtcxFawh+Mcjbw6rSRPL0x0ar8Cxne94V38A==
Date: Wed, 9 Feb 2022 20:55:44 +0100
To: <yann.morin@orange.com>
Message-ID: <20220209205544.6a944b47@windsurf>
In-Reply-To: <20175_1644422945_6203E721_20175_189_1_2f2cfe45bc7a546997c16e84a6e617dc0752a731.1644422916.git.yann.morin@orange.com>
References: <cover.1644422916.git.yann.morin@orange.com>
 <20175_1644422945_6203E721_20175_189_1_2f2cfe45bc7a546997c16e84a6e617dc0752a731.1644422916.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5 v2] package/pkg-golang: allow packages
 to define download environment
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 9 Feb 2022 17:08:46 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Currently, the golang infrastructure forcibly sets the package _DL_ENV
> variable, instead of appending to it, which prevents packages from
> providing their own download environment variables.
> 
> We fix that by using an append-assignment.
> 
> Note: when introduced, that variable was explicitly not documented, and
> is supposed to only be used by packages infrastructures. However, that
> variable exists, and it can be (ab)used by br2-external packages (most
> probably to ill effects, but heh!). We anyway leave it undocumented,
> like _ROOTFS_PRE_CMD_HOOKS.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Christian Stewart <christian@paral.in>
> Cc: Anisse Astier <anisse@astier.eu>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
