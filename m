Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0C0C6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 17:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB8C160B2E;
	Sun, 12 Mar 2023 17:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB8C160B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVBOT1-zHwDR; Sun, 12 Mar 2023 17:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04F0760AFE;
	Sun, 12 Mar 2023 17:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04F0760AFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD6801BF574
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 17:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 797C4415ED
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 17:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 797C4415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vfMGlX_rnddk for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 17:44:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E53C5415E7
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E53C5415E7
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 17:44:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 38990240007;
 Sun, 12 Mar 2023 17:44:39 +0000 (UTC)
Date: Sun, 12 Mar 2023 18:44:38 +0100
To: Casey Reeves <casey@xogium.me>
Message-ID: <20230312184438.6265163d@windsurf>
In-Reply-To: <20230226113307.4088933-1-casey@xogium.me>
References: <20230226113307.4088933-1-casey@xogium.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678643079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kSwDvILvTZW53MOrlr70ozlcdMML2Lpj5Sj1MaM2PCw=;
 b=HpSj6/W9CHCimF4Ewg2uMdCZh2o5kbkqd87MG72DxSYz4haJHg+lICqXWioQgw42Ftmwn2
 p5IcqHO4UTvCbnf5H5r4v2cNa0nONmTDfTtda7KSilWIX3TRV3nMWhXMCVLhXX2AJZaldv
 1y6dyWRACzhqt4EKGvM15GdnBjH9sMn8MQcIEc8PLdJG5UZ+2J+95ZuD/wnDZQpbSq3Zmk
 SrbNjdeVJJ3DeAd/bzWLMbyjGqOj9zsPqgw+DE0lzjlb/ENn4+dhoGQ/bloImJw98FAjHI
 X8EuTQC/sRGYY4xhRvXeqKE7s1rmOM0ifTLyjlwYAEAh+/QCASGls9ZR3xNmoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HpSj6/W9
Subject: Re: [Buildroot] [PATCH v3] package/lzop: bump to version 1.04
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

Hello,

On Sun, 26 Feb 2023 12:33:08 +0100
Casey Reeves <casey@xogium.me> wrote:

> +LZOP_LIBTOOL_PATCH=NO

Spaces needed around = sign.

> +define LZOP_LIBTOOL_FIXUP
> +	patch -i support/libtool/buildroot-libtool-v2.4.4.patch $(@D)/autoconf/ltmain.sh
> +endef
> +
> +LZOP_POST_PATCH_HOOKS += LZOP_LIBTOOL_FIXUP

Even though admittedly the libtool fixup is probably not that needed
for the host package, the host-autotools-package infra normally applies
the libtool fixup as well. So I've added:

HOST_LZOP_POST_PATCH_HOOKS += LZOP_LIBTOOL_FIXUP

I've also added a small comment above this to explain why we're doing
the libtool fixup manually.

Applied to next with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
