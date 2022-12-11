Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85738C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A59B4092D;
	Sun, 11 Dec 2022 10:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A59B4092D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_t7mREzmwLf; Sun, 11 Dec 2022 10:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16E7A408F5;
	Sun, 11 Dec 2022 10:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16E7A408F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7C01BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFDC481496
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFDC481496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9EmLD1ybxrY for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:39:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2BEE81495
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2BEE81495
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:39:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8BFA660002;
 Sun, 11 Dec 2022 10:39:03 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:39:02 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211113902.566f52c4@windsurf>
In-Reply-To: <20221208223153.4189684-1-christian@paral.in>
References: <20221208223153.4189684-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670755144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ASMffprlKsHSUC6aS10TPVEEa6UjUUtDYBxxf0iFB68=;
 b=JwNw6tHlSfXQEFy4MPDGlwhRZHCXiH/Wf9xZ0RC+zz04OvLUJK1PtRfWjNrDlaXA+j81S8
 lrHVV3RkXDnftRvAOFQ8iLBSq0EGdlNquEW0P8rlQ9gxIVASz7CgkW8V5/sYHmPy0HPbuZ
 /L0r0NRhpTCoAUVtrWpW02FNfGIEEYeX3q2JI5oZ9HoER0ytMsbXwhcQSK2iiKuhAwgGZ7
 iop9QhSCcyxiCE0VuSaREL0AAxHg5TfufKul3zPvFduMy7hvkD8ej88YBoOrc4H3A+OkWF
 CKy1ZjQAmD4gNzaOwbAyCNiIew4594kVHZCfIL9+2ZfBVhmBxzu9auS3WigrzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JwNw6tHl
Subject: Re: [Buildroot] [PATCH 1/1] package/moby-buildkit: security bump to
 version 0.10.6
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Dec 2022 14:31:53 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> CVE-2022-39253: git vulnerability mitigation.
> 
> ... and other bugfixes.
> 
> https://github.com/moby/buildkit/releases/tag/v0.10.6
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/moby-buildkit/moby-buildkit.hash | 2 +-
>  package/moby-buildkit/moby-buildkit.mk   | 2 +-
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
