Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9C0C77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A40241E45;
	Sat,  3 Jun 2023 19:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A40241E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GCICVqnOXIBL; Sat,  3 Jun 2023 19:30:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E1541E3C;
	Sat,  3 Jun 2023 19:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E1541E3C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A86FA1BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69B4E41E3C
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69B4E41E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeVVtEW4BXoN for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:30:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 827BB41E37
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 827BB41E37
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:30:24 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A65A0E0004;
 Sat,  3 Jun 2023 19:30:20 +0000 (UTC)
Date: Sat, 3 Jun 2023 21:30:19 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230603213019.7da071b0@windsurf>
In-Reply-To: <510ba693-7acd-74cc-8f8f-c961fd34d20a@mind.be>
References: <20230524131642.88902-1-romain.naour@smile.fr>
 <510ba693-7acd-74cc-8f8f-c961fd34d20a@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1685820621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+w+2BtqNNdxDRhNIew0pzOkkogTXZ8lCzAcAp/LihQ=;
 b=I05Xq3o3Gu73/iQP+g8C4cstZjkGUwjj6eIAbJO7/MxxE0Mp21qHkL4VVBtHqj+hSLE0yz
 Gl/+K+Q/vL7ozGMOGlQtByegF/rqMCG6onf01Rjcc82vbiOmNOyy6GH30Y45h4jv8MDXpa
 9UlfajNmQ/r58Uid5J5FC13GGDM83u9s88M06AFs5L0Pt3kvqAg4xn4PxFr6GLPilCio+b
 TZAs/2pUzfXybknVy3fOJld3WinJ9+CtPMO5qAvJ4U89nmcj8dvX6QJtpfTHgXiMA4dtWy
 gZpz+ZiIOX8rjiha8d2iJCXr8h2YTojqDQy65zNkLLuVGz+JWp2zCLqD1uVOfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I05Xq3o3
Subject: Re: [Buildroot] [PATCH] support/testing: test_clang: update to the
 next LTS kernel (4.19.x)
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 3 Jun 2023 21:21:10 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   We should really create more downloadable kernel and rely on those instead of 
> building the kernel during the runtime test. It takes a lot of time with no 
> merit. Unfortunately, those are on abo which only Thomas has access to...

I will be happy to update those binaries if need be, and also there is
nothing that really prevents from changing the location where those
files are hosted.

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
