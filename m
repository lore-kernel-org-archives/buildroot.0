Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1268AC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A772381B9A;
	Mon,  1 Aug 2022 17:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A772381B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSZsdZXQn4kO; Mon,  1 Aug 2022 17:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB45781B70;
	Mon,  1 Aug 2022 17:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB45781B70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43D921BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E7F881B70
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E7F881B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNxM96kNl_sF for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:56:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F6A81B69
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04F6A81B69
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:56:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AF6CC1BF203;
 Mon,  1 Aug 2022 17:56:49 +0000 (UTC)
Date: Mon, 1 Aug 2022 19:56:48 +0200
To: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Message-ID: <20220801195648.13adf3d0@windsurf>
In-Reply-To: <20220728164006.16652-2-x-shi@ti.com>
References: <20220728164006.16652-1-x-shi@ti.com>
 <20220728164006.16652-2-x-shi@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659376610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMYpgPC9wP5D0kGV/sXfqVePotifZFB0vxSPmMW5qTg=;
 b=hl4cI19j1rl+tOrVdtScRjfbHa1sHg5sgi/p7ckEjgM/yHQBktICS2pv6b+iuCoEX2Z4qr
 ah72aGcu5XB5sB6cczov1pqvbx8S+HlPWvFeIPQnMSuj4Q40Cg3MdlgrvkvT7ImNYU6BrO
 PmvcJtBQwSWbOowHivuEKMuRgml6Y67syG9Mj976bIloDU0EpM6mr1PzAXlVgfUaT2CY2S
 FDle/cVgu5HvWqmIgIVG5q+u3/kXbfuVN7bUmfbaEZB4aEFhrRmns6CoUcwYCCa+giJdOP
 FTRDdAJJksziYJFhcsgHdV95ij2X1emwUaPzROHm3iM/8UvS+lCpBffIVpGdJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hl4cI19j
Subject: Re: [Buildroot] [PATCH v2 1/4] package/arm-gnu-toolchain: revert to
 version 10
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
Cc: Xuanhao Shi <x-shi@ti.com>, Suniel Mahesh <sunil@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 11:40:03 -0500
Xuanhao Shi via buildroot <buildroot@buildroot.org> wrote:

> Revert the toolchain to version 10.x because of bug in 11.x:
> when the pre-packaged GCC was built, it could be targeting
> a newer x86_64 architecture than the processor being used.
> Confirmed fix will be implemented in the next release:
> 
> https://bugs.linaro.org/show_bug.cgi?id=5825#c19
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> ---
>  package/arm-gnu-toolchain/arm-gnu-toolchain.hash | 2 +-
>  package/arm-gnu-toolchain/arm-gnu-toolchain.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
