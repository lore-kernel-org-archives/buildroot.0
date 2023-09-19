Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48754CD54A8
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 08:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EABE682BE5;
	Tue, 19 Sep 2023 08:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EABE682BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7XB4yLUMT79; Tue, 19 Sep 2023 08:41:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1856982BC4;
	Tue, 19 Sep 2023 08:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1856982BC4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3FDF1BF32D
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 08:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B37D641BC4
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 08:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B37D641BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ERCIereH2SY for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 08:41:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6747941BC0
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 08:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6747941BC0
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB24AFF803;
 Tue, 19 Sep 2023 08:41:21 +0000 (UTC)
Date: Tue, 19 Sep 2023 10:41:21 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20230919104121.4d55e084@windsurf>
In-Reply-To: <20230919081012.529819-1-jamie.gibbons@microchip.com>
References: <20230919081012.529819-1-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695112882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qh7cfgNXscjPRBaOCqBJVxTHm0kESP/0h1xbLA/uzYM=;
 b=odX5Gpf5oZa/95c+HphjcTDnWx0JdRX6cCDoBEn2neK0UrRCD9hWx/NtCB/YIYmJkzU0gC
 PM5f75I7LQQL7gVAQmdWzRJ0efAKYC9IR+IQyqU4oSU/jm83gYyud7xyD43LQu5YNq4V9Z
 3WOqOOdhgrcq3ZpuGI+d6wuGLdHq9hCc+woD+t88KvbWSX8HYvTafnjumrbrM60f/lFg4G
 yIo6qLb6326M0xL62ZC5LAWcy+mpAowHt3846MZdlKc2viUODcTVYn3GiIREo72ZLybXDK
 xccefh+/6/NQ8lMoLbA+liB/hCWLYphgnJSUc3grfzYdKDIpd9P1+qTtHoJtmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=odX5Gpf5
Subject: Re: [Buildroot] [PATCH 1/1]
 configs/microchip_mpfs_icicle_defconfig: fix zicsr build error
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
Cc: Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

On Tue, 19 Sep 2023 09:10:12 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> Build is failing with an unrecognised opcode error due to missing
> `zicsr` extension requirement. This is introduced with GCC version 12.
> All our current defconfigs use GCC version 11. Add GCC version 11
> kconfig to fix this build error and align with our downstream
> Buildroot-External defconfigs.
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>

Hm, we really want to fix this the proper, aka make this work with GCC
12+. Indeed as soon as GCC 14.x lands, we will drop support for GCC
11.x, so the solution proposed here really isn't suitable :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
