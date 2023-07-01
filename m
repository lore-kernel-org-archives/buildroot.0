Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6210EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 21:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61CBE8119E;
	Sat,  1 Jul 2023 21:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61CBE8119E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jYS0Pl6xXkCR; Sat,  1 Jul 2023 21:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E988D81FFC;
	Sat,  1 Jul 2023 21:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E988D81FFC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34E7F1BF303
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 21:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1715681EC3
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 21:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1715681EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qzz5AkIcEgQc for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 21:08:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3CED81EBB
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3CED81EBB
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 21:08:06 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFF5940003;
 Sat,  1 Jul 2023 21:08:03 +0000 (UTC)
Date: Sat, 1 Jul 2023 23:08:03 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230701230803.474f8570@windsurf>
In-Reply-To: <20230611131631.806432-1-romain.naour@gmail.com>
References: <20230611131631.806432-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688245684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Td0o4xnzFZ6bHk0tYtWdwrTDcY2yG4WXMAV/VY0Js+s=;
 b=CKPA4o0+60Z4ui3N+2wKPaHkKfpX2cO4bbHVTun0H4T8sBPuHymr3eZAN9FP1OzQGgIMTy
 La08Adi6p6Ke58SpPRP8F/He99qmuz28MszevzJg1RNwyTdZ0ALIfFiI8R2OP13yq6FgiP
 MHUnrqHE30BbyUGwlnoMpWHnUbnyHF9wcY3/+7VLnXmB8RLQCZSuA/gw6Z2q4WpyEHDEmU
 /IjS2bNpmGwoTX+yfJVPbwYN74qtbhslxA4r+EFbdiDCegxvENFBPG3MEzfBGSG3yF5Ts+
 wwxBd/6B8cnQfSa4UoUwz8KgPpIH2witMJOLbCvJCvloH3fScOKXnWUFuTg0WQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CKPA4o0+
Subject: Re: [Buildroot] [PATCH 1/5] package/binutils: disable gprofng
 support for each known unsupported version
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

On Sun, 11 Jun 2023 15:16:27 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> While adding new binutils version, the gprofng support will
> no longer only available with one specific version.
> 
> Instead disable gprofng explicitely for each binutils
> version that are know too old to support it.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/binutils/Config.in.host | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
