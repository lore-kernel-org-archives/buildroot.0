Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CEBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 00:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 772E260FFF;
	Fri, 22 Apr 2022 00:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EgLamSCm_d6z; Fri, 22 Apr 2022 00:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 888FE60EC9;
	Fri, 22 Apr 2022 00:11:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 641341BF284
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 00:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5237F60EC9
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 00:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mFJ42FM0NPMF for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 00:11:05 +0000 (UTC)
X-Greylist: delayed 00:15:13 by SQLgrey-1.8.0
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86A9460EB3
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 00:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=I6RhC
 62dLqjbRAB1VVhsmhs/+olP/TIzJilTOnWs+ew=; b=OclDhHd/SlnUTrfr49PAH
 gkHlx1f0C2rhk0BpzW/Th/L6IG6Qhi0tsEyW//zr0rWb4r5igE6vJ2eAF7AOiuIi
 de6DCrkFvbMuUkWEYKcwzoIk+k6mNon46IwFYbvb/Gu2BZC1eS9OkGb64iVtqW7M
 jo/fiFV0dDuxxovyfrNwQk=
Received: from [192.168.31.190] (unknown [123.185.181.60])
 by smtp13 (Coremail) with SMTP id EcCowAC3x0ME72FiDqjcCQ--.61377S2;
 Fri, 22 Apr 2022 07:55:48 +0800 (CST)
Message-ID: <0fd2d0f7-d067-0f65-23dd-68aff1e61d94@163.com>
Date: Thu, 21 Apr 2022 16:55:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220420135549.3536397-1-tianyuanhao3@163.com>
 <20220421191653.GO2730@scaer>
From: TIAN Yuanhao <tianyuanhao3@163.com>
In-Reply-To: <20220421191653.GO2730@scaer>
X-CM-TRANSID: EcCowAC3x0ME72FiDqjcCQ--.61377S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWrJFyDJF4fJFWxKr48Zwb_yoW8AFWfpw
 4rAF13Kr18Wr1Ika4jg3WIvr15ZrZYqw4UJ3sxC3WxtFyUGr1kKr43trWYqrW7X3yfCw4U
 Aa17Kw15Ww1rZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTuWJUUUUU=
X-Originating-IP: [123.185.181.60]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXADpjVXl2WukyAABsX
Subject: Re: [Buildroot] [PATCH] package/systemd: add the missing sgx group
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 4/21/22 12:16, Yann E. MORIN wrote:
> Yuanhao, All,
>
> On 2022-04-20 06:55 -0700, TIAN Yuanhao spake thusly:
>> systemd-udevd needs this group:
>>    /usr/lib/udev/rules.d/50-udev-default.rules:43 Unknown group 'sgx', ignoring
>>
>> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
>> ---
>>   package/systemd/systemd.mk | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>> index b07fac27d4..44185a35a0 100644
>> --- a/package/systemd/systemd.mk
>> +++ b/package/systemd/systemd.mk
>> @@ -603,6 +603,7 @@ endef
>>   
>>   define SYSTEMD_USERS
>>   	# udev user groups
>> +	- - sgx -1 * - - - SGX device nodes
> This should have been in the udev virtual package, as all the
> udev-related users and groups have been moved there to be common between
> systemd-udevd and the stand-alone eudev, in commit d648d81dd581
> (packages/{eudev, systemd}: move common users to package/udev).
>
> Applied to master with this fixed, thanks.
>
> Would you be kind enough to send a follow-up patch that removes the now
> misleading "# udev user groups" comment, and adds a comment, in systemd
> and eudev, that directs changes to the udev virtual package instead,
> please?
I did notice the common rules in the udev virtual package. However "sgx" 
only appears in systemd but not eudev. Besides, I found that the 
"render" group in systemd should be "video" in eudev.

Regards,
TIAN Yuanhao
>
> Regards,
> Yann E. MORIN.
>
>>   	# systemd user groups
>>   	- - systemd-journal -1 * - - - Journal
>>   	$(SYSTEMD_REMOTE_USER)
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
