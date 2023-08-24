Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDED6C6FA8F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 20:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97D9E41699;
	Thu, 24 Aug 2023 20:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97D9E41699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5ti6yjjGTjw; Thu, 24 Aug 2023 20:32:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5AD54169E;
	Thu, 24 Aug 2023 20:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5AD54169E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A969F1BF27E
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8117C839C0
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8117C839C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2OONCX20qVH for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 20:32:25 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B4C7839BB
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 20:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B4C7839BB
Received: by mail.gandi.net (Postfix) with ESMTPSA id B810BC0003;
 Thu, 24 Aug 2023 20:32:21 +0000 (UTC)
Date: Thu, 24 Aug 2023 22:32:20 +0200
To: Yu Chien Peter Lin <peterlin@andestech.com>
Message-ID: <20230824223220.79999ada@windsurf>
In-Reply-To: <20230823030745.22850-1-peterlin@andestech.com>
References: <20230823030745.22850-1-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692909142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X07ekmLIxFboHfQFrRpK5TnDIjIZrFRv1SOGTP982KA=;
 b=EP81IjPdSBFWbY91YTGGQNfrrsSHaNs49i5d8Pt8PtXm5+LOLfcfosIg2axu0WQ12Yqedt
 2pzt/NMQz3lroEvMg9XtkjZSUjtims7m4v9o2tDsUXgfiItTVEkfHBQmujyGMMr0a1NSYE
 M34YBfMMgSzqAZSHAsk8KDkG0SeYJGZpgZI65/8uVv2yBne7OBgmnVZNeI40Seb4wgFaAx
 EQK4LI96U3dUSNKFhs6g/tBgOU0Uu3o0EZHmceGwmBPuoRo15UgF5rjpLmgEJdoaDJICYI
 Wsg2EHMn/OJaIjxfOF7oanx9SeHTdIjk3Ye0eMDt0s1ZdW4cBX4Yi9ONm0iBRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EP81IjPd
Subject: Re: [Buildroot] [PATCH] configs: andes_ae350_45: Update generic
 extensions
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
Cc: ycliang@andestech.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Aug 2023 11:07:45 +0800
Yu Chien Peter Lin <peterlin@andestech.com> wrote:

> As of upstream commit cbd91e89e43d600172c62fd1cbd33aa74d0a851a
> we can use the defualt BR2_riscv_g to select IMAFD extensions.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> https://patchwork.ozlabs.org/project/buildroot/patch/20230815054327.1436-1-peterlin@andestech.com/#3169699
> ---
>  configs/andes_ae350_45_defconfig | 5 -----
>  1 file changed, 5 deletions(-)

Applied to next with slightly improved commit title and commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
