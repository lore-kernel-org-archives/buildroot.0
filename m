Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A775EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 13:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08CE161191;
	Wed, 12 Jul 2023 13:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08CE161191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiGEKurc_TTC; Wed, 12 Jul 2023 13:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3991A60BEF;
	Wed, 12 Jul 2023 13:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3991A60BEF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6A781BF97D
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 13:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD21B403A5
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 13:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD21B403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id un9bngo0cIQc for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 13:32:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80FF6400CC
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80FF6400CC
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 13:32:12 +0000 (UTC)
Received: from [172.25.4.220] ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JZwuqNQR61ZFgJZwuqzkBi; Wed, 12 Jul 2023 15:32:09 +0200
Message-ID: <ff5f4d3c-3333-9a4a-20c9-a8d3af97cf1b@benettiengineering.com>
Date: Wed, 12 Jul 2023 15:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US, it
To: Jamie.Gibbons@microchip.com
References: <67c6e46540dc806e0755ac377ba868da01ad3116.camel@microchip.com>
 <acaea49f-df76-ac2f-51ed-cc855cf23f28@benettiengineering.com>
 <6bc39779544345114acaf33fdf95176c5fd8af7d.camel@microchip.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <6bc39779544345114acaf33fdf95176c5fd8af7d.camel@microchip.com>
X-CMAE-Envelope: MS4xfM1Bx9v7agmyLYA4TVBNlSKke/c9+T7bkoFWT6atrof23dETuoNfvi6BIw6B4CqlIS8Vz6Rbap+gEPld/3zF4agfgiVcM4hETpRpJSB84H5a63S0kLHr
 DX5KvRab68GCVwd/PJ3sPv7WvY8354EZo5XPq3AvPPpxS29m5w43Sve1GcLZD5BZd+qgXAb0mR3eI1zsoEtREelhGPoNs7AveolNLr73o3Kmd1IZ7Pb4kNt5
 KBsjtm+4Wm/cymcMxJKYpy9cw3fDdCT8sqE4jiNSXGKLD6o50RnwdgpQchdSQuV0QtPRLlzVy/fzAwfkjvjtJKoEsdHh1p8uT48tCZYJCLe4xNQXuZ4xN+Ae
 K8vY9sofvcZBpFkObt5pOdaxeEPCXLq2F63SQYSoUa2GYaKlTuimEXy+0mMBoSP1E6lQ5HZmN7Q+cVGOb4z6V2DT+4Fx1WFgpfOklgvSMT1nqjKHBRR27Eoh
 krmdbtcMb/4KUO/K
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689168729; bh=q+25mNaYztbDLrC3d6mRJdRpxq4J3/wwosQQNZW0gmI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=oIO/BvvsPXyFx9OXQ/7gx/rpf6bVkKI64hyBq73qRkEJlQIWSRic0aarxeSq+kjQb
 VC0wpjslagN/4orQniGyDk0Ic31sQjKqjmZSMIZkh3HG+K3rlxMnnus+iwwWg60nXS
 20m5fjL2jUnEbRVPnKTmafUAxuu+zAg4+DvScKVz3ctD0OyjDU0TH5wBorvRuAjxUU
 w1CsLbZLmzYod6mEPsb7nQTRs2A5/zEzVfbdYaYJXr3pLGgEscv0QolwwF2EkGaOyr
 pXOr2FBTqZg1gZ5fG7If+SlLaFu5eStrAoTafE5Ov7bZf2mhPdPRIbJ0k2nTPjncKz
 UGYlTkFnXFQmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=oIO/Bvvs
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
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
Cc: Conor.Dooley@microchip.com, Nicolas.Ferre@microchip.com,
 Ludovic.Desroches@microchip.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, Valentina.FernandezAlanis@microchip.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/07/23 14:48, Jamie.Gibbons--- via buildroot wrote:

[ SNIP ]

>>> I have ran a test build, check-package and shellchecker (and fixed
>>> all
>>> errors that cropped up) with utils/docker-run but have not found
>>> this
>>> error mentioned above without adding
>>> 'BR2_PACKAGE_HOST_DOSFSTOOLS=y'.
>>> Could you expand on where you are seeing this?
>>
>> That package adds host mkdosfs utility that is used by genimage while
>> creating boot.vfat partition in the final image.
>>
>> So this is the build fail log using utils/docker-run:
>> ```
>> INFO: hdimage(sdcard.img): The option 'gpt' is deprecated. Use
>> 'partition-table-type' instead
>> INFO: cmd: "mkdir -p
>> "/home/giuliobenetti/git/upstream/buildroot/output/images"" (stderr):
>> INFO: vfat(boot.vfat): cmd: "mkdosfs
>> '/home/giuliobenetti/git/upstream/buildroot/output/images/boot.vfat'"
>> (stderr):
>> /bin/sh: 1: mkdosfs: not found
>> INFO: vfat(boot.vfat): cmd: "rm -f
>> "/home/giuliobenetti/git/upstream/buildroot/output/images/boot.vfat""
>> (stderr):
>> ERROR: vfat(boot.vfat): failed to generate boot.vfat
>> make: *** [Makefile:815: target-post-image] Error 1
>> ```
>>
>> It should be the same for you. By the way, are you using latest
>> commit
>> on master branch? This is because docker changes from time to time
>> and
>> maybe the one you're using could have mkdosfs already installed, but
>> it's unlikely.
>>
>> Let me know the results.
>>
> 
> Hi Giulio,
> 
> I am not getting that error from genimage in my docker container. I am
> using the latest commit on the master branch: commit
> 876ad67ac07be4b7900a4ea6464e7459e2b40604. I will add the package anyway
> to avoid this error cropping up for anyone else.

Pretty strange, it should really give you the build failure above
because of docker. It is exactly its purpose..

Anyway yes, soon or late that error will show up, so better to add
BR2_PACKAGE_HOST_DOSFSTOOLS I've pointed you.

Best regards
-- 
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
