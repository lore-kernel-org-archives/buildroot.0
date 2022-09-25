Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436D8C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 19:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB3B3404A8;
	Sun, 25 Sep 2022 19:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB3B3404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0QzVagh__gP; Sun, 25 Sep 2022 19:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B168405C7;
	Sun, 25 Sep 2022 19:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B168405C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1191BF577
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A5F4405C7
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A5F4405C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rXtx7XBQ3W84 for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 19:23:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B37B404A8
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B37B404A8
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 19:23:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F0363E0003;
 Sun, 25 Sep 2022 19:23:25 +0000 (UTC)
Date: Sun, 25 Sep 2022 21:23:23 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220925212323.53b314de@windsurf>
In-Reply-To: <20220925181557.GB1419013@scaer>
References: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
 <20220925171932.1630739-3-thomas.petazzoni@bootlin.com>
 <20220925181557.GB1419013@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664133806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ipn7QWLxFOppHls5TvorGx4yoIaV4MZhzQdRcHk6bY=;
 b=RcokAgf2Yv7a6uG3bCp8THYx4pN8SRZgyJHMOKy9Y4SHz81u7JbFromlkvaLmXtxf6uuQT
 g4SDLjCzz16+WqvQaH+vAQnKLvo4b1guP03AEOB3kY6Hq7zGqDQvFgs3eZzomfceqqeNql
 J3P+zELcDqsQCOdos7pDkR05jy2sKlpKjzvoHLVujQJBmsSO7L4VTbWKmTjXxC/zFqQkn6
 qa5+A3kPN6StQ/ZO4u4TGDSjXx/9404UJAU2uYfavGodTPvBYQRvSHmneREPPgyWKEqCaP
 GO0m4F/5Cl6sn1zJnSYEkCAadC4NgG+2FAc6jrYl+VycBlSiEesIVOeqfj/lhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RcokAgf2
Subject: Re: [Buildroot] [PATCH 3/4] package/nodejs: add patch to adjust
 default NodeJS search path
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Sep 2022 20:15:57 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> It looks like this is an array, so maybe we could keep the original
> path, and add the npm installation path:
> 
>     const paths = [path.resolve(prefixDir, 'lib', 'node'),
>                    path.resolve(prefixDir, 'lib', 'node_modules'),];
> 
> This, in case some ot-of-tree packages simply copy files into the
> original .../node/ directory.

Good point, I've sent a v2 which does exactly this.

> Alternatively, we could symlink node_modules to node.

I did consider the symlink solution as well, but I worried (perhaps
wrongly, or too conservatively) that it could get removed. Or it would
have to be the other way around: node -> node_modules, as npm installs
in node_modules and I would be worried of npm being unhappy with
installing inside a path that contains a symlink.

Overall, I found patching the search path to be safer, but if the
symlink solution is preferred, I can definitely implement it.

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
