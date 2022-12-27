Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0614EC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 863514025E;
	Tue, 27 Dec 2022 20:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 863514025E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQkVXIHx5e6J; Tue, 27 Dec 2022 20:04:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D0E540910;
	Tue, 27 Dec 2022 20:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D0E540910
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 423A91BF59F
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E73D080BFC
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E73D080BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZSffuHwTkRI for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:04:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7A7D80BDF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7A7D80BDF
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:04:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F68EFF803;
 Tue, 27 Dec 2022 20:04:18 +0000 (UTC)
Date: Tue, 27 Dec 2022 21:04:17 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221227210417.37ff544a@windsurf>
In-Reply-To: <20221227195339.86514-1-ju.o@free.fr>
References: <20221227195339.86514-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672171458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELZhfoUMi1dksCBkd1OIZeTJFiiztVHw9rjsL0J93jU=;
 b=nblxZprcXpM36hNP4YcN/1cOq1TLLR9WcvVeBVcio5b2WRLw7ci+YpZIgF23SrkueFLOYP
 RHOkH2TaQ7fdr+tu3cFE8qlVGIEMqNe2FLRL1DJzq6RNkzioDRBhFJVmPYiKw7aMd4Sp0M
 bMmsC/XHZJStH4wohV9JDEZjYBDymgQdud6VWGtNZ85P5XNhyMms29gnRMmI4RU/lNcUL1
 nWNirXlZdge2BS4hrJKlCWF+wUlroZKXefNQkGne7HXuVTq4v2FsnJIxfhwN0UA54OgujF
 Uy4tk2z0XasqUzIJA+kQ8jmuoHgQN2mrCiT/55nXPRkfgcUY2t7VnrWYNEgjXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nblxZprc
Subject: Re: [Buildroot] [PATCH 1/1] package/fmlib: fix build for ppc e500mc
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 27 Dec 2022 20:53:39 +0100
Julien Olivain <ju.o@free.fr> wrote:

> When BR2_powerpc_e500mc=y, fmlib package compilation fails with output:
> 
>     make[2]: *** No rule to make target 'libfm-e500mc.a'.  Stop.
> 
> The fmlib package "make help" command shows:
> 
>     The available make libfm-<arch>.a targets are:
> 	    libfm-ppce500mc.a		(P2, P3, P4)
>     ...
> 
> The package Config.in incorrectly sets BR2_PACKAGE_FMLIB_ARCHTYPE
> to "e500mc", which is then passed as the package make target.
> The correct value should be "ppce500mc".
> 
> The commit fixes this build issue.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/fmlib/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
