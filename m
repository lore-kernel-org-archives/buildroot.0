Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6377EEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10B604062B;
	Wed, 12 Jul 2023 19:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B604062B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bjZubqgEmeH; Wed, 12 Jul 2023 19:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2B2A4195A;
	Wed, 12 Jul 2023 19:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B2A4195A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 049E81BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD2DA83A9C
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD2DA83A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XiaFXFOfoJiE for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:29:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFAA882BF4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFAA882BF4
 for <buildroot@busybox.net>; Wed, 12 Jul 2023 19:29:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54C1E240002;
 Wed, 12 Jul 2023 19:29:15 +0000 (UTC)
Date: Wed, 12 Jul 2023 21:29:14 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230712212914.6ee4ab6d@windsurf>
In-Reply-To: <20230609162018.1231615-1-francois.perrad@gadz.org>
References: <20230609162018.1231615-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689190156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvtvcvHxoq2I9VSVbauiJNGLTCGnoCN+DJOawZhzVjI=;
 b=Yax650Le5e9NYKDauNm1FbxMkvAfx0o/qUEcGprtoeR6h1laZD+vOaDCjkY6nbJox8Pddo
 9XThZQtnNLzraSeIZmpYruIHppgv5E4zBsxJTWkwgpjdB+EpZuMK5kd4N7YxTOjp2jq4rf
 FcUxQU7+Hal8ODuu63SPbjG+t3sWayOeBg6xK7rvCh5c+IvdFVwkURpq7Zwt+lzBXm53Em
 bLu18EXQc/jZ58Mz1xmUbd/mnAxrB6CiovADmIRYW42FzdvKAjqRp3lCyik6lktr4WYUwt
 Mq3nWni79TgueYcQQrt+ABvlOX0JE7SbDpnJKNiMtfCBoBu+be5Ifq0HBvVbMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yax650Le
Subject: Re: [Buildroot] [PATCH 1/8] package/perl-data-optlist: bump to
 version 0.114
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

On Fri,  9 Jun 2023 18:20:11 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-data-optlist/perl-data-optlist.hash | 6 +++---
>  package/perl-data-optlist/perl-data-optlist.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

I've applied to master patches 1, 2, 3 and 6 of this series. I've
marked patches 4, 5, 7 and 8 as Superseded as we already applied
similar patches doing the same version bumps.

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
