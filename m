Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB0EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 00:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82856401EA;
	Mon, 14 Feb 2022 00:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2sxNMVFbQvB9; Mon, 14 Feb 2022 00:03:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2B69401C5;
	Mon, 14 Feb 2022 00:03:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66EDD1BF95F
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 00:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FE67401C5
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 00:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sl7CMeeqddhu for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 00:03:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17C29401C3
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 00:03:10 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JOphnjhRUXmFAJOphnvQfi; Mon, 14 Feb 2022 01:03:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644796989; bh=TSk2Jajg/nWjzgybT5ZegnR/PZw03Ph8FSKvMjWnjiQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EdVD45hJM5CE+w4oe/0VsBy0LvvwC/WwCMf2xgzLYlD31TB3HRdbPsV9BDK+JJ25f
 yzPn3KGdX/HMngo/1VOTnTD1aYbRtfS6kMBfR9G3a/hCSvOQzdr2FsWKKvVKBibBkL
 ryynrL3dSzLH5QIJ+xfHEyT+BbkcYE7YO8G3iqhGvjTRWapz7Lx1A+EJAnczs1ByFb
 RwvbVdST32u8v6c+s/k6YcTudjxUfjH6SCrbCly8zXlCGxDfR/pfVShVIig1H9NizD
 ukI7ekyU8jrCmLtWgXT3Rh6YOdBU3QnlJktMx7J7n+CHj5m6W3UvH0KntPlyeHeiJ1
 +64eUnsIHDPWg==
Message-ID: <cb93cb6a-c8ae-0975-6ae0-14ad369de9e2@benettiengineering.com>
Date: Mon, 14 Feb 2022 01:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220202171035.1740791-1-giulio.benetti@benettiengineering.com>
 <20220202171035.1740791-2-giulio.benetti@benettiengineering.com>
 <c3a9cf08-fb79-580d-f1e6-79ef28b46263@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <c3a9cf08-fb79-580d-f1e6-79ef28b46263@mind.be>
X-CMAE-Envelope: MS4wfJKXFnbJeIjJm1rR3lXMiQsn4jiEB5RzxQE1XmkwRHw3pU0M2ByiKoE3z4iszKYVdtj2nyd2uyBo696ye5dX/qZnEJQ947aisXlUBoFBoXFOrIGQB2Vp
 KVXNdh+2mjM5N2zRWxkmA/bBSB4yroa403+t47OpEptYsj9NBh7cGG5bnhrmZiRkM6QSv4PdU97cFRwQGPhpLMF62xnoLVg0TgkHWgUINmTIkfWXviGeWsS2
 Thv8GeizwxPHbjDF9GkhOa3hHoOdKnCw9E19fF/li99LkK6vykptyKkGPqVAfSPcNnlDk5sDDVq3wztJ9oGQnnsRzqmrLL15Ckvi2MLbm4U=
Subject: Re: [Buildroot] [PATCH] configs/roc_pc_rk3399_defconfig: expand
 rootfs size to 120M
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
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Danilo Bargen <mail@dbrgn.ch>, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On 13/02/22 12:35, Arnout Vandecappelle wrote:
> 
> 
> On 02/02/2022 18:10, Giulio Benetti wrote:
>> Default 60M for rootfs are not enough and generate a build failure, so
>> let's expand rootfs size to 120M.
> 
>    Did you find out _why_ 64M wasn't enough for just the kernel and busybox? Is
> it because of all the stupid modules in the default arm64 defconfig? But most
> other arm64 defconfigs don't seem to need this...

It is because of modules(30M) and linux "Image", it's not compressed, so 
it's 25M. So only for Linux+modules => 55M, plus the few other 
stuff(Busybox+libc etc.)1M

Also, nothing changed since the beginning, so I don't know how could 
this happened:
# git log --oneline configs/roc_pc_rk3399_defconfig
f51cbc33d9 configs/roc_pc_rk3399: fix U-Boot dependencies
80ae1aedcb configs/roc_rk3399_pc: new defconfig
# git log --oneline roc-rk3399-pc/
80ae1aedcb configs/roc_rk3399_pc: new defconfig

U-Boot dependencies are host dependencies, so it doesn't impact.

# git log --oneline fs/ext2:
5ece6be60b fs/ext2: fir (again) namespace for variables
db7d786140 fs/ext2: fix namespace for variables
5631c38024 fs/ext2: pass a default string to filesystem label
...
here board has been added

So it doesn't seem a ext2 problem too.
I can't understand how it could be building in the beginning.

We have 2 solutions:
- expand rootfs
- use a compressed linux Image.gz(25M => 9M), but need target testing

Honestly I don't think systems with SoCs like RK3399 have problems with 
56M more, so I would go with expanding rootfs to 120M and if maintainer 
in Cc wants to shrink Linux and target testing it is welcome to send a 
patch.

What do you think?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>    configs/roc_pc_rk3399_defconfig | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
>> index dfbc5e4f47..ae7cf19a80 100644
>> --- a/configs/roc_pc_rk3399_defconfig
>> +++ b/configs/roc_pc_rk3399_defconfig
>> @@ -45,7 +45,7 @@ BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
>>    BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
>>    BR2_TARGET_ROOTFS_EXT2=y
>>    BR2_TARGET_ROOTFS_EXT2_4=y
>> -BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
>> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>>    BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>    BR2_PACKAGE_HOST_GENIMAGE=y
>>    BR2_PACKAGE_HOST_MTOOLS=y
> 
>    Unrelated by this patch, but the image doesn't have a FAT partition so
> dosfstols and mtools aren't needed.
> 
>    Regards,
>    Arnout
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
