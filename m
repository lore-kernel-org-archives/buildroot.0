Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A371C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 11:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D55D41C93;
	Sat, 18 Feb 2023 11:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D55D41C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29_D2W8bfJzd; Sat, 18 Feb 2023 11:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A94A141C85;
	Sat, 18 Feb 2023 11:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A94A141C85
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77B711BF2F0
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F56440441
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F56440441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-_5ZAGvjm-f for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 11:19:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 021CB400E7
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 021CB400E7
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 11:19:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 03597100003;
 Sat, 18 Feb 2023 11:19:40 +0000 (UTC)
Date: Sat, 18 Feb 2023 12:19:40 +0100
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20230218121940.7442410e@windsurf>
In-Reply-To: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
References: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676719181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9tZiwYmdvpnPFrBQ37Hz/JwCfNYKgV795faH5FvT60A=;
 b=GyNgWl6WIXBKYqTV0oYV3xDGeF04/sIcK/ms96e8NXLqh8ivBqHqrEFxf6i3u7tY/PGR4Z
 3jg4W5vHgiaEtt32mVvKZCPEDOz2KHe7Eo8hE1MJhPEc9JNiuHv/M+sULNJyK3NQMY13nx
 mihxzosga92ha4YV0V3fsNOOIV9+GoCC263vyYJgAo/Kz1bSJa0h/v834aYI7CcGXQ+VQj
 FtcxXNLqC7PkpsVEkV4oow3//HpeyOQlmD2pnIZU1ZqCtAzz3iH2WIncavbT0z6+DYwlIi
 dOaxz5BcIi2TfwTujhtTwMQFXYBSuJO88ZrgoDaqJFPDjQTh4LbpYMKuRI4JIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GyNgWl6W
Subject: Re: [Buildroot] Updating trust store using update-ca-certificates
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

On Fri, 17 Feb 2023 17:15:39 +0100
Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> I am trying to add a custom CA to the trust store. I have copied the CA
> file to "/usr/local/share/ca-certificates/" in the rootfs_overlay and also
> has a .crt extension. Now after executing "make" the CA is not added to the
> trust store in /etc/ssl/certs/ in the target. Anyways it's installed only
> in "/usr/local/share/ca-certificates/" in the target. I thought
> "update-ca-certificates" will add this during image build.
> Can anyone please let me know what is missing here?

What makes you think update-ca-certificates is run during the build? I
don't remember Buildroot having anything that does this.

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
