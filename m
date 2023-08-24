Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3EEC6FA8F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 18:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 159F041633;
	Thu, 24 Aug 2023 18:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 159F041633
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAhX4-rFHyi6; Thu, 24 Aug 2023 18:58:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59CC8415C6;
	Thu, 24 Aug 2023 18:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59CC8415C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2C5C1BF853
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FAAD83934
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FAAD83934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eEXtswGTYhsh for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 18:58:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63A3883963
 for <buildroot@busybox.net>; Thu, 24 Aug 2023 18:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A3883963
Received: by mail.gandi.net (Postfix) with ESMTPSA id 386E41C0002;
 Thu, 24 Aug 2023 18:58:00 +0000 (UTC)
Date: Thu, 24 Aug 2023 20:57:59 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230824205759.39e661e8@windsurf>
In-Reply-To: <20230823140507.496751-1-francois.perrad@gadz.org>
References: <20230823140507.496751-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692903480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IElZagEcdDkV3KT7Yx9zfest4DdmWfw9HgFR2cRW3PM=;
 b=fE5HbBisFba2REMQpru65y2CknNo9pMs+lAlcJogzVJ5AeEzkXQ7KPUBI/hbITBQQydp+o
 TZg+vR6Feg86+GQIVGgX5NLkh0kQSwe7337+WUwQINlMgU0oQ8A17hDijpOlN2QSPxpKXr
 aVKC0mCTsZGAZafAjL7hKAxOlLwgD3B9LYpxzskpBmm/t9wfBD6nXAE1TeQTdt2Sj89C4Q
 TGFi8AB7yJZbfQp8g8BAp7B5wTGdCnzIiHdkQxNqSutTLKg8b5ASRoo8Ke0aMM7Da8uJSy
 lgLdq9J2d46vCSj8+IAhkssvf88tKPECOarlPOA7ndB54vJNEIkRa5gyIKi29A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fE5HbBis
Subject: Re: [Buildroot] [PATCH] package/lua-silva: bump to version 0.2.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Aug 2023 16:05:07 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> diff COPYRIGHT:
> -Copyright (C) 2017-2021 Francois Perrad.
> +Copyright (C) 2017-2023 Francois Perrad
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-silva/lua-silva.hash | 4 ++--
>  package/lua-silva/lua-silva.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
