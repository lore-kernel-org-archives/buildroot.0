Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5021CC6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE07819B8;
	Sat, 17 Sep 2022 08:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAE07819B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yelaz4kPB0_u; Sat, 17 Sep 2022 08:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 010AB81499;
	Sat, 17 Sep 2022 08:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 010AB81499
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC331BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E09928141F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E09928141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6i0OzQKiPByD for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 504A3813D9
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 504A3813D9
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:38:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E0BF200008;
 Sat, 17 Sep 2022 08:38:31 +0000 (UTC)
Date: Sat, 17 Sep 2022 10:38:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: <yann.morin@orange.com>
Message-ID: <20220917103829.02943c4c@windsurf>
In-Reply-To: <24827_1662976661_631F0295_24827_299_14_6f9b848a35cb9647b133c662924b4d82cf759b19.1662976659.git.yann.morin@orange.com>
References: <24827_1662976661_631F0295_24827_299_14_6f9b848a35cb9647b133c662924b4d82cf759b19.1662976659.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663403911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JXCN1sahGtm8HotkUSNlMvIy++gM3Dxbc10VfAsiSh8=;
 b=ODncpoqNahmNPk0VW3OH3jrvy3srWvE1CDl8dsvXhDoLaKXLSZlWEa9J2TwwSo3dN5GKYE
 VTBtd+y42XrWXT1EBkqO65U8T9Y+vT/kwuF0D6Mc6q84w2d+RQIpFC7PQE3Gyv3kgBVWQF
 TvvTlsiGuycBoGmGVByHAqGhzzutC4DehPlzic7cHe+jCWmucEu7xUACS5L+iv3QlEvYE6
 mmUvjxPqEHx7POzSY1Qh6ncnHKK7azFLZlnBgtlGN79WUbkNjipxsAr6ZgbdhUKGSCZLCX
 9er/akfjsyiTHBxr90df8Ib/99vxU9Wqb44mmbmPGQX5uS39DV3X2AQHuRaEWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ODncpoqN
Subject: Re: [Buildroot] [PATCH] package/mosquitto: add mosquitto group
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Francois Perrad <fperrad@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Sep 2022 11:57:39 +0200
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Since version 2.0.15, and upstream commit 71a90177d7b2 (Systemd: Add
> mosquitto group ownership), mosquitto uses its own group rather than
> the generic nobody group.
> 
> This means that mosauitto can now no longer start ona  systemd-based
> system.
> 
> Change our mosquitto user definition to specify a mosquitto group.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Titouan Christophe <titouanchristophe@gmail.com>
> Cc: Francois Perrad <fperrad@gmail.com>
> ---
>  package/mosquitto/mosquitto.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
