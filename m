Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140D9C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 10:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC68340E4E;
	Tue,  9 Jul 2024 10:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9yG-IuAeaRV; Tue,  9 Jul 2024 10:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91201410AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91201410AC;
	Tue,  9 Jul 2024 10:07:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4F9A1BF298
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADA36410A3
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBKRgRRmEwuF for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 10:07:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E03340BE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E03340BE3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E03340BE3
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 10:07:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 495B5E0003;
 Tue,  9 Jul 2024 10:07:00 +0000 (UTC)
Date: Tue, 9 Jul 2024 12:06:59 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20240709120659.60e32214@windsurf>
In-Reply-To: <42d13dfb-0ac3-4939-b50b-a4187df30e89@gmx.de>
References: <20240704101631.1860647-1-fiona.klute@gmx.de>
 <20240708235339.5dbf3da4@windsurf>
 <42d13dfb-0ac3-4939-b50b-a4187df30e89@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720519620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKDi8USybb2pQPA/Lh/lOnGCbaGB25GMQDBUykqMZNc=;
 b=QmrAS5DwBQC8V/tOp/2sMZx3BEK34y0VnvNZOOt//Pnzc1kZAiDAk5zuGrdaWX76DPRWZA
 /qRvcwDvdsx6zUaB+UGYBb/bKl4tkZ+bgon/AWydkEXHy0peUGIHqz+3n9QXIWnoZyri3g
 +61JaOnFGovIiL+MytEYQ7iVKtu2jzElIYlt4yYaxr3S5I2atsy4f6mbm2tcSWuhRWSgUp
 1jywhDrqRGOKRbRvtOt5pX6J4Ib2oE6Z8uUg3t/S3xZzSoc/4ImWXMsimdikt+50t5hUwL
 30JNVmQhXvE5TOQOCFIxvnpqNqX4nHL32xsOyOh6vykhzDcDstEzbtj3T7AQIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QmrAS5Dw
Subject: Re: [Buildroot] [PATCH v4 0/3] Refactor OpenSSH init.d script
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Tue, 9 Jul 2024 11:55:56 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> The script is functional, but the use of long options was intentional
> for readability and I'd rather have it preserved. Having existing
> scripts in a hard-to-read style doesn't seem like a good reason not to
> be more explicit in new/updated ones [1]. That was the reason for the
> question (and patch) about which Busybox options I can rely on when
> writing init scripts.
> 
> Regarding the added "-q", if a start (stop) command fails because an
> instance is already running (not running) with the current version you
> only get "Starting sshd: FAIL", while with my version you'd see the
> *reason* in start-stop-daemon output. That seems important to me. I only
> had "-q" in the reload function because the "stopping" output of
> start-stop-daemon (when it's actually just sending a SIGHUP) seemed like
> it might confuse someone.

I'm fine with both, but then I think the documentation and the
canonical example it refers to should be fixed first. This is how we
declare what is the "right" way of doing things. Otherwise, we'll keep
on using these as a reference for all future scripts, and we don't have
a reference point that tells us how things should be done when fixing
existing scripts or adding new ones.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
