Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452CCC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 13:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCF8440E46;
	Sun, 19 Mar 2023 13:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCF8440E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZcMShTtEVIi; Sun, 19 Mar 2023 13:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91E91414C2;
	Sun, 19 Mar 2023 13:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91E91414C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E578C1BF577
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 13:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC41481B7B
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 13:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC41481B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8m1aAuh-Z6w8 for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 13:51:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A8D981B70
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A8D981B70
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 13:51:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D0F6D20003;
 Sun, 19 Mar 2023 13:51:33 +0000 (UTC)
Date: Sun, 19 Mar 2023 14:51:32 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230319145132.4c349769@windsurf>
In-Reply-To: <VI1P190MB049333A9311E7A4ECAE13B7A9FBC9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB049333A9311E7A4ECAE13B7A9FBC9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679233894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqhI1ll+/heDIO+jlYFdlRqTe4/U7TwUvrqC2eKdpFM=;
 b=Ebjp4JeMWFQEvHHYTcSjI076D+sBGSGvsT7QnwxZ+8fjQlqecSXBTM19RLhmlg67BhmEwi
 HitBcoaqGd+jkTobHLMpp1DJgfpWu0Zhn5OBeOj4Qq8k1j4b3z+oKt+lWLwNJc8VMscwHw
 E54+X1CFMgTOABnZlaDMqReIpC0erj5b0s5FZYa56V+3FUwrgm/UidbNsAJ1Pje3wLBTL7
 RHSIMhCfb0ebQTk07FsgrhojG+pH3Td+vCNwYj+nP9SovxmyeHnV/Q0o6TKGLc5LMe2M3S
 ySMTIHw+IStDncsCQ/EjhoLclY3USOADr+2F6t57MFmi/v/G4Rfb/DgW2ZapHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ebjp4JeM
Subject: Re: [Buildroot] [PATCH 2/2] package/bluez5_utils: fix SysV init
 script
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
Cc: Lang Daniel <d.lang@abatec.at>, "marcin@bis.org.pl" <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 16 Mar 2023 13:53:14 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> - Use daemon name (bluetoothd) as file name.
> - Script doesn't need to be executable.
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/bluez5_utils/{S40bluetooth => S40bluetoothd} | 0
>  package/bluez5_utils/bluez5_utils.mk                 | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/bluez5_utils/{S40bluetooth => S40bluetoothd} (100%)
>  mode change 100755 => 100644

Applied to master, thanks. I have also updated .checkpackageignore to
no longer ignore the warnings that were caused by S40bluetooth.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
