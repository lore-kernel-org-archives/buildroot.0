Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0080BCA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A84884060D;
	Sat,  2 Sep 2023 07:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A84884060D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVvtTON7NYJK; Sat,  2 Sep 2023 07:47:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E44EC416EA;
	Sat,  2 Sep 2023 07:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E44EC416EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE6671BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82B0D4060D
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82B0D4060D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZOnWSo2Tt4e for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:46:27 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88CCA40574
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88CCA40574
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D736240005;
 Sat,  2 Sep 2023 07:46:25 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:46:24 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230902094624.6546efa7@windsurf>
In-Reply-To: <20230831191921.200550-1-ju.o@free.fr>
References: <20230831191921.200550-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0HrZv1uZrvk3DPQLJRziCu51X0PXuXBoAjrwS9J+Aw=;
 b=G0C1rX1fnDKS91zwZcCz+sB2DEyeQHKpZeeXFP4T4azY92OLv7SfZSjp0oT6Sanuaxt2+E
 04qxT+w9kYm0Lw8pQ88escWBmQoadOpjBDhPwuozY5JuIdJoB1obs/xqQUkRWVdG4buKRF
 Cqw5InXmHWQSc4sXGA2VNhI0zzwmMss0e9D/3zm9UPtw4F32YxM8p1P1O87epQVVR0IZX8
 0TA1T2uy+/l4YEcYTuWq8e4fOrOXOxV9GU8g2iNMfbiTUO5YHrADWhSfcXcpN2+VKZzAQT
 8ZfS0YbFLrZ8CAO/o6ZJ5tGWookVhSGEVMRw0RnAEXEiGHCUgj2KbdgKbEVsAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G0C1rX1f
Subject: Re: [Buildroot] [PATCH next 1/1] package/python-magic-wormhole:
 bump to version 0.13.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 31 Aug 2023 21:19:21 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see [1].
> 
> A notable change is that the package changed its HKDF implementation
> from the python-hkdf package to python-cryptography. See [2].
> This commit reflect that change in the runtime dependencies. The
> python-cryptography was already an indirect dependency; it is now a
> direct one.
> 
> [1] https://github.com/magic-wormhole/magic-wormhole/blob/0.13.0/NEWS.md
> [2] https://github.com/magic-wormhole/magic-wormhole/pull/456
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on top of branch next at commit d87d54d with commands:

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
