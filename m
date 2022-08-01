Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2C7C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 07:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A98F98403F;
	Mon,  1 Aug 2022 07:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A98F98403F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPro993OXhhr; Mon,  1 Aug 2022 07:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0ED08401A;
	Mon,  1 Aug 2022 07:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0ED08401A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F121F1BF3CE
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 07:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82A1383F83
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 07:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A1383F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06Jj9gW0-LgM for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 07:28:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3477F8401A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3477F8401A
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 07:28:01 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A90794000D;
 Mon,  1 Aug 2022 07:27:56 +0000 (UTC)
Date: Mon, 1 Aug 2022 09:27:54 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220801092755.101dcb5d@booty>
In-Reply-To: <20220731112746.92822-1-bernd.kuhls@t-online.de>
References: <20220731112746.92822-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659338877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtBjBqt+ifOfCsFt8xL+jUFgW+5Wq6qFHEctUb/hDUA=;
 b=mc1Af3N6NHqWJRm7J5rc0mRhcFhzePJtzMTNGnHVcjr8C1zi1NKDUgVi5ke1Yo8WthxhB2
 VNaCaw/9uh+XnqRDLfCTeDbbt50ax717zEa5VnUhonVOz444J+2agd9UAL1PCgLoTUEYnZ
 TYFZk9AcJw30AB8w4Umz8eqkv0kAKlMPGF9N3yoj2yukVVbQ6gwL1ywvBMEB+iNY5yMWns
 HZ4kRopEcSBm1uH1V/gvXugixLZwjCZuyfjYMV9oSC1kcvzbjFW0OWrDhITKqVk/amHItf
 t+fb46SEKDA7F86oy3+ARMoZ35CWanznemoPi6ZPs6Fw8PTshb2DqILn/1flow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mc1Af3N6
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: ignore CVE-2022-30333
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Sun, 31 Jul 2022 13:27:46 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/exim/exim.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index e0fcd83fb0..a54a39c815 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -10,6 +10,8 @@ EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
>  EXIM_LICENSE = GPL-2.0+
>  EXIM_LICENSE_FILES = LICENCE
>  EXIM_CPE_ID_VENDOR = exim
> +# fixed in version 4.94.2
> +EXIM_IGNORE_CVES += CVE-2022-30333

This CVE does not seem related to exim but rather to rarlab. Can you
either clarify what's going on or send a patch against rarlab?

Thank you!
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
