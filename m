Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B6FD70E01
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 00:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59E4A4078D;
	Fri, 29 Nov 2024 00:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id us9wgOhy4Fbx; Fri, 29 Nov 2024 00:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 352DD40538
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 352DD40538;
	Fri, 29 Nov 2024 00:53:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D1B1A6A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 00:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A6DF40151
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 00:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umc1au8keIel for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 00:53:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.2;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 144AB400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 144AB400C1
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by smtp2.osuosl.org (Postfix) with ESMTP id 144AB400C1
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 00:53:42 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-120 (Coremail) ; Fri, 29 Nov 2024 08:53:37 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 29 Nov 2024 08:53:37 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Julien Olivain" <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <1dbd915a5d0cab413a679724a42bd08b@free.fr>
References: <20241127032336.345826-1-andyshrk@163.com>
 <8acb5897b8fc142d1e91cf5e68bfb378@free.fr>
 <2486874f.8976.19371ec13aa.Coremail.andyshrk@163.com>
 <1dbd915a5d0cab413a679724a42bd08b@free.fr>
X-NTES-SC: AL_Qu2YAPSfvk4q4SOaY+kZnEobh+Y5UcK2s/ki2YFXN5k0qiTx3icwbG5AE1jE9fm/KwSmoQmXQjhw185jW61SUJh8rG8fO5laqJ+T/4Ci4aIl
MIME-Version: 1.0
Message-ID: <6547e4dd.9b3.1937568b7b2.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eCgvCgAnb1eREEln56AyAA--.62602W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g2mXmdJA4fwDQABsx
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=PmeWPJmlgAxGr0kbLMVyNGGraekzw+PLObgVdO6TWXg=; b=J
 lfBxPt8IfZvgk5BjxFnIB78jr4rQfILFtoY0NMkHZvkvldhfplDnGd7DctWqCLyC
 gwuPlRH+lqRieTUywxh84xMuQFlNsn3fbgqbCkSupPEvNFkd6oS4P6tlDk3kaVAm
 NRtUBIy1+o0rUFyWhZVpkrj8kL4VsYpLov2ay5/JaM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=JlfBxPt8
Subject: Re: [Buildroot] [PATCH] configs/rock5b_defconfig: Increase the
 filesystem size to 512MB
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

At 2024-11-29 04:59:11, "Julien Olivain" <ju.o@free.fr> wrote:
>Hi Andy,
>
>On 28/11/2024 09:38, Andy Yan wrote:
>> Hi Julien,
>> 
>> At 2024-11-28 05:58:49, "Julien Olivain" <ju.o@free.fr> wrote:
>>> Hi Andy,
>>> 
>>> On 27/11/2024 04:23, Andy Yan wrote:
>>>> The current 250MB filesystem size is not enough which will casue
>>>> failure like bellow:
>>>> 
>>>> Copying files into the device: __populate_fs: Could not allocate 
>>>> block
>>>> in ext2 filesystem while writing file 
>>>> "libharfbuzz-subset.so.0.60900.0"
>>>> mkfs.ext4: Could not allocate block in ext2 filesystem while 
>>>> populating
>>>> file system
>>>> *** Maybe you need to increase the filesystem size
>>>> (BR2_TARGET_ROOTFS_EXT2_SIZE)
>>> 
>>> Building this defconfig with the commands:
>>> 
>>>     make rock5b_defconfig
>>>     make
>>> 
>> 
>> I also run with the cmd above, but before that, I had compiled other 
>> board without doing a make clean,
>> and I'm not sure if the compilation results from the previous boards 
>> affected this compilation.
>> 
>> I try do make clean before make rock5b_defconfig, it did compile 
>> successfully.
>
>Since the build failure was due to an unclean build on your side and a
>clean build is working, I will not merge this patch (I'll simply mark it
>as rejected).

Fine.
Thanks

>
>>> succeed. See for example:
>>> https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067667
>>> 
>>> The filesystem size is usually increased when the defconfig is
>>> no longer building (without adding packages). So if you get the
>>> build error when adding packages to your config, you should increase
>>> the filesystem size to the right size for your project.
>
>Best regards,
>
>Julien.
>_______________________________________________
>buildroot mailing list
>buildroot@buildroot.org
>https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
