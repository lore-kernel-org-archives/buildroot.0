Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7362FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 18:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 163E24040C;
	Mon, 17 Jan 2022 18:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEQmfQpa_7h8; Mon, 17 Jan 2022 18:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2787940374;
	Mon, 17 Jan 2022 18:53:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B62291BF2F3
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 18:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A489D81248
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 18:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 69YMgub-wWuV for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 18:53:04 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0681081025
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 18:53:03 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9X0xnzxTUc6LX9X0xnoF6a; Mon, 17 Jan 2022 19:45:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642445159; bh=5j1Y97ZAL9I6hArRgbN44C9IMOnsDnZ56yx2GIXJZQg=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=d80NHG7CIvtkt90DX+4yxJbeD3vqwGVsauqPxb/qPFtMXStkp5luYBK8UZbmb/TkK
 UHneogUNbKBd9B8DRmHS+3ijRHHS4fJSHr0hH1/q23CtHKDpVzVvGU0AjZfRT1Dejt
 lL6s8/EYycO/UcG+gxFOlYo/K22loiQf2LakuDUGR3VpyXc6uIJvyM5nf5z/u6OOaM
 mhzS88X70wTg5xGc82PIvLqt1MsH+fiKD2ltKLFZTZUE7CcrXvEZ8lwBmTeIxr6mtR
 Sfhdq39N5InK8aFg0MLjvCzhgmsmGXdydqTNIzTrX6+zjK5RkESiXAfQb/rfX3ZVp5
 /0FTrnaqNqxxw==
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20211130103919.19428-1-kory.maincent@bootlin.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <b87db8ff-33b3-2b1e-f011-cb1e95f86c98@benettiengineering.com>
Date: Mon, 17 Jan 2022 19:45:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130103919.19428-1-kory.maincent@bootlin.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfAqqSbASojLbWzq9HtsieAcZlsgEaXZEE9D22kkEaPA4EF76Fk2pB66dXRbVn9jBpWzOca0WBMWKeMOyAk8Jg/vEo1w1/2H4Kd06ujGBzLhMVG2x476q
 Edkuo9UnrL/opVYCHFndsj7q7fYoSkHZjZcrE9wjqfMQWFJ56JdN66IVFP7rnpgCMFkauTCNIei36sQcXrZZACnOmN1kd239L3QtIJpnqTZWYOuxo6Zy3Hyv
 EWy6hviWPIDpYlkREj5sLBeGhDU9yUlI1Rz18T93mYgyJ/kcIcjOJzKVpYaaJTxY
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/octavo_osd32mp1_brk: new
 defconfig
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
Cc: thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kory,

On 30/11/21 11:39, Kory Maincent wrote:
[SNIP]

> diff --git a/configs/octavo_osd32mp1_brk_defconfig b/configs/octavo_osd32mp1_brk_defconfig
> new file mode 100644
> index 0000000000..6b775282c0
> --- /dev/null
> +++ b/configs/octavo_osd32mp1_brk_defconfig
> @@ -0,0 +1,59 @@
> +# architecture
> +BR2_arm=y
> +BR2_cortex_a7=y

Here I think you should add:
BR2_ARM_FPU_NEON_VFPV4=y

This way, while building, you will have FPU that can use both VFPV4 and 
NEON. This can speed some package up.

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
