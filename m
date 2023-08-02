Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1595DC001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 20:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A14D4026D;
	Wed,  2 Aug 2023 20:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A14D4026D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yemaIriNjjT1; Wed,  2 Aug 2023 20:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E4BF402CE;
	Wed,  2 Aug 2023 20:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E4BF402CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5D6B1BF42C
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 20:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E14B415FE
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 20:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E14B415FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8uqM91whxPp for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 20:03:26 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 460A0402B3
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 20:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 460A0402B3
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC2FB1C0002;
 Wed,  2 Aug 2023 20:03:22 +0000 (UTC)
Date: Wed, 2 Aug 2023 22:03:21 +0200
To: <alexey.brodkin@synopsys.com>, ARC Maintainers <arc-buildroot@synopsys.com>
Message-ID: <20230802220321.6af766af@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691006603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tSdzXygaK1z3ABOb9/gMtMEW/Q2JSx5tpaYKCb449f4=;
 b=AdZmOu66EKz4IfuL6D/9jAx29AgM/rZRIF/oPZvcJavbvRk8P/02uabVR6vAqDkjgy/BtI
 c+XDwltyQIMDeQq77VVYif2jXFO1kOWmQBsuadmlbTutUaY+0QP6MmFIDKjTkRKgrYL4TW
 Byrl3LHdmack0/ZhOq/dcq2iAcSo5/5FON73z3c1oEWNK2A8+eX4WDEgiTujt4OU9tzG61
 oAuN3P9qecAAA5Fub6Ocz765+2umXEtj4EKmxKaPGAB9GjsY7TO7m1rnyG6p4Zc6ZLIRbu
 u8MLlhnb4eTcZSiw5XYh9O04ivupK4lm5uDkW3Zxt0d30/Bobii3MskSmZlYYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AdZmOu66
Subject: [Buildroot] ARC support in Buildroot
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey, Hello ARC maintainers,

I am reaching out to you to understand the interest that you have (or
no longer have) with the ARC support in Buildroot.

Indeed, we haven't seen any updates from ARC people in a long time. Our
toolchain components for ARC are stuck at arc-2020.09, which is quite
old as I've noticed you have release much newer versions of
gcc/binutils/gdb. Also, some of that ARC support has been upstreamed I
guess.

Is there still some interest at Synopsys in maintaining the ARC support
in Buildroot? If not, we would probably want to get rid of the support
for this CPU architecture.

Side question, is there an emulated platform that is freely available
we could use to do runtime testing of ARC? I very quickly looked at the
4 defconfigs we have, but none of them seem to be related to a freely
available emulated platform. And in fact, only one of the defconfigs
seem to have a readme.txt to indicate how to use it.

Thanks in advance for your feedback!

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
