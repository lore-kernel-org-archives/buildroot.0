Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAE3C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5230A6076C;
	Sun, 30 Jul 2023 10:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5230A6076C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRvhnHM1zFHA; Sun, 30 Jul 2023 10:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A761260615;
	Sun, 30 Jul 2023 10:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A761260615
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAE1D1BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1CFC80EDC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1CFC80EDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQ4rxLXoBFsd for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:38:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4C9980BFE
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4C9980BFE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A8F020002;
 Sun, 30 Jul 2023 10:38:36 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:38:36 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20230730123836.4edb6ad6@windsurf>
In-Reply-To: <20230604110647.3418706-1-troglobit@gmail.com>
References: <20230604110647.3418706-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690713517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C80IGrwMV/FD/OR873IgO8XJJK8VpEnLHTrfLCFYDek=;
 b=VVkhdsdJLZGyjq3m3UwOBjpBTLp2JWbA2XErvAuTwo8Hl63mPqDi4HuOv5li4Olo1v0OiY
 jMxV7D2zGR7SrVXXUox77/mlH+F65LklQxWvsEwtFY+jAfNNNFYl6OYEOU8fhayRM4hii6
 FOqE+3mRmyMhZZWfWRXj8Pv3rCUFvXJe98/D4Vxzb5VcPSdUX4iC4PdKaJ11rd8BUAWqLi
 /ATMDIQRLCv4kW/NXgzHH6ib06qfVSVqnjWed66NvQBwJ37PeSKdd/l/YYZNxENGmUwFyu
 N3F5OVuaXU+7Oo9XYefXgT/uAI7iTA2HsalxCfZhLJ8K6mZnEDtjygo6SC8ElQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VVkhdsdJ
Subject: Re: [Buildroot] [PATCH 0/2] ssdp-responder upgrade with systemd
 build fix
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

On Sun,  4 Jun 2023 13:06:45 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Joachim Wiberg (2):
>   package/ssdp-responder: bump to v2.1
>   package/ssdp-responder: add /var/lib/misc for systemd builds

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
