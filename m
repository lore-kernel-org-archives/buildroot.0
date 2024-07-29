Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B94C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82BE06086B;
	Mon, 29 Jul 2024 18:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JC0kM3T7N1d8; Mon, 29 Jul 2024 18:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 880B860886
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 880B860886;
	Mon, 29 Jul 2024 18:10:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73EC41BF42C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6226B80B5C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEd5DMO3sM0u for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 18:10:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 388F780B3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 388F780B3A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 388F780B3A
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 18:10:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F22971C0003;
 Mon, 29 Jul 2024 18:10:24 +0000 (UTC)
Date: Mon, 29 Jul 2024 20:10:22 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240729201022.172cd836@windsurf>
In-Reply-To: <20240729-pkg-kconfig-ppd-v1-0-36c901c73a7b@collins.com>
References: <20240729-pkg-kconfig-ppd-v1-0-36c901c73a7b@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722276625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHUFXbW0QYZ9olRNndxfyC6hb5OL4LJ3LcKcRgNnl24=;
 b=m0A1pyD0AkRt1J1ayDSPutIIgRgnx2BuwRXeg078MaAMEwfAUYzrOiJO+kQ4E3tjWkroAT
 2h5a9oJ27ZH2rdHmB5NAzCtbWAT39o7Qal6TsyfaRkkbJ2YoJLixZl4qAMyhTWVPEBVRsa
 m5fYbq558Z5NCdBSfz91xawZK0mTggZMOboJDdg2FTt2FLa+EcLqVHnWFXW92fvshfxyha
 OgwF5tKQfPfiqUyt/uam2KwygqfLWNM7MbyL+EKyM7a24bKn1xGieuP6401dtkroljZWo5
 OsfhAhJFZM2Jj8WHxQks/udlXyNs9k8ok1j4A0RZzT+YEeN/ciRAxLFwcpDGCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m0A1pyD0
Subject: Re: [Buildroot] [PATCH 0/3] package/pkg-kconfig: fixes for
 per-package-directory
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
Cc: Nathaniel Roach <nroach44@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 29 Jul 2024 16:19:07 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Brandon Maier (3):
>       package/pkg-kconfig: fix *-savedefconfig under ppd
>       package/pkg-kconfig: fix *-diff-config under ppd
>       package/pkg-kconfig: cleanup savedefconfig MAKE

Thanks a lot, series applied!

I'm wondering how many other custom make targets like that we have that
would be missing the definition of PKG :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
