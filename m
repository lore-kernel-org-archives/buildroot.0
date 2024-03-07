Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AADEC54E4A
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 19:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87A39820C8;
	Thu,  7 Mar 2024 19:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_mQdUV8u5KT; Thu,  7 Mar 2024 19:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A327982D2F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A327982D2F;
	Thu,  7 Mar 2024 19:54:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A3DC1BF399
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 19:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33CC7606B4
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 19:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WsCwUnahmcxu for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 19:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A35076066B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A35076066B
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A35076066B
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 19:54:46 +0000 (UTC)
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id iJpErKYWzHsqHiJpFr6Jwv; Thu, 07 Mar 2024 20:54:45 +0100
Message-ID: <5df40367-a8de-4d95-a3da-e3d1ba805c70@benettiengineering.com>
Date: Thu, 7 Mar 2024 20:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240307195233.2186701-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240307195233.2186701-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfLCadMrQBDJ4LEVFdTTXllkfaz9BtCo4vBBWCesr6epQnwBdilrgqk/wFkMHiqfaU6VwR48xCkcnQ2WE/+3ILCobo8iUSDiRkkO55WcyHpgqj2Xa4a6f
 oEQr+MVXG5j/oVg5WTl87NP87O+eM2YK6gqMuWIe83QEJyQmCt9klrLI0kOL/6x78oFdKW0K7aQhX8UecJpk8q322QMlIww+phLPvL0OsfMXqjrNo/JKcvQW
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709841285; bh=HaQ2UKzzbTOEyNPpxS6Yx6+RpRjWNhzF+H0uXj/Jtp0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=fUH0mtOGq5Bx+WqEPgr7S3Rbz6VPwlA1NV/NHzuutrxeSdCQqeRZLpgUo5NYuZ/LO
 36WeijUM7P3t2DE5jI9PStbU+ouT1KlCO+G/q11uvfV0Emd3QAxuU9suUM0mmhCiMl
 dh+FnNVsqNtktsFVtodczxV4OpPn+spvutZV1bmqA63fNNdeO8Uo+1jv2JUsad07yV
 ZEr3xIB6BZlmTCDC1Hw9gUChHvoQOM/r0ifIYS1YOBImRtapg9jeNYoZkpbrjzXZrJ
 WvOPx/JWNT45xc8qUKWqHBIaQXOIvBl2r1IkMkzvgm8i9vsUnfZ7zgQdkV3sQYirim
 jo2neW5hMex4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=fUH0mtOG
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: bump version to
 2024-03-05
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pardon, this had to be V2

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

On 07/03/24 20:52, Giulio Benetti wrote:
> Fixes:
> http://autobuild.buildroot.net/results/06f972f95f4f2e0e7504b1fa069b89695b7377ef
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/mmc-utils/mmc-utils.hash | 2 +-
>   package/mmc-utils/mmc-utils.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
> index cd9d13324f..2c1bb86066 100644
> --- a/package/mmc-utils/mmc-utils.hash
> +++ b/package/mmc-utils/mmc-utils.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  84be5003ae83b4fdb0279a693f320fd472aebd14908a1ac16bda4f675e92ad40  mmc-utils-80271e9a6fd0db9cb3a85d024664da886e94315c-br1.tar.gz
> +sha256  83b1bd7602b0c8d05a8ff2f842d80fa7c9a0b084b7159bb9eed796b0075b94d1  mmc-utils-e1281d4de9166b7254ba30bb58f9191fc2c9e7fb-br1.tar.gz
>   sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
> diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
> index ef4d97c1ca..48c347d846 100644
> --- a/package/mmc-utils/mmc-utils.mk
> +++ b/package/mmc-utils/mmc-utils.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MMC_UTILS_VERSION = 80271e9a6fd0db9cb3a85d024664da886e94315c
> +MMC_UTILS_VERSION = e1281d4de9166b7254ba30bb58f9191fc2c9e7fb
>   MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
>   MMC_UTILS_SITE_METHOD = git
>   MMC_UTILS_LICENSE = GPL-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
