Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73FFEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 837C581F8E;
	Mon, 10 Jul 2023 17:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 837C581F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0xcsBFZ5YVD; Mon, 10 Jul 2023 17:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC4E581E8B;
	Mon, 10 Jul 2023 17:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC4E581E8B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1A0C1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8655240549
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8655240549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uc3gWVlgaTGx for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:33:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 556A04052B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 556A04052B
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:33:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DD7B2000B;
 Mon, 10 Jul 2023 17:33:44 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:33:42 +0200
To: Yunhao Tian <t123yh.xyz@gmail.com>
Message-ID: <20230710193342.674bc531@windsurf>
In-Reply-To: <CAFQXTv28aGSj2hz+LwpcRaMgc7zkwtpF5+2QR6svxTHe8DE3Ow@mail.gmail.com>
References: <20230710135752.1849099-1-t123yh.xyz@gmail.com>
 <20230710182012.20a5eeb4@windsurf>
 <CAFQXTv28aGSj2hz+LwpcRaMgc7zkwtpF5+2QR6svxTHe8DE3Ow@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689010424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uyv/9tE5OYJc3LFhRibToo+gt3cS5j5VHx/9vzN2tKE=;
 b=EYEq+kc+Xd3lsETeLt7XHF8fGzFQf6BLNcoOCWkMDsZ5VZNrrET7uFAEFpSgD4gSRGLJiP
 sEskNofi8WaMxL6Ju/KR5ZVJH1WxzJTXJFZTs2sfgRYEJ7A5g6DeweDf5anoYcdIVJHsMu
 XUrf8eTjeiohWGEoc5F7El9fJzKWmnbB2Sp74ZtSyBba2Ftq7KGmQH3pCs+176oiC5iH3b
 HvKmWulsV6Y0AfuYmsUMobb/FNnj/SB2M22f4XjhrCI2eVmCELqpQ0Lhw1nSkur9598FZH
 PaxuQKQrREVUb2Fh5fgZs4WU5y7oVS3N+wBk1LbEI+WFhSzJAVKcZM4hEs2Qpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EYEq+kc+
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix AC_CHECK_FILE
 error
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jul 2023 00:39:38 +0800
Yunhao Tian <t123yh.xyz@gmail.com> wrote:

> Actually I found an upstream patch [1] that solves the problem. I will
> convert this to a patch
> together with the AUTORECONF option, and re-send.
> 
> [1]: https://lore.kernel.org/linux-bluetooth/20230701041252.139338-1-rudi@heitbaum.com/T/#t

In fact, Bernd already submitted such a patch:

  https://patchwork.ozlabs.org/project/buildroot/patch/20230704061944.496211-1-bernd@kuhls.net/

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
