Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7329DC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4451409B1;
	Tue, 23 Aug 2022 19:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4451409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZOvZS6FdPaC6; Tue, 23 Aug 2022 19:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD74240980;
	Tue, 23 Aug 2022 19:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD74240980
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 705731BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B80D81AA7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B80D81AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncNLvHATsHVz for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:52:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A84C281A73
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A84C281A73
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 19:52:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 07229240003;
 Tue, 23 Aug 2022 19:52:28 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:52:18 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220823215218.25bb3fc9@windsurf>
In-Reply-To: <20220822182653.1691347-1-francois.perrad@gadz.org>
References: <20220822182653.1691347-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661284349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Se9X2tBYab1w9G/bNCTj1b0FvDaIImhaKIwT41Nb7kk=;
 b=dCLoVNA28oo8oDqfIvMEOuBl0y/sSu8EhRFD2hw8vpzlYpSjxhp4FGXEtYSnWsBfpuNHkx
 +cHDE6uPh8Pkz42owncYDb5tnltuAEbHpCOxxrOq9H6Q3SIc69aG69TihYSHSAcgQyLwSq
 M7bh6aLH8Y7LacR0S5DletuBVWO/9ilaKgCvztS641PW8L0x/GZfxOuPtZS7NHZxsk4H4C
 GasMK0akPqoBypoQt8fzH9DnLYONbqmjAEw9WGDuy05qlprCAg/FWFdbsK0Tqv7Tg/Hwsu
 +/54ReTbJmkkF0Sh3SkQB6jY3h4ifbmDCnCHG+ZdTUFAx3Qfcgk+lV3sLrVTaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dCLoVNA2
Subject: Re: [Buildroot] [PATCH] package/open62541: bump to version 1.3.3
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

On Mon, 22 Aug 2022 20:26:53 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/open62541/open62541.hash | 2 +-
>  package/open62541/open62541.mk   | 2 +-
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
