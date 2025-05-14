Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29085C3ABD9
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 11:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4A4D414CC;
	Wed, 14 May 2025 11:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpAYEt-w_kd4; Wed, 14 May 2025 11:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE3FF41481
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE3FF41481;
	Wed, 14 May 2025 11:33:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8266153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 11:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9659D4091E
 for <buildroot@buildroot.org>; Wed, 14 May 2025 11:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdrAe6cAorie for <buildroot@buildroot.org>;
 Wed, 14 May 2025 11:33:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30F4040B0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30F4040B0D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30F4040B0D
 for <buildroot@buildroot.org>; Wed, 14 May 2025 11:33:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 076B643848;
 Wed, 14 May 2025 11:33:41 +0000 (UTC)
Date: Wed, 14 May 2025 13:33:39 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250514133339.13352275@booty>
In-Reply-To: <20250504174247.184F2863D7@busybox.osuosl.org>
References: <20250504174247.184F2863D7@busybox.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeikeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejfedtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgveeuhefhkefhgfdtgfeiueeljeekheekhefgheehgeeuffefieehkefgfefgheenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747222422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TiyygawYZQWuLZy71phfBn8bhFCjdeDH4NHwM1lb6Qw=;
 b=TtNS3M05HhKcKHsR4WkwtGEb4/tkhLyQugi3wrWumDxYYaKzTt451hCOTagX/Xf/B1I5kF
 H0qW2ZbitDryYqyvEwIvnSEySWydDOEouo7aoqgB3IFKUM45LYvl/+9bPHUu9t9VNc8W6x
 cV2IQjGOg4hfSwZ8F0cEZFKkGpltIgYx9Ppy/ThNLyy6SCbSWkvdWKp2R8tOeTcwibhfRq
 F2Y114Wdy82tACMurggn22FDBKHiKjhVjR2ZdEneKmakz26ZCVbCUsvW2H/RZ2JPX5URy7
 33ISauyHGiuBz8snf7D6yDL0aBdYJpUH2OoObjnAO7I+kTVrUniBa4rOxEUn/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TtNS3M05
Subject: Re: [Buildroot] [git commit] package/m4: fix build failure with
 host-gcc 15
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julian, All,

On Sun, 4 May 2025 19:36:21 +0200
Julien Olivain <ju.o@free.fr> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=7a07a9d155b8f601d68f07ee0ed1dc8d48907644
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> When compiling host-m4 1.4.19 with a host gcc 15 (which is the version
> included in Fedora 42, released on 2025-04-15), compilation fails with
> error:

[...]

> +ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
> +HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"
> +endif

While this patch fixes builds with gcc 15 on the master branch, there
is currently no fix on the 2025.02.x LTS branch.

This patch does not fix 2025.02.x however, because
BR2_HOST_GCC_AT_LEAST_15 does not exist on that branch, thus the ifeq
never triggers.

I tested this patch on 2025.02.1 as it was originally submitted [1],
unconditionally applying -std=gnu17, and it fixes the host-m4 build on
Fedora 42 (gcc 15.1.1). However I suspect it would not break host-m4 on
hosts with an older gcc version.

I instead tried cherry-picking these two patches on 2025.02.1:

  cca8d68461e6 ("Config.in: introduce BR2_HOST_GCC_AT_LEAST_{12..15}")
  7a07a9d155b8 ("package/m4: fix build failure with host-gcc 15") <this commit>

With those, host-m4 built successfully.

Would it be OK to apply both of these on 2025.02.x?

[1] https://lore.kernel.org/buildroot/20250503135217.490404-2-zik@jambula.net/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
