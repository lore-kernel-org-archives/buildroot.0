Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0046ECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 763304049E;
	Mon, 29 Aug 2022 20:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 763304049E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-_tdvN4BO_C; Mon, 29 Aug 2022 20:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F2E84048C;
	Mon, 29 Aug 2022 20:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F2E84048C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F22AF1BF3D9
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCB318125B
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCB318125B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id poLWDrPRBdEH for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:18:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C300A8138E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C300A8138E
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:18:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 625D0240002;
 Mon, 29 Aug 2022 20:18:47 +0000 (UTC)
Date: Mon, 29 Aug 2022 22:18:45 +0200
To: Sven Oliver Moll <buildroot@svol.li>
Message-ID: <20220829221845.135645e7@windsurf>
In-Reply-To: <alpine.DEB.2.20.2208291701140.18923@defender.svolli.xa>
References: <alpine.DEB.2.20.2208291701140.18923@defender.svolli.xa>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661804327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xm8LzhOlvL6D5ESdZixUPHY+lJOCrI1E6T41PxehP3s=;
 b=O9GZQpRCkH7s3K63sEl53P00hyIksbPTuxCvImB6SY5720IDoqVON+Ud3oZUKJVwvsrIJO
 Vd4lxsOILUzgzfi5/2oyI0g4kjt8eJI+SKrwIB8d365b6NkigaAtfJ2+4x1QvMr6EEEYND
 4vfZUhkeXf6nmxrZh5NN9hX26DdXJup9qsdilgpGsiski+4oQwiacy6hr2kyJiTV/KED4r
 F0YmAOB+dCfpXdOgGBNP77rOopXBN3+j760biAXjDPEkAEgxbFWX/1bKK0UboM14G3DG5s
 mL0tJD7mtonauTqjdqIwJw/csG0B81WbOuU7rkvCNUh6yr6sb0NJ0dq5yaOGeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O9GZQpRC
Subject: Re: [Buildroot] [PATCH 1/1] package/most: bump version to 5.2.0
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

On Mon, 29 Aug 2022 17:14:22 +0200 (CEST)
Sven Oliver Moll <buildroot@svol.li> wrote:

> Signed-off-by: Sven Oliver Moll <svolli@svolli.de>
> ---
>   package/most/most.hash | 4 ++--
>   package/most/most.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)

Thanks Sven for your patch, which I have applied to our next branch.
However, there were two issues with it:

 - First it was mangled by your e-mail client. Please use "git
   send-email" to send your patches so that they are properly sent with
   no modifications. I have hand applied the patch to address this.

 - The COPYRIGHT file has changed between 5.1.0 and 5.2.0, causing
   "make legal-info" to fail, as it verifies the hash of the license
   files. I have verified what the change was: just a copyright year
   change, so I updated the commit log with this information, and fixed
   up the .hash file.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
