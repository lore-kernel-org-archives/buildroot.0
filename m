Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF109C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82834400C1;
	Wed, 10 Jan 2024 20:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82834400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xG8MdkFS1H6y; Wed, 10 Jan 2024 20:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63F16436D7;
	Wed, 10 Jan 2024 20:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63F16436D7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D3531BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8051A436D7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8051A436D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GpM3g3XM5B4Z for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:48:01 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BAFC400C1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BAFC400C1
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9644B13F86E;
 Wed, 10 Jan 2024 21:47:56 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37300])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 10 Jan 2024 21:47:56 +0100
MIME-Version: 1.0
Date: Wed, 10 Jan 2024 21:47:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240110213532.3e12945b@windsurf>
References: <20240106153539.570324-1-ju.o@free.fr>
 <20240110213532.3e12945b@windsurf>
User-Agent: Webmail Free/1.6.5
Message-ID: <9fc74b711d1e78be971c33e5179cefb9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704919677;
 bh=77fldvHoISECbt9dbUlh81StgioloLodHguUz6RdSew=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZdBkcE7uMe4xS0E0+ABbSZ+OOwoLCheo9kngpo/pvLPXa8u6Om+Lq29gbeH+bdG5k
 A9UX4d9Hnu/YvkxkP0z5E04rgghx/ByPWKbtob8riPHt+K2+8s6XzgPjB9umtXnoWU
 oEa+urk57S412WHe5HD4pDjAyBf2aHeqmcZl58PuSCwtHJCBgHA4ft37l7mncsExXO
 P08WBy5fCvraZx0LEie5qVDNgKFIHcJov9h15Xv7h5Gwnb9w5oDGiNHtMNeCjv8Exm
 7wmhAT/hcPjATpdpcrF8Ai0i/dhmSgYhivYOaMKwIbNON6YyvjrLaokbAB4jtXQ53E
 miLj39pwQveWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZdBkcE7u
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mmpico: uboot needs openssl
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 10/01/2024 21:35, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Sat,  6 Jan 2024 16:35:39 +0100
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> Commit 78e8f383 "configs/imx8mmpico: bump bsp components to version
>> tn-kirkstone_5.15.71-2.2.0" bumped components, but forgot to add
>> BR2_TARGET_UBOOT_NEEDS_OPENSSL=y.
>> 
>> This commit adds it to the defconfig to fix the build.
>> 
>> Fixes:
>> - https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180248
>> 
>>     In file included from tools/imagetool.h:24,
>>                      from tools/aisimage.c:7:
>>     include/image.h:1166:12: fatal error: openssl/evp.h: No such file 
>> or directory
>>      1166 | #  include <openssl/evp.h>
>>           |            ^~~~~~~~~~~~~~~
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>>  configs/imx8mmpico_defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/configs/imx8mmpico_defconfig 
>> b/configs/imx8mmpico_defconfig
>> index c402ea675d..711cdeb390 100644
>> --- a/configs/imx8mmpico_defconfig
>> +++ b/configs/imx8mmpico_defconfig
>> @@ -28,6 +28,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>>  BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call 
>> github,TechNexion,u-boot-tn-imx,tn-kirkstone_5.15.71-2.2.0_20230512)/u-boot-tn-imx-tn-kirkstone_5.15.71-2.2.0_20230512.tar.gz"
>>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Puck-imx8mm"
> 
> This doesn't apply here, as this line doesn't match what we have in
> Buildroot. Is this "Puck-imx8mm" normal? We have:
> 
> BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mm"
> 
> Could you check this?

Yes, this should be BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mm".
This got mysteriously corrupted.  I'll send a v2 right away. Sorry about 
that.

> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
