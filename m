Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AB8C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF263400F4;
	Thu, 11 Aug 2022 20:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF263400F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id isEmrbP9TJNP; Thu, 11 Aug 2022 20:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A27FF41820;
	Thu, 11 Aug 2022 20:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A27FF41820
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC4B1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E7444013B
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E7444013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Quv5yCse-8z3 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:38:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 460D3400E2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 460D3400E2
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:38:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0781D240003;
 Thu, 11 Aug 2022 20:37:57 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:37:56 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, nolange79@gmail.com
Message-ID: <20220811223756.59668ba8@windsurf>
In-Reply-To: <20220801185444.0f41358e@windsurf>
References: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
 <20220801185444.0f41358e@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660250278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5BmA5kOXLcnbOrcTzr8aGHLZooWFbQ3hUBx4Ui6G68=;
 b=I296Ezzv55T3n7S0u8ZoUVsR10emF4gF8M0DUHz/+2vQrClzj+Eoi/OUk5LMc3ixfssV+k
 111Sb9EuwX+rQY31+dF2O6IeML6A3ezBnXd7DqAc1BK4FZH2SSyKuctjCF4X/XlrxTGR4t
 ClqXu4yHTfrO15f/62FLMyQR6h9y50KPK9RCMuOgpP4jkhFooymTDgHeMF4micWeBSMgff
 eyUsbHUXfhSf5//Che7g55gNnO86RZinSsQzrfyxV3EEDHHIM9tGOSHU6x/gIvS0OsDkmk
 +Vf0+7qAi86z9mTBEkviLJho/7oFWB86w5thTfGmX/2HSXKb+2APhC2PxNqNfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I296Ezzv
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pkg-autotools: fix runtime path
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 1 Aug 2022 18:54:44 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> I am afraid this is causing some other problems:
> 
>   http://autobuild.buildroot.net/results/c6f/c6fa72802a3d74fe95720eeff836514a5863b3f2/build-end.log
> 
> configure: warning: runstatedir=/run: invalid host type
> loading site script /dev/null
> creating cache ./config.cache
> configure: error: can only configure for one host and one target at a time
> 
> So I believe we will have to revert this patch, and pass --runstatedir
> individually to those packages that understand this option.

Another package exhibiting the same issue:

  http://autobuild.buildroot.net/results/391/391871b766ba0c1aeef8ff2d4daad8f4204f86ad/build-end.log

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
