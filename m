Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE8CC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A106C435B1;
	Mon,  1 Jan 2024 21:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A106C435B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahmGJ1ERUkWw; Mon,  1 Jan 2024 21:21:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9E8543662;
	Mon,  1 Jan 2024 21:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9E8543662
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9A291BF3F0
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 055F44185E
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 055F44185E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJp5G3ikv317 for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:06:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86F4E418EB
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86F4E418EB
Received: by mail.gandi.net (Postfix) with ESMTPSA id A575FE0002;
 Mon,  1 Jan 2024 21:06:52 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:06:52 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101220652.5b7a07ef@windsurf>
In-Reply-To: <20231230181829.1014195-1-fontaine.fabrice@gmail.com>
References: <20231230181829.1014195-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q7TV2fBuOUj6j8trefH+XOs8tahIrJWgfsFK4Wp+Vos=;
 b=S/cR27u8oDJ3CxyUrf5yDLonDIi/ZaW2wixXoy7Qe5TPG3XWK6XtCphiL1CRpjozTy3uAx
 QZe2IKWc+APzBILxqCGJOH06BrcpNhz8Abn+kCOvOATf+vo74BruUMwZE3l4xg7ajBgaF7
 EHXJI5TfL7m4O93MSuTzA+MAvnnPAjBGArCflqAYzDaRV+D6NmUaQBoxL5/mOBHkJPbYo3
 1ChhDly2OYpPeRquJj1wDe+qGXe0+dxcABDQ3YkR+WIUJY2H3irMSep1i065nKL1CQ91p8
 EEAnqsL4l1PJ1q8M84pX5pAskJ/lYEs4p/kmgpfXrND8Dggzcf9MEhQkjNfHfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S/cR27u8
Subject: Re: [Buildroot] [PATCH 1/1] package/autofs: bump to version 5.1.9
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 19:18:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/tree/CHANGELOG?h=release_5_1_9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/autofs/autofs.hash | 2 +-
>  package/autofs/autofs.mk   | 2 +-
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
