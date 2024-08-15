Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A7BC52D7C
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 17:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8525F40C57;
	Thu, 15 Aug 2024 17:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lUikIDTPTy0; Thu, 15 Aug 2024 17:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 454BE40C67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 454BE40C67;
	Thu, 15 Aug 2024 17:58:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFCC01BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id EA33F40253
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 4nS2aiA2ywGL for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 17:58:32 +0000 (UTC)
X-Greylist: delayed 1319 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 15 Aug 2024 17:58:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B70F140243
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B70F140243
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=43.163.128.50;
 helo=xmbghk7.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.50])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id B70F140243
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 17:58:29 +0000 (UTC)
Received: from [192.168.100.247] ([106.120.7.242])
 by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
 id E8E262A5; Fri, 16 Aug 2024 01:58:14 +0800
X-QQ-mid: xmsmtpt1723744694tpub7m86i
Message-ID: <tencent_E7A8DE0B1508E4721AE5786DE26C9030BC0A@qq.com>
X-QQ-XMAILINFO: NGX5+lQVxpC+0zqo1urMqqWZT7SV/m20qMZd6kjhor9zFRrKqaq8Iio7FRU+gx
 cG//Y4ivUZEc4eQCq/KJFO1K7jB9W3wPbrFETJjlzaX/J+ZyXbIutleG4ObuhngbrnId/qfuBXdm
 zQ++tRxtvC4T2A76RKdANOe5h0uM258GbTLUCybcziqYjPnZ+DNYHDIkwMweSiQmOKxbss1dKJzN
 KEy4p/SgVGHAOdrqBk1cwuFDLlEJl0NXHFMuO/iaLQN2o+mNqc1zBqwo0YiKefxVMmekbWzObpUC
 MPmG8Pzj8PIdvzl4QA9u0CWs9yPf8pzbIH4Wdo1+Fha7IrMD2nwoteSqz8MRM+t8nI2lykEcdIbw
 T4sVd6NibowK/kyrBW6dsx38unVBDdHhD2y9nQO2fbA04vDJFmrAJJxX2vz71j+Kw2Y4ii6nEnlT
 OnanCtjdY1hdUfVEILzcCSGa2GjTyKXc6uEk3j110FRrXkCm5uBeF6hxHxAe2Bf8/Rz1SlSMDmbc
 z9PN6WGb59If+jzJCpoQAfvmEalP6OtV1bXKbyBAWvGA/LNBLU8s502WV9Ym24pdiyy0zBX3yCuQ
 NNsHqo6IPUFD5EEX0FpNQRrHgSW4CWnFYkxSKu9IfqSDm6vTb0xFUY0uCVPALpSIBeGDjq0wzrZO
 NMLbzVK17Zpf8mJJlXdGN2WQtIQSNVGgSNSoFB2WBrClEWlz9QahnYU15MdwkEOvkWV2YOCuqNkg
 foROUCaqLlVU7v7hOzxJzKrTeqNQhpQJrtoD4n8pUY9Jt89NgdYPvNfC/cDmes4iKNmK4MjSP9dw
 W/wc5xF6BTNc9nO72RwSzaM7SKkVIrMltSSc8MIMSgnJM6oI9WTVaAC+PoCZ8YBm0wAmUntCJEZK
 yWoin8i8svprBJmJv4fklD/yvvuQw+sPkZwU1tibcU9RSAfQtyDXAYzYgbpCrlIhguw1zp5twk+I
 r4i1qys0jAJG/WeYLdDWxFESOBTZfRhBFjIfRMgBGfK8c2vVJ1pVEAV/oHMw0KrKaBYgz+2LU=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-OQ-MSGID: <f25422a8-eca5-4e2b-95d2-8f75ea2e6505@foxmail.com>
Date: Fri, 16 Aug 2024 01:58:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <tencent_C2D6061483906AA710B3001B277F4EE62606@qq.com>
 <Zr4_46ILTkziZpJU@landeda>
Content-Language: en-US
From: Darren Wang <wangdong115@foxmail.com>
In-Reply-To: <Zr4_46ILTkziZpJU@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1723744695;
 bh=tr5pz6tyDjJq1N3QPB/XwN+wGag4OwDUZ7gFqhKrjAs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=I6waucYpxZaqVKnkojNqvqxx8ojgIGJI0+NP/OL3bGgwqmTSP4wW7pe9IaL5cNErp
 pFn9dLXpRMaqC9kAEZT2ayaSB2gdNoacZllfp6ODM8eRPWP4qqKS2Ax6NelWBaUHs2
 FwS+tA8Y49NXMZtgwRgqqGDjEwKOrtRSifhM/Jr4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=I6waucYp
Subject: Re: [Buildroot] [PATCH next] board/friendlyarm/nanopi-neo: fix
 uboot partition size
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 2024/8/16 01:50, Yann E. MORIN wrote:
> Dong Wang, All,
> 
> Thanks for your contribution.
> 
> On 2024-08-16 01:28 +0800, Dong Wang spake thusly:
>> This patch fixes the wrongly calculated uboot partition size in
>> genimage.cfg. The size should be 1016K, which is
>> 1MB (typical partition start) - 8K(offset dictated by the bootrom).
> 
> It seems you are using an old version of Buildroot, as the defconfig
> and board files for nanopi_neo were removed with commit c0a44ba0dfbf
> (configs/friendlyarm_nanopi_neo: drop defconfig), in August 2022, two
> years ago. >
> If you are still using nanopi_neo and have access to that board, then
> you are welcome to submit it again, of course!

I already did! See 
https://git.buildroot.net/buildroot/commit/?id=4265790541e925708364e1e86038bd2884eec3a5 


This is an follow up on the above commit to resolve Thomas's comments!

> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Dong Wang <wangdong115@foxmail.com>
>> ---
>>   board/friendlyarm/nanopi-neo/genimage.cfg | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
>> index ec78fd0e56..8d6bdd3295 100644
>> --- a/board/friendlyarm/nanopi-neo/genimage.cfg
>> +++ b/board/friendlyarm/nanopi-neo/genimage.cfg
>> @@ -7,7 +7,7 @@ image sdcard.img {
>>   		in-partition-table = false
>>   		image = "u-boot-sunxi-with-spl.bin"
>>   		offset = 8K
>> -		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
>> +		size = 1016K # 1MB - 8KB(offset)
>>   	}
>>   
>>   	partition rootfs {
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

Thanks!
Dong Wang

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
