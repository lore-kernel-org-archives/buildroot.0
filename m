Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF82FA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18D17403BF;
	Sun, 30 Oct 2022 11:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18D17403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzA7MT21t7ET; Sun, 30 Oct 2022 11:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4222940359;
	Sun, 30 Oct 2022 11:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4222940359
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4FEB1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C7EC403D8
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C7EC403D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omf8jFJ5EPaG for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:06:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 722C44035A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 722C44035A
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:06:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4223C60002;
 Sun, 30 Oct 2022 11:06:25 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:06:24 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030120624.35ea91b8@windsurf>
In-Reply-To: <20221029172215.1437796-1-james.hilliard1@gmail.com>
References: <20221029172215.1437796-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667127986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0s3wEwqDZSGGlez9JfKsqOPtT2pmcThbcFJ485tNRVU=;
 b=gsWPxpPLwbq9XvxjZXHVKThqDUb405Zkb8zPF3WnGOSeKAwP6jackEUmop2LLHRMJd+Gp2
 nPJ7DuL+QaORDVzchZL9iokJNWTQxWqtv6Bn7sJTu/bhcVvFxO2GkhGcJQVAL7ZuoH8Lvl
 rlZDfe1ob6g1eKxYJ+0A1GwYIkDPJYtTfej/2A+u2qNVDRHx0Xij4M8NVtJ4USGBuOoVJD
 BpOoY4J5NsmD2t6o65QJ0D20C5Wf3+AT/00QJsvEQztKGIM34EI/VD+2vwlONgxUXxFG8O
 RVnf3D56huSQ0v7t21E5kzRYvEnXECfe/zg/BbnuFwtLtLDi2zYFXPXEAhk1qA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gsWPxpPL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-wsaccel: bump to version
 0.6.4
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Oct 2022 11:22:15 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-wsaccel/python-wsaccel.hash | 4 ++--
>  package/python-wsaccel/python-wsaccel.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
