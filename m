Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB53ACA0FF8
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62926405D1;
	Sat,  2 Sep 2023 07:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62926405D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aCqYX9sHKA3g; Sat,  2 Sep 2023 07:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDDE8415A1;
	Sat,  2 Sep 2023 07:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDDE8415A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 761841BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D42741FEE
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D42741FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjItKRggfbcI for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:41:40 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F381141FF0
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F381141FF0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 902501BF204;
 Sat,  2 Sep 2023 07:41:36 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:41:35 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230902094135.583ce53a@windsurf>
In-Reply-To: <20230831195338.469375-1-romain.naour@gmail.com>
References: <20230831195338.469375-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZH9JnW/Aeyg2vQKQJZz1IPpNvl+bRrlOgUqDndYVB2Q=;
 b=FFC0w4Z5vRwaJUFAs9RTSFIDFh/z4t8Fr5P3mR0zNNsg+Yz5OIzXJNUllLgzlKdTORKsqY
 pXbEBv60N31P41Js5VwAwhMnF3ZbOSFO+dOdm4nIYvtKb53f+4b7GCfJrdq+gFBoZNValy
 mJGAIjQujjfrlEavqyETMs/CoTCp0xtsm1bqJ6QJuXQ694kut88TIYcnrkeAY78mIwUPVr
 sWcolRJnPo2fGf1nUQ9FxM99UkMLCWOChz6KWsGgeifL+Phje8whODYstngRlJjrZlkA1x
 I9WLFhgM7nWMFL+Vm2x1qxIoSaqZIKelGehwDzWcB632cM6c/UO0RFTQrQSOxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FFC0w4Z5
Subject: Re: [Buildroot] [PATCH] configs/hifive_unleashed_defconfig: uboot
 needs OpenSSL
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

On Thu, 31 Aug 2023 21:53:38 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4987456270
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  configs/hifive_unleashed_defconfig | 1 +
>  1 file changed, 1 insertion(+)

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
