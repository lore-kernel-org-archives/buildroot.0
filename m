Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5934DEB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 13:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB3C8416DD;
	Tue,  4 Jul 2023 13:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB3C8416DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RqKvQ1MiuLG2; Tue,  4 Jul 2023 13:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A66ED4099A;
	Tue,  4 Jul 2023 13:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A66ED4099A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45F7D1BF5B4
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 13:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BE3F813F4
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 13:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BE3F813F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lb_WxFIAgQ4 for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 13:33:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3522813DD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3522813DD
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 13:33:49 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EB7C1C0011;
 Tue,  4 Jul 2023 13:33:46 +0000 (UTC)
Date: Tue, 4 Jul 2023 15:33:45 +0200
To: Sebastian WEYER <sebastian.weyer@smile.fr>
Message-ID: <20230704153345.153f73ac@windsurf>
In-Reply-To: <CADSVbUsPFy5-CZ22BUU_dYAGc-=ycpJYAKSmdj7nYm96Nn5PBQ@mail.gmail.com>
References: <20230608085015.1075425-1-sebastian.weyer@smile.fr>
 <20230703224149.51f6ac85@windsurf>
 <CADSVbUsPFy5-CZ22BUU_dYAGc-=ycpJYAKSmdj7nYm96Nn5PBQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688477626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JiCKnXxReLIe6EljE1kks56D1JtjATVxwGnvrMccWwM=;
 b=BpnE2x+2Q19xEzpPaIsarizLhqAt2TYc6Kjdywyu41ewSBiBSmPUqRfuhF0/S8jSqIkMRL
 p0e41fCQA7yM1ix85oNdcmyXGg2hq0SYBtS1w5mj1hygbWGjgmENwwAcPnKPHJEL6I49aJ
 UkCVUGwLqFaJSgASndCRJmRXzBW+ArVN1BxEYMfu67/imvNRQ7ATQmBRSsfpq5qm87idpT
 8VNS1mctY5o+VZDlE4rcXE27iRvkJ/hrCEshe+Z2sTY0DN4dE7DD7LHBS60QkLArj7kEP9
 FVEfuFoGXAC5zs+iLJEopId+ki/8cxRVYBr4ZBLexq1NeTiHnFl7PIfBeW5MIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BpnE2x+2
Subject: Re: [Buildroot] [PATCH 1/1] package/rust-bindgen: new host package
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sebastian,

On Tue, 4 Jul 2023 12:50:16 +0200
Sebastian WEYER <sebastian.weyer@smile.fr> wrote:

> Thank you for your feedback.
> It was an oversight to leave the comment as is, as initially the package
> was added with a version <0.63.0.
> Do you think a comment explaining the command line options being deprecated
> should stay? Also considering that the Kernel still uses these options for
> its Rust modules.

Ah, so the proposed version of rust-bindgen would not work to support
the in-kernel Rust support? This is a bit unfortunate.

Regarding the comment, I'm not sure they make sense. If we start
documenting all what's no longer supported by a given package,
Buildroot would be full of comments related to obsolete features :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
