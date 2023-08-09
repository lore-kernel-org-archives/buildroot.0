Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEE3C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 18:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D1E1402F3;
	Wed,  9 Aug 2023 18:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D1E1402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f66H2ILue8F2; Wed,  9 Aug 2023 18:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24EF5402BE;
	Wed,  9 Aug 2023 18:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24EF5402BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2D451BF331
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC90E40126
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC90E40126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0ZsbEdDV982 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 18:23:23 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 09 Aug 2023 18:23:23 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 905A5404D1
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 905A5404D1
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 18:23:23 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id E0086240027
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 20:16:14 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4RLdXt3MXNz9rxB;
 Wed,  9 Aug 2023 20:16:14 +0200 (CEST)
Message-ID: <3fba804e-9cc6-ebb7-ce32-b9d402ed3d14@schwaericke.email>
Date: Wed,  9 Aug 2023 18:16:14 +0000
MIME-Version: 1.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221105194712.541286-1-gero@schwaericke.email>
 <20230217161521.01f4f2a7@windsurf>
Content-Language: en-US
From: =?UTF-8?Q?Gero_Schw=c3=a4ricke?= <gero@schwaericke.email>
In-Reply-To: <20230217161521.01f4f2a7@windsurf>
Subject: Re: [Buildroot] [PATCH] board/cubietech/cubieboard1: add Cubieboard
 1
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

sorry for the (very) late response. Thank you very much for the review! 
I'm working on v2 of my patch now.

On 17.02.23 16:15, Thomas Petazzoni wrote:
>> diff --git a/board/cubietech/cubieboard1/boot.cmd b/board/cubietech/cubieboard1/boot.cmd
>> new file mode 100644
>> index 0000000000..eefbdc8169
>> --- /dev/null
>> +++ b/board/cubietech/cubieboard1/boot.cmd
>> @@ -0,0 +1,7 @@
>> +# based on board/cubieboard2/boot.cmd
>> +
>> +setenv fdt_high ffffffff
>> +setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
>> +fatload mmc 0 $kernel_addr_r zImage
>> +fatload mmc 0 $fdt_addr_r sun4i-a10-cubieboard.dtb
>> +bootz $kernel_addr_r - $fdt_addr_r
> 
> There's no support for extlinux.conf in the default U-Boot
> configuration for this board?

I didn't even know u-boot could do that, thank you! :)

Best,
Gero
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
