Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F57CC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 11:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F5D141B6F;
	Fri, 29 Jul 2022 11:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F5D141B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIqWTKkfnibo; Fri, 29 Jul 2022 11:22:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4606241B5D;
	Fri, 29 Jul 2022 11:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4606241B5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50D181BF279
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8BAE41B5D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8BAE41B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78V-xbPJvTkQ for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 11:22:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C2DA41B53
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C2DA41B53
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 11:22:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 186731BF20C;
 Fri, 29 Jul 2022 11:22:07 +0000 (UTC)
Date: Fri, 29 Jul 2022 13:22:06 +0200
To: Bartosz Bilas <b.bilas@grinn-global.com>
Message-ID: <20220729132206.58c779f0@windsurf>
In-Reply-To: <4e6429ba-40cf-3c2d-1e75-0a9e1edd0c6e@grinn-global.com>
References: <20220729111229.4acffff8@windsurf>
 <4e6429ba-40cf-3c2d-1e75-0a9e1edd0c6e@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659093728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cL0PPiOn+u5pmDOGBoY4npB34BAbuz9VPwr5gMqKTkk=;
 b=IY4YmCyRdTEn2CLPWmP3Tsli3teJS0unN5ersL/GZ4wDaByHUlp8Kl67YaG6rb+LRKikGB
 A8rKTshgP9YaixbmKDlHeziUl0Lvr7OX5nlXL/HUqRreDQMNBVl9VTsFPrAVw3fEByc9tQ
 +b1Z5bfGw/mJrxEJywPdOV/ZL15Cg8qpcal1Lcnmg9RKB5wYG391gOp365ccc+EggQNM1C
 KiOer6TxI4Ncuxa6J4CmZVQCRmiDB8wV9bNKNICwaMoIcGruXxKzDOFvoAOocSWzxIbC0p
 3w+JsXDRBWcgzVRGKYQG9gVM4qanBepin8qZYPpoAcaxhcxgYgu4qb4C09PhIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IY4YmCyR
Subject: Re: [Buildroot] Help to fix your Buildroot defconfigs
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 12:15:07 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> > bananapro_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800516  
> 
> here you go
> 
> https://patchwork.ozlabs.org/project/buildroot/patch/20220729100953.968434-1-b.bilas@grinn-global.com/

Wonderful, patch applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
