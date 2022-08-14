Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6B1C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AE1B827C6;
	Sun, 14 Aug 2022 10:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE1B827C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6F-t8dNxtqc; Sun, 14 Aug 2022 10:29:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DC2D8276E;
	Sun, 14 Aug 2022 10:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DC2D8276E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF2A1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36FE88276E
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36FE88276E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BaESgvkAHf87 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:29:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03DB982605
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03DB982605
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 10:29:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4396B240003;
 Sun, 14 Aug 2022 10:29:16 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:29:14 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220814122914.58654b82@windsurf>
In-Reply-To: <20220812155855.293755-1-francois.perrad@gadz.org>
References: <20220812155855.293755-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660472957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6zaF5ofk040hMkzV7QRmkabGxBko/K2bDFhu8gQw/TM=;
 b=Rp92EIIxab1JP0Vtjn4YmSRsK4m+KkNIsAitQfTWiQnEyDtdm7BecbfPx6dl93Til5h0iL
 b1GzIwBgjYvDyTGfoNEej4g+8EZuYAY3jF/ml7YXl05dfhz3WSIgTfikyDMeauFTSQD+a5
 G5UDJ0IijLltqX9+uKdDgQf5bJ8tgKACYCRZpX9pl8zu7vMLzq3UeneuXu/kutWOO9vBc9
 5N5cW4vLs2Srznhx9RhWxc60dfx9y0pMW4mg1NpgRIr4LLRV1IG6iWmoopGi2vxMkr/RN9
 uXb+hniXqlPwVgnEy/gIuPXTiDRXBfLH0QNMwRXvLTzwIYdPiIyMMK150OQ0lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rp92EIIx
Subject: Re: [Buildroot] [PATCH] linux/linux: fix firmware-imx dependency
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
Cc: buildroot@busybox.net, c.leger@borea-dental.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Aug 2022 17:58:55 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> introduced by https://patchwork.ozlabs.org/project/buildroot/patch/20220504094006.1541643-1-c.leger@borea-dental.com/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  linux/linux.mk | 2 +-
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
