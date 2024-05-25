Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B02EC25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 14:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06EC6605FB;
	Sat, 25 May 2024 14:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuWzH178FfMA; Sat, 25 May 2024 14:15:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F067F605FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F067F605FD;
	Sat, 25 May 2024 14:15:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 211F81D05B6
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 14:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CD41403CA
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 14:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfQ-Fa5XzTv9 for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 14:15:47 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 25 May 2024 14:15:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DB99403EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DB99403EC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DB99403EC
 for <buildroot@buildroot.org>; Sat, 25 May 2024 14:15:46 +0000 (UTC)
Received: from [192.168.50.121] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id As4bse1W4wy3rAs4bs8GzD; Sat, 25 May 2024 16:08:37 +0200
Message-ID: <3f8e6ce5-d15c-429c-acdd-1f022d410dfe@benettiengineering.com>
Date: Sat, 25 May 2024 16:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
References: <20240524220421.710392-1-giulio.benetti@benettiengineering.com>
 <874jami5s5.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <874jami5s5.fsf@dell.be.48ers.dk>
X-CMAE-Envelope: MS4xfJPW2ZdJ/ou9FuTkP1rje0Uzli7VhvSPh0zDId0KAvpYeenj4bqGges6vVuNF37z+15/APxOQJVFnmzFFxE7oFusjpfAt/6UnDj9kjIvAyZ4sN831O5g
 NYzODGofEqLawB0emOhMAH32X2hwe/mUUx/T7nae7NReb67EA/Z8XqKgt0Uxgaa5qvHHsBKBDXoITJTlTdpTHM7jpBtTHFVv+5EieJ5U0W9TiHRiaPBOhZtL
 ICqiVgWDKzLSG9mlLOxQcDt+lmSgNY50/JQRyLMTM5Ihk3lFJHgYSfXmZAmwzEHx
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1716646117; bh=3PE+RNGJ5yyYsX0/x1Ua2kQ+/Vzx+cQStwgNbApIR8Q=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=hLj9eDJZG5ZIvSPjtGe9HsotRF6dbNfZMGQWrF0dnzh3tZIxgtRCtF8rBi2f53+7N
 1m08YJ7hqp9tVL8OKSvqK6TZRnj2QRKQ594lSeDRqmTBVPPZetdfo6iba7empvBs5a
 ZNqIn1jobu1xZ/MzeM1s80xXkugHfO6qlTOtufW4YYNZ61K8wmTSJppnbcbCjNrDlh
 oH7WUJmAChugMnlPz6UC/oGFVFq+X0HAYFC1uc7qk4opHtpFrQ1VwucPQaCZxgY0rN
 VFW6UYwUpzm2Q4IzngFLpcCvtj4a8ToWmXrp4hbJVC6+O1NtT15VaYZAhdV2Ws2s9R
 seGH1BzjcvBhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=hLj9eDJZ
Subject: Re: [Buildroot] [PATCH] configs/amarula_vyasa_rk3288_defconfig: add
 uboot and linux hashes
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 25/05/24 11:45, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>   > Add BR2_DOWNLOAD_FORCE_CHECK_HASHES and drop defconfig entry in
>   > .checkpackageignore.
> 
>   > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>   > ---
>   >  .checkpackageignore                    | 1 -
>   >  boot/uboot/uboot.hash                  | 1 +
>   >  configs/amarula_vyasa_rk3288_defconfig | 1 +
>   >  linux/linux.hash                       | 1 +
>   >  4 files changed, 3 insertions(+), 1 deletion(-)
> 
>   > diff --git a/.checkpackageignore b/.checkpackageignore
>   > index ebf320c3c5..9b9e4a61f9 100644
>   > --- a/.checkpackageignore
>   > +++ b/.checkpackageignore
>   > @@ -122,7 +122,6 @@ configs/acmesystems_aria_g25_256mb_defconfig lib_defconfig.ForceCheckHash
>   >  configs/acmesystems_arietta_g25_128mb_defconfig lib_defconfig.ForceCheckHash
>   >  configs/acmesystems_arietta_g25_256mb_defconfig lib_defconfig.ForceCheckHash
>   >  configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
>   > -configs/amarula_vyasa_rk3288_defconfig lib_defconfig.ForceCheckHash
>   >  configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
>   >  configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
>   >  configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
>   > diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
>   > index a8021fb696..b0ffd7e69d 100644
>   > --- a/boot/uboot/uboot.hash
>   > +++ b/boot/uboot/uboot.hash
>   > @@ -1,3 +1,4 @@
>   >  # Locally computed:
>   > +sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
>   >  sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
>   >  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
> 
> This is not right. You should add the hash to a custom
> board/amarula/.../patches/uboot/uboot.hash file, E.G. see commit
> 459c8c95c7 (configs/orangepi_r1_defconfig: add hashes for
> Linux/headers/u-boot) for an exmple.
> 

Thank you for pointing, I've misunderstood. I've sent a V2:
https://patchwork.ozlabs.org/project/buildroot/patch/20240525140641.1374683-1-giulio.benetti@benettiengineering.com/

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
