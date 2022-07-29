Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B06C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 11:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50BFE41B97;
	Fri, 29 Jul 2022 11:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50BFE41B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id emmx1bkETdDq; Fri, 29 Jul 2022 11:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECBE041B65;
	Fri, 29 Jul 2022 11:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECBE041B65
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 597961BF279
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41E2140BA3
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41E2140BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3831FLNzcism for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 11:26:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 142B540154
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 142B540154
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 11:26:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D343B20003;
 Fri, 29 Jul 2022 11:26:11 +0000 (UTC)
Date: Fri, 29 Jul 2022 13:26:10 +0200
To: Bartosz Bilas <b.bilas@grinn-global.com>
Message-ID: <20220729132610.4100aedd@windsurf>
In-Reply-To: <20220729100953.968434-1-b.bilas@grinn-global.com>
References: <20220729100953.968434-1-b.bilas@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659093972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2+G7a+JEg4hDOoOpXleCi/FhKDUGEAiMlrr1Zlk+kc=;
 b=DlvTLGNK7iBOwlwn6y5kmZx0PyQasu27ILD/w21UChi7sN/yv+Z4XgMYtyJHuUxAB9VUJl
 JQkjlWkgyxgOe2ugeu0PK+Oj/GhrPwu+M+8qiOJzPibA4f3dLBbp4ceuimZgXhes9veGOw
 RMI/9+TycE1ljsaNOfc9FGS3MAXKdHTZLhWwbUFC2yW74uiQzAz0HTYoYsNj+wm5tCND8g
 1gZmpdb0p6OeIlbyoJCWf6AIzU3AvqTXbaZfg3y2xNWEFa7FK7LUKtU1f0JAuaPatnMTSE
 1qI5whpa3BPUCTzApVd6JQP2TcQ6rr0F3lINPNmMKRZZ+y2swOx1r0r7O4/7QA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DlvTLGNK
Subject: Re: [Buildroot] [PATCH] configs/bananapro: bump U-Boot to 2022.04
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 12:09:53 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> While at it add the required OpenSSL dependency.
> 
> Fixes:
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800516
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  configs/bananapro_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

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
