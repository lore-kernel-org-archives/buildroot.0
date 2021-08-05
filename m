Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF85C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:47:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A376561104
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A376561104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B6E60AAD;
	Thu,  5 Aug 2021 20:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWrmIDrefjRN; Thu,  5 Aug 2021 20:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C92D660AA7;
	Thu,  5 Aug 2021 20:47:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76AE21BF3C5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 658E560AA7
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eVyDn_AWxGle for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:47:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 506A960A79
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:47:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 49A79240004;
 Thu,  5 Aug 2021 20:47:28 +0000 (UTC)
Date: Thu, 5 Aug 2021 22:47:26 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Refik Tuzakli <tuzakli.refik@gmail.com>
Message-ID: <20210805224726.22f6d200@windsurf>
In-Reply-To: <20200208134950.28582-1-tuzakli.refik@gmail.com>
References: <20200208134950.28582-1-tuzakli.refik@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] package/freescale-imx/imx-dpu-g2d:
 new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Refik,

On Sat,  8 Feb 2020 16:49:50 +0300
Refik Tuzakli <tuzakli.refik@gmail.com> wrote:

> imx-dpu-g2d package is used by i.MX 8 and i.MX 8X series instead
> of imx-vpu or imx-vpu-hantro. With this commit, imx-dpu-g2d is added
> and is enabled for i.MX8 and i.MX 8X.
> 
> Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>

So I wanted to apply this, but except Gary's feedback, there is still
one issue. When I look at the libraries libg2d-dpu.so.1.6.0 is linked
with, I see:

 0x0000000000000001 (NEEDED)             Shared library: [libdrm.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libOpenCL.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [ld-linux-aarch64.so.1]

So libc/ld-linux-aarch64 are part of the C library, libdrm.so is taken
care of by the libdrm dependency... but what about libOpenCL ? What
package is supposed to provide that in this context ?

Gary: I know you said this imx-dpu-g2d package is independent of the
GPU, but here it links against OpenCL... which I guess is provided by
imx-gpu-viv.

Note: I looked at version 1.8.14 of imx-dpu-g2d.

Could you give me some insight here, and once we resolve this issue,
submit a v4, also taking into account the feedback from Gary?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
