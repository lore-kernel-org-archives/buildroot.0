Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89317C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 12:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 170A881464;
	Fri, 22 Jul 2022 12:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 170A881464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9NG97MAlpZj; Fri, 22 Jul 2022 12:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C68813D3;
	Fri, 22 Jul 2022 12:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5C68813D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA601BF2FA
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 12:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E76EF4236B
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 12:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E76EF4236B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDHVY6hydgZs for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 12:47:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4010D42365
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4010D42365
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 12:47:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1A4E41C000D;
 Fri, 22 Jul 2022 12:47:33 +0000 (UTC)
Date: Fri, 22 Jul 2022 14:47:33 +0200
To: John Keeping <john@metanate.com>
Message-ID: <20220722144733.50446ab3@windsurf>
In-Reply-To: <20220722110103.4068083-1-john@metanate.com>
References: <20220722110103.4068083-1-john@metanate.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658494054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5N499nddqzjFYJVKpmQnc0KalrgxyDfIDNJ4e1WVo4E=;
 b=ZTSyLIsa/ZuulXGTctdebT+tlAqeRQ6OhlTgnTu8xR6nZh/pcYIPXpnOmsEPSqFq5NDzVE
 jNSlqrxpsMHVWeSA4ibx1HFIPfUsOcqVOKYzQ6oCdK37ddPXuKd2G1WC/qFJjv5WHHEqID
 cDAaOOk+6ntvnt0HIyBooc/2E+Tm2YohsnnyvUoDf5UPPzPleDEkHSF9V0dlZ94Ln66oaW
 +QVkx2H1edLqk+LmihNpLD7JyZZ8zCYIaudEGNruXNLk80+zmT6qpeqKAPU/t89i6OZj0J
 SsZpfZWdmYdka6cTmnRpFYXZdXxFGV+TK7C5UCYGZk61G/Gdignc6+DpSDeFJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZTSyLIsa
Subject: Re: [Buildroot] [PATCH] package/fscryptctl: bump to v1.0.0
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

Hello John,

On Fri, 22 Jul 2022 12:01:03 +0100
John Keeping <john@metanate.com> wrote:

> -FSCRYPTCTL_VERSION = f037dcf4354ce8f25d0f371b58dfe7a7ac27576f
> +FSCRYPTCTL_VERSION = v1.0.0
>  FSCRYPTCTL_SITE = $(call github,google,fscryptctl,$(FSCRYPTCTL_VERSION))

Thanks a lot!

However, we want this to look like this:

 FSCRYPTCTL_VERSION = 1.0.0
 FSCRYPTCTL_SITE = $(call github,google,fscryptctl,v$(FSCRYPTCTL_VERSION))

This allows the version field to properly match against values reported
by release-monitoring.org, thanks to not having the "v" prefix.

This will need an update in the hash file, of course, as the tarball
name will also be without the "v".

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
