Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C780AC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 09:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E3F84023B;
	Fri, 31 May 2024 09:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aR_ZSgSRUkBf; Fri, 31 May 2024 09:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D2FA40433
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D2FA40433;
	Fri, 31 May 2024 09:45:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCC7F1D502A
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6A2C40433
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-qEfIo_EGHk for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 09:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 560824023B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 560824023B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 560824023B
 for <buildroot@buildroot.org>; Fri, 31 May 2024 09:44:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E3AB1C0009;
 Fri, 31 May 2024 09:44:54 +0000 (UTC)
Date: Fri, 31 May 2024 11:44:53 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240531114453.59ccda1a@windsurf>
In-Reply-To: <ZkwwN1NKZ2o1xMba@landeda>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
 <CAOf5uwkDmcxhWJUFhxjw_GJTiTEO5oEexb0Xjh6aNJx+K_9dXA@mail.gmail.com>
 <ZkwwN1NKZ2o1xMba@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1717148695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wPMdHVLkfYSpjei1bTmzSsNhlOOBOGpg3DioCHZu1gk=;
 b=aiWKS0OEhHO83cRvZ7ZM+8tT8Vu/jo8xplNNIrcq5XJLz4vh5DlY2wVebHxeepTRnlvGMy
 DhYpI0r9KrNSnirijHpfOsztxyYp12rrgMRIN6DP2qYnR/uf/RMPRVVJVCn5rcjeEdQbC6
 xsocawhUTCNcfDnZF/p8F0+XaawBKtLZ3XLWaCuyx2qOfTqIV1eB8pLwToDAeew1Um7SEM
 4OXOVOQBhDcZYT6x7vQg9rTRCi3oPrzusVQeKsDwVHH7cOiLCbHIwSPv+5EEk5tMCnpfHH
 CaUPtncB6z6CLXYS04ZYesCXJ9SkhXW4+gw5UgDuqYDOm4L12f0CqHAQIYP/xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aiWKS0OE
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Xuanhao Shi <X15000177@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 May 2024 07:25:11 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > Arnout, Yann, Peter, Romain, what do you think? Do you see other
> > approaches to easily allow generating bmap-compatible images?  
> 
> I wonder if we should really do that, in fact.
> 
> I believe it is in-scope that we do generate disk images, which we do
> with genimage. However, transferring, distributing, writing, etc.. the
> generated images I think is out of scope. We may provide tools to help
> with that, though, and we do by providing {host-,}bmap-tools.

I think it is in the scope of Buildroot to have defconfigs that
generate images that are fast to flash.

> I think the question by Thomas was whether, given an input sparse file,
> genimage will keep the generated image sparse in the same places the
> input file was (only shifted by the offset that input file was copied
> at in the image).
> 
> For example, mkfs.ext can create sparse files, and such a file can be
> fed to genimage, to create a disk image. We want the generated disk
> image to be sparsed in the same positions the ext2 image was, e.g. with
> 'X' as no-hole blocks, '.' as holes, and 'B' as the bootloader:
> 
>   rootfs.ext2        XXXXX........XXX...XXXX....XXXXX........X....
>   disk.img       BBBBXXXXX........XXX...XXXX....XXXXX........X....
> 
> Note that some X block can be all-zeroes, because they are the bitmap of
> the filesystem; those must not be skipped when writing to the final
> storage, otherwise the filesystem would be corrupted. If genimage
> decides that all-zeroes block are sparsed, then this is broken.
> 
> I think that was the question raised by Thomas, and I don't understand
> how your reply answers that, so maybe I missed something...

This was exactly my question, indeed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
