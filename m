Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F90C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08A5D408A7;
	Wed,  9 Feb 2022 19:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-WHBYkzU_Ca; Wed,  9 Feb 2022 19:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 525CC402A2;
	Wed,  9 Feb 2022 19:51:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26EBD1BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14E4660B4E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtSf7ZGxRy6H for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:51:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D1FC60AEA
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:51:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5837240007;
 Wed,  9 Feb 2022 19:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644436258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58CGxcGur4Qlogpmr0hweJcG/L8/ftvbeVmRzYVsG84=;
 b=O4bfrD1T3Tl+Wi9cnOEUgxVwwk7ZimLvfGjsnTDjybkXnpuXTp1tnpsDQDi1GUBIxxoMmv
 iHeDcVyv6WoJ1KAQRZvJLufFGUJIejz3EBr7OFa7Vb7hpxHQ5ii136LjJhK8iEYHTsCdrz
 9Ms5W66R5/kIYjNYix0wxfMbrvMl6hplJ7SFhmzriMc+5ZfCDUjJWqMTHLSzkQCF8YsRSo
 XSOXbasSIAlyE4P+j3GJbmZisctd21FqWmS7q69z/fGE5TkEJTKnJ6VgOefaK+ieY2m4Ou
 M6cTj9okWSxtoitrflMpKCMGKtDfjj4PmzUGPTgscyj1QLcfPRTur4c1rR6FFg==
Date: Wed, 9 Feb 2022 20:50:57 +0100
To: <yann.morin@orange.com>
Message-ID: <20220209205057.57a6d1ce@windsurf>
In-Reply-To: <9354_1644422930_6203E712_9354_383_11_2d5b77c2a90cf722e007a5bf3ed4227d2bd1fda6.1644422916.git.yann.morin@orange.com>
References: <cover.1644422916.git.yann.morin@orange.com>
 <9354_1644422930_6203E712_9354_383_11_2d5b77c2a90cf722e007a5bf3ed4227d2bd1fda6.1644422916.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5 v2] package/pkg-cargo: allow packages to
 define download environment
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

On Wed, 9 Feb 2022 17:08:43 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Currently, the cargo infrastructure forcibly sets the package _DL_ENV
> variable, instead of appending to it, which prevents packages from
> providing their own download environment variables.
> 
> We fix that by using an append-assignment.
> 
> Note: when introduced, that variable was explicitly not documented, and
> is supposed to only be used by packages infrastructures. However, that
> variable exists, and it can be (ab)used by br2-external packages (most
> probably to ill effects, but heh!). We anyway leave it undocumented,
> like _ROOTFS_PRE_CMD_HOOKS.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
