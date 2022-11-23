Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A151C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 22:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F019F4196D;
	Wed, 23 Nov 2022 22:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F019F4196D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOmnwcoVXr6U; Wed, 23 Nov 2022 22:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE51D41975;
	Wed, 23 Nov 2022 22:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE51D41975
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2D631BF32A
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55F21610D2
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55F21610D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id biC76_e64tJD for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 22:20:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 813BF60BC2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 813BF60BC2
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 22:20:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B4E1C1C0003;
 Wed, 23 Nov 2022 22:20:01 +0000 (UTC)
Date: Wed, 23 Nov 2022 23:20:00 +0100
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20221123232000.6a0a9c7b@windsurf>
In-Reply-To: <20221123195815.1583545-1-chris.dimich@boundarydevices.com>
References: <20221123195815.1583545-1-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669242002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JxJqgvDw8w2VQGzhBBGEW+DbKgp4ok0YApIF4BceKgQ=;
 b=fDhUPYHM0D8sYjxCglo8h5hg+X5ao4sJ7H3TLJdVPwkPpE/m4y/+undqYaO4MG1nx/yRa2
 XR/u1/SeYj8QAe/Z7G+A7lVzjv6G+jErmHmXd5/5arCs0/70FjoKhOidijK37KJvEPd72k
 TcSha6OgQP/Y7eD8cdBtMuzuh5pBXFXnvDLIWc9yzk/RLpNrxxC3gCloUQdQZ6PR4F7j7m
 qmBC8K1mF5eY9dC1d6K9PzJAWtHTtaNfw2VZbijGUhRatAK19Ejh5bQKtiXwiqhUVMAQ1M
 Aii7VgfRu5obq+BLUo0yPkPX0NHZENJWkWb/v+q1lz3+cyaD3cfvoi1WFrhrBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fDhUPYHM
Subject: Re: [Buildroot] [PATCH 1/3] configs/nitrogen*: bump kernel revision
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Nov 2022 11:58:10 -0800
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> - Based on NXP 5.15.52-2.1.0 release.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>  configs/nitrogen6sx_defconfig | 2 +-
>  configs/nitrogen6x_defconfig  | 2 +-
>  configs/nitrogen7_defconfig   | 2 +-
>  configs/nitrogen8m_defconfig  | 2 +-
>  configs/nitrogen8mm_defconfig | 2 +-
>  configs/nitrogen8mn_defconfig | 2 +-
>  configs/nitrogen8mp_defconfig | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

All three patches applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
