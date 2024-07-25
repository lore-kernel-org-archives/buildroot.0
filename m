Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06C0C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 10:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E009409F4;
	Thu, 25 Jul 2024 10:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yT7XB5S36Mel; Thu, 25 Jul 2024 10:16:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FAD14093A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FAD14093A;
	Thu, 25 Jul 2024 10:16:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4CC1BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 674744064E
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INnez7YkGb0a for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 10:16:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5059340912
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5059340912
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5059340912
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 10:16:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A5B6FF806;
 Thu, 25 Jul 2024 10:16:31 +0000 (UTC)
Date: Thu, 25 Jul 2024 12:16:30 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240725121630.706c9c52@windsurf>
In-Reply-To: <ZqIjh9iw1hgT8D/D@waldemar-brodkorb.de>
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-2-gael.portay@rtone.fr>
 <20240724182122.6a1f75ee@windsurf>
 <D2YGQXWLNLWG.2S6K4TCJ7EDN6@gmail.com>
 <20240725101027.77f7b4e4@windsurf>
 <D2YITL40TOEJ.98932ZGHH1A9@gmail.com>
 <ZqIjh9iw1hgT8D/D@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721902591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ar5OX/z9FcQebFog0jC6zEFMQHcsV1Bb5nVeJpiItDA=;
 b=ECCyVMfu+gWDj1D1nED4SZdB1X6rAoGaK6G5XZTcX6r9wM+R/q4GfZPdxvaze+vb2qCbxV
 sBsSr/cpEwasoq0uBnXcGYRNYMIZZq7FY4wgin4habAn+B4DLBKja+moSgH1AyBeM//zTF
 pncky4qkYUYF6xeGQIgEWVIoAnZALIg6+CokVDqtPpgVpN8DrdvTRPLXLqVkr61wDMxGOV
 3U1zC78dZSZVd5kqE5uaq1zB27L791RnmoDFNx4fB8W+rfhbvxgTavxBBYA8BK4kxfoJyr
 d9pUOXiUh43AaPYpGv5L36um2yNyYQH5DsVXoIuE3pdbkyht4hpDnQzyno1LJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ECCyVMfu
Subject: Re: [Buildroot] [PATCH 1/2] package/rpi-utils: new package
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
Cc: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Jul 2024 12:05:59 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> reallocarray was added in uClibc-ng 1.0.47. uClibc-ng 1.0.48 is in
> Buildroot 2024.05.1. 
> @Thomas: Would it be possible to rebuild bootlin toolchains?

Yep, planned. I have actually already restarted a build of all
tolchains, but got some failures that I need to investigate and fix.

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
