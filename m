Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C76C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C882A423F0;
	Thu,  2 Nov 2023 18:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C882A423F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GdetkYqwsF32; Thu,  2 Nov 2023 18:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92D48423F7;
	Thu,  2 Nov 2023 18:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92D48423F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4ED111BF861
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3554C8501C
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3554C8501C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLPSkbv69Oc1 for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:10:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C34B084FBA
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C34B084FBA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76ACA240005;
 Thu,  2 Nov 2023 18:10:33 +0000 (UTC)
Date: Thu, 2 Nov 2023 19:10:32 +0100
To: Bram Oosterhuis <dev@bybram.com>
Message-ID: <20231102191032.095142db@windsurf>
In-Reply-To: <20231011162430.3484150-1-dev@bybram.com>
References: <20231011162430.3484150-1-dev@bybram.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698948634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVp+OT3c+FA2L0gFEzC8u1oBLh2Gni0wO3nQs9GC3GE=;
 b=BHJw6T2V4qj+kzcmLlRZvsg+XMsSKIw0H4joDNDwlWFPVG9pJFvZ4bOanK4ap07mJxyZps
 gECy3nGGM5Kt/+/yeJHnwkqe648kTbb3nEDtDproqeSqtyrBHT4ACinf0UbtiEIGoXlz0/
 gYBaM+Ksdj9g0iiz4/mayJw0As+CH3UqVcBX1HZmeYD3u+mf7+p9DrlF4FqqYavpx6JVVO
 eVdlhcXNQln28Wa9G7Bi+nHCwUHCHfAxafTvDIO7YAbc71ilsnfz06sBY37xP55OAejimK
 obWwiliMsj8QQv7gWC0mb4mdqZH3j7uOB+uwlTW75OPTNiOuZdjTLj0C9pM77Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BHJw6T2V
Subject: Re: [Buildroot] [PATCH 1/2] configs/raspberrypi: bump Linux version
 to 6.1.55
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bram,

On Wed, 11 Oct 2023 18:24:29 +0200
Bram Oosterhuis <dev@bybram.com> wrote:

> Linux 6.1 has been marked LTS for a long time now. Time to bump
> Linux for RaspberryPi's to the latest 6.1.55-v7. Since April 2022
> the RaspberryPi defconfigs have compressed kernel module enabled
> by default. (see [1] and [2]).
> 
> To load compressed kernel modules kmod and xz packages are needed
> because busybox doesn't support it.
> 
> [1] https://github.com/raspberrypi/linux/commit/c45b4223a4e4a8cfe39edbb4949329ea478fa4e2
> [2] https://github.com/raspberrypi/linux/issues/4966
> 
> Signed-off-by: Bram Oosterhuis <dev@bybram.com>

Thanks for this patch. Could you clarify in the commit log on which
platforms it was runtime-tested, vs. the platforms for which you only
verified the build?

> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +BR2_PACKAGE_KMOD_TOOLS
> +BR2_PACKAGE_XZ
> +BR2_PACKAGE_KMOD
> +BR2_PACKAGE_HOST_KMOD_XZ

I'm afraid this has certainly not been tested, as I believe these lines
have no effect since they lack the =y to enable the option:

BR2_PACKAGE_XZ=y

for example.

> \ No newline at end of file

Please fix this to have a newline at end of file.

(Of course, same for all other defconfigs)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
