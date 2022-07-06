Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD843C43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84AE481AF3;
	Wed,  6 Jul 2022 21:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84AE481AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1tQ6jl5xKyw; Wed,  6 Jul 2022 21:14:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CA0581A34;
	Wed,  6 Jul 2022 21:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CA0581A34
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88E071BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70F3660FAE
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70F3660FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MstnsC4qsXBT for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:14:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A147600CA
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A147600CA
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:14:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 83A6EE0007;
 Wed,  6 Jul 2022 21:14:15 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:14:14 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220706231414.7586a654@windsurf>
In-Reply-To: <20220630220248.730937-1-fontaine.fabrice@gmail.com>
References: <20220630220248.730937-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657142055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NO40Jkox0tFYO34GsNkWri2dXJwXLo5ZgsqCpqvDSeA=;
 b=Ia3hM9fzg7DXh5SnV4SL/Ccc/hdwvuiQCVb8hniQJ8WR5tbNaByIRTuiPbs7o9kZ+31imU
 5aSwXH1iSswZ5CjcyfIfev/AWZUmg/MoZekSW7dl0cPaWNtMtFfTnmb0qD/8HCc1ikm7dH
 6Tp2U52SlzdjrlB6oKq3L1oXyv7YHKfkFZUm9Jt1BsnBX06n5ivpw8is2MLADtdjTtIJNP
 2mnMqGdnYxK+RkN0Rv/fThdOdKB+VrH//Nspex1NhJw6vzLNwCJAj/9PaR3BCGaqr+qVl0
 48mMK96hjE34a2v7pvI2t0kmLoEjDcqruL85gTLOIhFE8LwjHJOy4L1r/w7llQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ia3hM9fz
Subject: Re: [Buildroot] [PATCH 1/1] package/isl: bump to version 0.24
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

On Fri,  1 Jul 2022 00:02:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://repo.or.cz/isl.git/blob/3ea3e8b77475bea49b35b8215d8f66af94121b3c:/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/isl/isl.hash | 2 +-
>  package/isl/isl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
