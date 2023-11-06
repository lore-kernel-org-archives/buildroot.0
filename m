Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15638C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF65741FA3;
	Mon,  6 Nov 2023 21:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF65741FA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aC_QpI6eDPpB; Mon,  6 Nov 2023 21:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBF1941FCA;
	Mon,  6 Nov 2023 21:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBF1941FCA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 665DA1BF947
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D686401CC
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D686401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tysSMYeKYJbq for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:50:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3D7A4014E
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3D7A4014E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 382EDFF80D;
 Mon,  6 Nov 2023 21:50:31 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:50:30 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106225030.56153ec0@windsurf>
In-Reply-To: <20231105195825.1076285-1-fontaine.fabrice@gmail.com>
References: <20231105195825.1076285-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699307431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJzUgNk9szhKQT3kBT4al2c564Bxth4V3sjMvrinLx4=;
 b=QeF4whjrfQ7bLstv3kkdhOwT48y+3BcM4jYIx2z8viNdhXmJ6n66aWxuPHV5nLn/1FJrUJ
 hy2RRzFGClhWVCVac1FVupcjwykEqSpUJK/oXI5BYEeNgQcBHR57vXf7Li2HmBs4zTGpCH
 JKWqub1QLO3BCO4PH5uQiILV+L8DPoK2IZoCpXt4bdyj186qxerooQzu0m5U8RUKjPup/U
 htNZZD3oXP1zqxENNgL7NBgs5QAFYLWDf4yakaYuDg/seNZ48VhkpCZYPwnse3uxHuFGMa
 jNJY8d1MlOt2vBFPK9UlwevElIo/Q2Im9t+XHo6g/zEuo3egWLm1k8xmz9mLrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QeF4whjr
Subject: Re: [Buildroot] [PATCH 1/1] package/nmap: bump to version 7.94
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

On Sun,  5 Nov 2023 20:58:25 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of license file:
> Updated the Nmap Public Source License (NPSL) to Version 0.95. This just
> clarifies that the derivative works definition and all other license
> clauses only apply to parties who choose to accept the license in return
> for the special rights granted (such as Nmap redistribution rights). If
> a party can do everything they need to using copyright provisions
> outside of this license such as fair use, we support that and aren't
> trying to claim any control over their work. Versions of Nmap released
> under previous versions of the NPSL may also be used under the NPSL 0.95
> terms.
> 
> https://nmap.org/changelog#7.94
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nmap/nmap.hash | 6 +++---
>  package/nmap/nmap.mk   | 2 +-
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
