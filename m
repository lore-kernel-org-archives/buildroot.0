Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB178E7070F
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 10:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B1F812FF;
	Thu, 21 Sep 2023 10:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5B1F812FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIm0J2HJxkX7; Thu, 21 Sep 2023 10:30:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 075FE81FE4;
	Thu, 21 Sep 2023 10:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 075FE81FE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1832A1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D92164048C
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D92164048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCRvoieuNfsZ for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 10:30:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BADFC4014D
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 10:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BADFC4014D
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7099FF809;
 Thu, 21 Sep 2023 10:30:35 +0000 (UTC)
Date: Thu, 21 Sep 2023 12:30:35 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230921123035.4d71d046@windsurf>
In-Reply-To: <20230921040031.70822-1-dalang@gmx.at>
References: <20230921040031.70822-1-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695292236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2/vYlA8bPNN5QbAswtGi+frN2i3pXePb3fXheEdx1o=;
 b=BfEAjGN1hu72ZgLC/Od+/r6gJxG9RsB+TSmEeoaPSc0Xiv2u2fxe+jQK/Xi05CpzkOZXjp
 fH5DpvFFr7f4T99uDMnXP56EIo1M1o6FXQVSvNs45y4hgF4nHOaaVgexOD/HTeR/Jy20LI
 MpEnwiE1Vyi7+onvzERT7JgGRs2e4VA0GPwBSA0xk/swXmLYr+Y/1AeTzyFSri9YFlZjGx
 zc6CS4nSzwKh2lK8IsZatu57lM+ucdFNG9oAnmuKmnw6P8XnUbbww00kHj9Bjbj0dkKhhW
 I/kFOOcFJClsRzbfN/AyIZfPA68Uydk4+vd8oboWdm5iw2h+E1RrJsEOHCDlKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BfEAjGN1
Subject: Re: [Buildroot] [PATCH] package/icu: drop CVE-2021-30535 from
 IGNORE_CVES
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

On Thu, 21 Sep 2023 06:00:30 +0200
Daniel Lang <dalang@gmx.at> wrote:

> The mentioned patch was removed in 7549e05b when bumping to 70-1.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/icu/icu.mk | 3 ---
>  1 file changed, 3 deletions(-)

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
