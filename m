Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EB8C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 22:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC48D83E85;
	Wed,  2 Feb 2022 22:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SS4HumD30qUg; Wed,  2 Feb 2022 22:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8EBC83E60;
	Wed,  2 Feb 2022 22:22:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9419F1BF5DE
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 22:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82B4E409B1
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 22:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTcr_8yLYWzz for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 22:22:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D9E6409A6
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 22:22:31 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FO1EnTrh6kz4hFO1FnvRFh; Wed, 02 Feb 2022 23:22:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643840550; bh=ziITKKKySWzbOGor2hKGGAMR23EIoSxGwL090vXtSIY=;
 h=Date:MIME-Version:To:From:Subject:Content-Type;
 b=SFYu/4bAnV+Ga0Jo5VIE5pbHhjft2zKpUQnroRqYPAasHF7Edoq1TwktnsHJ8J/b9
 pWGFUXhz5kjUYrhoYWYj34nmH+5J3hSMug+Rq7eyNHAtr52PIv+xbeD224sHD8E0Wl
 ffAUi1RXgp2WrAx/LJHrsE/21F997mPEd/DNetUppL6VyD66gtOagP/YSU+iKek2Iz
 6Un3kTJlXWA79JcisLxLwDkwd67QdVcnBcEFsy/zhd7wT0ThkKPyBZ91e5nyasFSbs
 x3W6trNuiUG/eqrh3FG09AK4UmDP8ShFshBPLCuBBtSMQtQERmjWtfsX75eli+fRcB
 /ad41ae8SL+GQ==
Message-ID: <d046141a-5913-b486-24fd-8f631df7c515@benettiengineering.com>
Date: Wed, 2 Feb 2022 23:22:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Guo Ren <ren_guo@c-sky.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4wfMh4Kft6IVZpCPaK3Gvquh+VJjkC3nJ1WIbMFDfKHu5gfOiv4R+8GXnfHbomwv63eMtxQQW32fmwsPtTRNAp0Kz7RpbxD1LhmczWkvzhF9AeT5ALrPaF
 qKonTJzCuwpiunJt/OgqS/Q+VQ/CTdDLqKHHQbu9MhYLR9ftSCgEIaMfFJTq0goR4/fKvCWCUIzjLhecnWOBpgk2WWYL618jKJKzX/8pUsT8XMCaFNPHQZia
 2UwsoTNdrxBYONFLCrjyTwhaD8nKE9hJJMndgkXnuoBh+im/4mfZgSstOr0hkEJibhxTDgdOnZxBZc4t8VlCrXMQf3zc2svDNjWow4F5oqSeT1vB8BpCbOLS
 0TW68fYGZ7WKtRmgOr+Y5k3JmBCRWg==
Subject: [Buildroot] csky_gx6605s build failure
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Guo,

I'm dealing with gitlab-ci failures, including csky_gx6605s_defconfig. 
What is missing is basically the toolchain. Buildroot can't build a 
tooclahin for C-Sky at the moment(we should wait until gcc 12 if it will 
keep ck610 variant). So my idea would be to add an external toolchain 
your company could provide with a stable URL to make this defconfig to 
build successfully instead of dropping it. And once gcc 12 is released 
and added to Buildroot we can drop the external toolchain and use the 
Buildroot's one.

What do you think?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
