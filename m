Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F124EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 18:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CDEB4042B;
	Mon, 17 Jan 2022 18:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2LB66_YKCE_o; Mon, 17 Jan 2022 18:54:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FDEA40374;
	Mon, 17 Jan 2022 18:54:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E63931BF2F3
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 18:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E101440374
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 18:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id no7gue7jW6Hi for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 18:54:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id F366B40153
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 18:54:35 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9X2RnzyV1c6LX9X2SnoFnM; Mon, 17 Jan 2022 19:47:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642445252; bh=S/tJ+5SJOgpVE6gfRGWLIVompp6rp1C69gq/apKCZkY=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=OgdeRtCFfFJJ6vR9nD8HvOGyQi0cA3PHhnVZlcD0eIR5COdkhS0Gzs7MS7YQHM2I9
 k1aieSgTyVEGEt7QOeTXJXaJkz16LEgnrCcsdHot0vGsLj7F+yGI6aTSArdkp/lte2
 LecRwrS/zrU1RLwO1KZw8IAiRc9ID68lHiobleLO3O/01SJhUsiqaRXNr2UN7DxDQU
 6uIdxK86cSIwk3JvsjwI/H5dPGHmkeyBb/tE+SPS+Oetn+MFlq+wNSf8umO30JSGI9
 g4Q8CPuKUIFEX1bdWFwulibFQjfn3d2Bui8cA6UUNc8rFr4srfry2wdznsiKRihF4j
 2F9n25Oo7zTkg==
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20211130103919.19428-1-kory.maincent@bootlin.com>
 <20211130103919.19428-2-kory.maincent@bootlin.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <1a9f0d17-f5a1-9617-1320-a9169b15307b@benettiengineering.com>
Date: Mon, 17 Jan 2022 19:47:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130103919.19428-2-kory.maincent@bootlin.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfEtytr2ZabXRJ8IvGORmkP665fpBHJRgz76mx3lHNHx2fdpskN3XahNdOAXRaDhzw4flCKnLzYLeRc7PcP2Tem5uK8Ol/a2Y3hPq70WB4XeRGev3vFvy
 PSxJtJlwV1Bci05ISvBar4Lqqo4exEYG+Kyd5lrmygCujnl1ntobQ0I4lfFAaCpxOOxT0n7zSmbab12tQvLLf1MPorxiKvYrIv3rpWFaB2evO9kbHuF1koWf
 4h3iTQYwxwYgKAATHPB5/pCdnQWJTaMWGuQtoMbOc3fhVTIxnWaOAwyuWhAKT6t1
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/octavo_osd32mp1_red: new
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

> diff --git a/configs/octavo_osd32mp1_red_defconfig b/configs/octavo_osd32mp1_red_defconfig
> new file mode 100644
> index 0000000000..1ff45429d2
> --- /dev/null
> +++ b/configs/octavo_osd32mp1_red_defconfig
> @@ -0,0 +1,59 @@
> +# architecture
> +BR2_arm=y
> +BR2_cortex_a7=y

as for patch [1/2] Here I think you should add:
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
