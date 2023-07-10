Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F55EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 19:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59D1840B91;
	Mon, 10 Jul 2023 19:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59D1840B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_BiuO7JnNj2; Mon, 10 Jul 2023 19:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 938D240B7B;
	Mon, 10 Jul 2023 19:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 938D240B7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CBAB1BF3A1
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA41E4187D
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA41E4187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RU3EpX2ywZOy for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 19:32:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8720041876
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8720041876
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 19:32:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6724C240003;
 Mon, 10 Jul 2023 19:32:24 +0000 (UTC)
Date: Mon, 10 Jul 2023 21:32:23 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20230710213223.5b49c915@windsurf>
In-Reply-To: <20230620171943.3999-1-ckhardin@gmail.com>
References: <20230620171943.3999-1-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689017544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5vTBM+GlQGlJyTut5nW338cbnVz1QdyLwnHXgzfmxE=;
 b=Kr2zgumR8RigAPzXtvmmWJ3+6J8SOKIQb8y7uQLqRlPqezCsU8QR5yTslGOLECwwtemzJq
 PPPs/ijXhok8ISKyv7iEUFJETIRhOkT1v5dh0IMlKWqRsKARoj9ffVKMy8U4fIBFBXK11u
 MQBzVLUbejTZ2cYH88Wmz2I9PAG4JvVBgWJOeyXCRwKN8CyKF8mfseM4QdWwsfjXjbccV9
 kp5b7SGLtsCVa5vMeNsXkSjK7GHcS5hliGwALDetLUds6kkV7abiLGpzhEIzMlEC09Ln3M
 4nSpwB/fDob39X6/bRDAFujd9hudzwjVKFXeobQ7I082ve1Nqj29/1Ks4Rp9cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kr2zgumR
Subject: Re: [Buildroot] [PATCH 1/1] packages/imx-seco: add the imx8dxl b0
 revsision ahab image
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Charles,

On Tue, 20 Jun 2023 10:19:43 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> Update the selection of the ahab container images for the imx8dxl
> asics. The initial support assumed these were imx8 but this is
> actually the imx8x architecture as well. This was fixed when run on
> the first tests against the imx8dxl SoCs.
> 
> Files from upstream:
>     mx8dxla0-ahab-container.img
>     mx8dxla1-ahab-container.img
>     mx8dxlb0-ahab-container.img
> 
> The B0 revision should be considered the latest
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>  package/freescale-imx/imx-seco/Config.in | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

I've applied, but I would have preferred two patches: one fixing the
existing entries, one adding the new entry, as these are completely
different things.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
