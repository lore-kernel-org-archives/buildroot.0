Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FFBC4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC35440263;
	Wed, 23 Nov 2022 21:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC35440263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70Yzrk_BnduL; Wed, 23 Nov 2022 21:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EBBA41717;
	Wed, 23 Nov 2022 21:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EBBA41717
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EFC41BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A617820C0
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A617820C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rl70dqDvANjp for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:58:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 228CD81EE8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 228CD81EE8
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:58:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9DAA51BF206;
 Wed, 23 Nov 2022 21:58:09 +0000 (UTC)
Date: Wed, 23 Nov 2022 22:58:08 +0100
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20221123225808.34173b95@windsurf>
In-Reply-To: <20221123195304.1582783-3-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
 <20221123195304.1582783-3-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669240690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QR4KD8vSk+nq/8pXKPMuUDBRg/qz8W25ndqO+7876R4=;
 b=HTLiUe1gUBG331QUkG1EY+S8B+35EnOtjX88CWi+sORIm6NMcPAsqN7TEXUoVAn9o9A9sV
 vt8U42GKq0UhzIw7W65B0aX+55HkU+59fMkReYDo8HFf7U+2MjN/nqiflSZMfD6cC9nWbF
 t4GwVGNyW+6lyatix6V6I2ehiB9k33P2vWVJGPhkK2RPIa5Jj1gcAK+/m7aBAPq/u4oS+O
 EXV7zSscS9CNfxsdsFxANx3HymZPZiSwCJYWWMq+0jLMY0pHxBSL7CFoZrJyjwYpwNLhP2
 D/Tzzd8EMvYPBhttqEusp5APsjsXds2/4CiiLMEEZq2/CPxb9rt3PIy5c4nnlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HTLiUe1g
Subject: Re: [Buildroot] [PATCH 3/7] package/freescale-imx/imx-gpu-viv: bump
 to version 6.4.3.p4.4
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

On Wed, 23 Nov 2022 11:52:53 -0800
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> - To match NXP 5.15.52-2.1.0 release.
> - EULA/COPYING: update to LA_OPT_NXP_Software_License v39.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
