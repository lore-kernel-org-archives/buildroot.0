Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA949C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64F2541190;
	Wed, 22 Feb 2023 14:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64F2541190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHZSstuey2Dg; Wed, 22 Feb 2023 14:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1C2D41199;
	Wed, 22 Feb 2023 14:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1C2D41199
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 223571BF589
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A8D641190
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A8D641190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnhcrGt6eynl for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:58:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBD00414ED
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBD00414ED
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:58:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD51AC000A;
 Wed, 22 Feb 2023 14:58:03 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:58:03 +0100
To: Diego Hurtado de Mendoza <diego.hdmp@gmail.com>
Message-ID: <20230222155803.3789d84b@windsurf>
In-Reply-To: <20230222094916.1853413-1-diego.hdmp@gmail.com>
References: <20230222094916.1853413-1-diego.hdmp@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677077884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvBZ6opkjdLn5j+i7POPtWmdQkr3dtRI9qx4+nrPBE0=;
 b=hDA7YbBQuI6ewDZwG/Fs4sxAo8lJ2iEf6fIeOFNt6Aa/BAtFLbxDgCL/zIwL6qGtajDZGc
 vSNklyFDKdlhejsLMRwsn66IYpWSg45EC3HgGhvEorYoGOrPXcK8/MXluetNcP2e2CjPKT
 8uNBD0WIivv0P7wypAt63XcG3xvDrjGfYi5ZmCQmBfPH1gNUQyv/6BmCp4QT56a8/bYSfo
 I4Az/sUtQ9QhK16fUZJ/8htrQhwQDaCPY/IM1fEmcLikK461Avr6p09afKl5wfUoLKK906
 1do/LwFk539nuWwoQ9kt2RCWyJekb4jKWARB69VxVbuaVuXLV4ZnzqYIwdd5sw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hDA7YbBQ
Subject: Re: [Buildroot] [PATCH 1/1] package/hackrf: bump to version
 2023.01.1
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

On Wed, 22 Feb 2023 10:49:16 +0100
Diego Hurtado de Mendoza <diego.hdmp@gmail.com> wrote:

> https://github.com/greatscottgadgets/hackrf/releases/tag/v2023.01.1
> 
> Signed-off-by: Diego Hurtado de Mendoza <diego.hdmp@gmail.com>
> ---
>  package/hackrf/hackrf.hash | 2 +-
>  package/hackrf/hackrf.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
