Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6975BC0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 12:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1286360BA0;
	Sat, 12 Aug 2023 12:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1286360BA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Arn4sWaxg9yy; Sat, 12 Aug 2023 12:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B37F60B3F;
	Sat, 12 Aug 2023 12:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B37F60B3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 307D81BF3B5
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCC7481F1F
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCC7481F1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0ymnMdcKxPc for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 12:26:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DADD281F1D
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 12:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DADD281F1D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EC6020002;
 Sat, 12 Aug 2023 12:25:56 +0000 (UTC)
Date: Sat, 12 Aug 2023 14:25:55 +0200
To: Yu Chien Peter Lin <peterlin@andestech.com>
Message-ID: <20230812142555.6c125070@windsurf>
In-Reply-To: <20230812110359.27170-1-peterlin@andestech.com>
References: <20230812110359.27170-1-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691843156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhNPRR+f/L2YSSMxoPtKlFauP6k43PZDvETNQy01P0I=;
 b=aJZff3XK93x6uQUs77cJNeYLLEwi7KgkqrLb3ddHXaoaC/LAL57XhrprG5wNQg5SgOd8CQ
 m1fi2VKG2hX++kPlCdbUIZhuaY3sYpZHr89zSLj8Sg1/ybvr0nD8UQqnIeeh9rDgjWZMd9
 jIFhQ8bAVY1xoyLb2Bpm+LtYp6YS4t1Zm0nbuc0YsBn3DJPzJgafx3uGxhkeni4IDOsIeD
 A6qkqJMANtWz7DKS9ar0o5FDzS1CrkIwIZIwxPCCjzUtZ+Cmg3STeudqWRndGEu9b83aew
 nH/3C5COO/1tDlaiG7shfmz6fZYArpahoE5XTbhZhM6PXh6r/JKTe6Hs9FtVdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aJZff3XK
Subject: Re: [Buildroot] [PATCH] andes_ae350_45: Fix build issues of AE350
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
Cc: ycliang@andestech.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 12 Aug 2023 19:03:59 +0800
Yu Chien Peter Lin <peterlin@andestech.com> wrote:

> - Select RVA extension so the toolchain uses glibc by default
> - Enable Zifencei and Zicsr for gcc-12 to fix U-Boot build failure

I think these should be two separate patches. Indeed, only the second
part is needed to fix the build failure. Could you check this, and if
it's the case, split into two patches?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
