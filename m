Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C649C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0295C84B9B;
	Sun, 24 Jul 2022 09:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0295C84B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dMcqXXTLLuee; Sun, 24 Jul 2022 09:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1869083F49;
	Sun, 24 Jul 2022 09:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1869083F49
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3221BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1649C417CC
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1649C417CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHPjGlTq378x for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:21:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B7FD4174A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B7FD4174A
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:21:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9FA5A60002;
 Sun, 24 Jul 2022 09:21:38 +0000 (UTC)
Date: Sun, 24 Jul 2022 11:21:37 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220724112137.3a2c6f36@windsurf>
In-Reply-To: <263543fd-ec60-fede-a500-2204ec1ffa30@mind.be>
References: <20220723165800.54811fe3@windsurf>
 <62dccb0e9f68e_2245ea9d8-3e4@xultri.mail>
 <263543fd-ec60-fede-a500-2204ec1ffa30@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658654499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rRhn+cKYJ/a7XDqjeyZUZUsZQvYC2orwokQF/An9SxI=;
 b=IBjHGx5Rt9VzjWVE9JsqXgBVXRlBPhpwQUnPxPEAHjqpr7PjibSJlWpXmCc29oTwHpNUr1
 3cRq6SaufbxgGH+ghlzNA4H3JADO2+i5JkQjAFrVH41KPEo5TYL7XpdhMJyOCMls2JV2z1
 28yL3MqWaiLZzzrgBWbtNomenFa0X4y0DtMol/nLXLx3QSBFSVDLwSrYY3ISHfMMyRKeU8
 aeiUK2cU+SZDfHToDxRZUVnKeHqnmts2HE5oBGuLzd/KmAhmc9HsdqLVQz1dVW4qQKpe+u
 vb4wkt5/qzX6jsCNJ5zAsuoPp+P0teXzoqRUz5Ti2jlNsKKZg6g+T97OGreqEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IBjHGx5R
Subject: Re: [Buildroot] [master, next,
 lts] utils/get-developer: fix DEVELOPERS syntax check on GitLab CI
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Jul 2022 09:45:22 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > We could catch that in at least two ways:
> > - adding the number of errors and warnings to parse_developers
> > - in the GitLab CI using grep in the stderr from get-developers  
> 
>   Or change parse_developers() to make that warning an error...

Yes, exactly. I think we should consider this issue (file in DEVELOPERS
that doesn't exist in practice) to be a hard error.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
