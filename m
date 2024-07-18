Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637D6C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 09:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDB54400D1;
	Thu, 18 Jul 2024 09:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQXAdgxQ7-Hg; Thu, 18 Jul 2024 09:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D0D440125
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D0D440125;
	Thu, 18 Jul 2024 09:46:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92ED31BF3B5
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 09:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F73A4037A
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 09:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08acDNqgtXow for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 09:46:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F03140308
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F03140308
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F03140308
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 09:46:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 007D04000A;
 Thu, 18 Jul 2024 09:46:04 +0000 (UTC)
Date: Thu, 18 Jul 2024 11:46:03 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20240718114603.7d845b10@windsurf>
In-Reply-To: <57bbc792-5d28-4f2d-b33f-f0735c31fbae@gmail.com>
References: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
 <20240717221000.5ced2d0d@windsurf>
 <b03840bf-6a53-4db7-ac58-ce1cc2587b8c@gmail.com>
 <20240717235322.5f90b271@windsurf>
 <57bbc792-5d28-4f2d-b33f-f0735c31fbae@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721295965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzsO5rkqRTdU00PYG9TYXgfTOcb/XVmauK5nISLOz58=;
 b=A2k3WLINV1DXA69oB+BIDWC6VpO4w1XPh6X5dj9qn2W31UFfHdZvG+7/R4Fg771jeqegpY
 0911CxrtIwEKteov0wo1ot9DCxuyK7+afIxcGwXL1zOb77Hq6hsLO3JQN9hhkU/VGHbpg/
 unN2sAREpjsLFFPxmzvHLrNzQBi5w+NPXnDTib96Duzo7CyqtnleWWHQ2ZL1+Yup0GlMH4
 0CmarRoNdAZO9Ur7NPpHSJYvtE4uLzRqD1ZCBHoLnSmCuw4KrS/HznPU6zx866GKEFQJ8T
 apV8IBPyq8jeRRPBbXPnK9ERbbrajSOETIR40vHy5Iih3kJzlOpUhT8/0r+C3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A2k3WLIN
Subject: Re: [Buildroot] Year 2038 time util issue - Build failure in
 2024.02.x
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
Cc: "Karicheri, Murali" <Murali.Karicheri@sandc.com>, "Karicheri,
 Murali via buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 17 Jul 2024 15:06:50 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> This is not happening with a defconfig, however it is currently 
> happening after refreshing my existing .config file:

When I say "provide a defconfig", I don't mean "a defconfig that is in
configs/", but rather "whatever configuration you're using, minified as
a defconfig for brevity".

> https://gist.github.com/ffainelli/8fe7988c86ee8a3016b893268b9a2f49

Thanks! I don't know when I'll have a look, so if others want to have a
look, don't hesitate :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
