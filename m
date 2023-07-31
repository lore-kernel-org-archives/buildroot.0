Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F09C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 15:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58505610B7;
	Mon, 31 Jul 2023 15:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58505610B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zFT8RTuK7iH; Mon, 31 Jul 2023 15:02:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99050610A8;
	Mon, 31 Jul 2023 15:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99050610A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2B251BF37F
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 15:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BF9580F46
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 15:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF9580F46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7XA7b49ppsUb for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 15:02:21 +0000 (UTC)
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D467480F26
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 15:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D467480F26
Received: from [172.25.4.220] ([212.103.203.10])
 by Aruba Outgoing Smtp  with ESMTPSA
 id QUPaqcu9xOldaQUPaquLf1; Mon, 31 Jul 2023 17:02:18 +0200
Message-ID: <4df8a509-83da-e0ef-f92e-d708e4d959e6@benettiengineering.com>
Date: Mon, 31 Jul 2023 17:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US, it
To: Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230726202838.1931660-1-christian@aperture.us>
 <20230726202838.1931660-3-christian@aperture.us>
 <a9b895f5-5136-6d92-34a7-ada38a3da21f@benettiengineering.com>
 <20230731164321.615664d5@windsurf>
 <CA+h8R2pz8HTe3DRdSkrh1CwwDy427YWJJBcXN_gh-mPmkPU0WQ@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CA+h8R2pz8HTe3DRdSkrh1CwwDy427YWJJBcXN_gh-mPmkPU0WQ@mail.gmail.com>
X-CMAE-Envelope: MS4xfF+sTw4+IeMnb9ewJUcmY040ZmazhxQ0iRneH1o6FOzceI86Syg0qJhb97tNhnndlf4qHTrQLR/7DAFtYaTLvTNO5nT0eVVTXYtbomaOT0yP5+Gcm8kk
 sSnDOio/bMabqo0E+407kPEYR8U51aOG6NYq7fXlr0SOrEGHHE2vXQbIVFx8SRds+U9utU+M803h1J4ftaekc2f6sBtOYo5CXBJgdO3c4DWZ/TZT5ysI9lHM
 oLOGDwK73CSr8ySlmoSoBwcrLnKeFdH9mqn8pXTksc+HoewJigwilCm9DsTCpRq/RshdKPIelDSMwtA/Lcf/bYZkkukCaLdBbBU2sBOs9RI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1690815738; bh=tMRBgQtjifFVHmyOiJ1knSTfKpqS7fBabFt2OppP9dM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=duMntPg9m+M2wqV74aMRDzMbWEwLeAxh9ruavq7pYfTEr9X6m43GwZtFzz08kicvj
 dVQBpz3jBEYMAwnL8bmW+7wMqATrK2nRIXhWLlkqg6+aPg3B0PTR5fYzooqzmKBFBu
 NOGJv/RE7mtszlzMsJBZOORK5QGEp0iBo3fj8ZmTkTb1HSesNlBbvz30C/Iv75Wt25
 laJBOKs724QBkBhH8bpp2TOEq9VBV5SYZJvc0MGtCTCU/zDM372Q3AMS8Y+FdnBU//
 bae6BcLIC4Zq0des14N9lHvWg4fbmCiDn6k+WQnCjCIpDBk9EyrilbZk6f2IuyNaVc
 auuy3MpFGUiWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=duMntPg9
Subject: Re: [Buildroot] [PATCH v1 3/3] boot/uboot: add host-python-pylibfdt
 dependency if needed
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 31/07/23 16:56, Christian Stewart via buildroot wrote:
> Thomas,
> 
> On Mon, Jul 31, 2023, 7:43 AM Thomas Petazzoni 
> <thomas.petazzoni@bootlin.com <mailto:thomas.petazzoni@bootlin.com>> wrote:
> 
>     On Mon, 31 Jul 2023 16:10:48 +0200
>     Giulio Benetti <giulio.benetti@benettiengineering.com
>     <mailto:giulio.benetti@benettiengineering.com>> wrote:
> 
>      > U-Boot approach for this is to force Python3 to build libfdtpy[1]
>      > but what we experience here is a consequence of Buildroot's commit
>      > 231d79c81e9a1f8c2ef14861374a40fcdc5e6b33 [2]
>      >
>      > Something happens after that patch has been applied that basically
>      > passes Buildroot's host dtc to UBOOT_MAKE_OPTS:
>      > ```
>      > UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
>      > ```
>      > The root cause seems to be Python3 anyway as U-Boot patch points.
>      >
>      > Since we can't patch every U-Boot version we could fix Python3 but
>      > using the approach proposed by Christian is easier to be honest.
>      >
>      > To prove it's a Python3 issue you can see from one of my Gitlab-CI
>      > failure[3] that various U-Boot versions are different, not the last
>      > one(2023.07).
> 
>     Hm, thanks for your feedback, but even after reading 3 times your
>     e-mail, I still don't grasp what's going on. You've pointed out that
>     Buildroot commit 231d79c81e9a1f8c2ef14861374a40fcdc5e6b33 is when build
>     failures starting to occur. But what's the relationship between setting
>     DTC and U-Boot having issues finding pylibfdt?
> 
> 
> If DTC is set the uboot makefile attempts to use the external python 
> package instead of building the internal one

This ^^^ is what I've meant :-)

-- 
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
