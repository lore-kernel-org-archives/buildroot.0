Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9281AC001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3212B81418;
	Mon,  3 Jul 2023 19:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3212B81418
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2XSDO3gYB9W; Mon,  3 Jul 2023 19:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 601438140D;
	Mon,  3 Jul 2023 19:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 601438140D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0711BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63D038140D
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D038140D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDlWf5duMkCF for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:23:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B6B9813E9
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B6B9813E9
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:23:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::221])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 73B6DD41B7
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:17:09 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6E20240004;
 Mon,  3 Jul 2023 19:17:04 +0000 (UTC)
Date: Mon, 3 Jul 2023 21:17:03 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20230703211703.2f60078d@windsurf>
In-Reply-To: <20230702201736.72396-1-ckhardin@gmail.com>
References: <20230620173813.4590-2-ckhardin@gmail.com>
 <20230702201736.72396-1-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688411825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1vFDP5IWS0n69SXm9F618G1S/LQUKhRX9wdMFf8dbjU=;
 b=L4IQ0CZ1AcXyXv7b9qoLV+86KN7de2A40mS/DgnIVTJW2+lr+iaSdxmDtrr1UErHhYHCFH
 So968bYV8yeKhO/xPy5K5cfY0UuhfEQczwmxwKxrUeP2VuTKBq5fbrHV7jRgyD9mFZtvXF
 jJs+LtvIMwcAcl3ZxVjhIdLiwNvoZTyCf8H5/15do9BIvSFp3w6NXirAhoAVoeK1y4P8dp
 rtUyp2uGzNrFw6nkNiU5bk6DZop1H07zNY3bktZ3mE9gh8jFY7bMNuIvCiVJdbyLslms6b
 licyWZU/E8mENrmsGR2BBkuNmFDLDdg/n3ozizAQRIdvbFYQLVlWBialGGEdDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L4IQ0CZ1
Subject: Re: [Buildroot] [PATCH v2 1/1] package/bluez-alsa: allow a
 samplerate conversion for audio playback
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

On Sun,  2 Jul 2023 13:17:36 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> In the case of the bluetooth audio then incoming stream will be coming
> from bluetooth devices at varying sample rates like (44.1, 48, 96, 192 kHz)
> and the odds of a sound device matching that samplerate exactly
> is a bit slim. So in the case of a bluez audio playback the system will
> need to do a samplerate conversion.
> 
> Thus when enabling bluez-alsa and the alsa plugins select libsamplerate
> to support the shift from the incoming samplerates to an often fix-rated
> audio device.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
> Changes v1 -> v2:
>   - moved the samplerate selection to bluez-alsa

I've added a small comment in the Config.in file to explain this
select, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
