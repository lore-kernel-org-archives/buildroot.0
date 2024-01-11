Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D607CC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 10:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77556400CE;
	Thu, 11 Jan 2024 10:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77556400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXpz-pPGvHqT; Thu, 11 Jan 2024 10:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F5254384A;
	Thu, 11 Jan 2024 10:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F5254384A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3F801BF277
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78D5381E36
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78D5381E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOJ96JTCZ1Yv for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 10:59:16 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by smtp1.osuosl.org (Postfix) with ESMTP id 173CC81DFA
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 10:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 173CC81DFA
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
 by mx.socionext.com with ESMTP; 11 Jan 2024 19:59:13 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
 by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 804CD2059034;
 Thu, 11 Jan 2024 19:59:13 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with
 ESMTP; Thu, 11 Jan 2024 19:59:13 +0900
Received: from [10.212.157.42] (unknown [10.212.157.42])
 by kinkan2.css.socionext.com (Postfix) with ESMTP id 4660AA8521;
 Thu, 11 Jan 2024 19:59:13 +0900 (JST)
Message-ID: <570f6610-82bb-d46a-d376-75f3dbfea6e9@socionext.com>
Date: Thu, 11 Jan 2024 19:59:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231220105623.192609-1-hayashi.kunihiko@socionext.com>
 <ZZ_FC9OGQsHjJvFV@landeda>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <ZZ_FC9OGQsHjJvFV@landeda>
Subject: Re: [Buildroot] [PATCH 1/1] package/eudev: add sgx group for
 eudev-3.2.12
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 2024/01/11 19:38, Yann E. MORIN wrote:
> Kunihiko Hayashi, All,
> 
> On 2023-12-20 19:56 +0900, Kunihiko Hayashi spake thusly:
>> The eudev has "sgx" group in 50-udev-default.rules as default
>> since commit 247724da450b.
>>
>> The group is defined by package/systemd [1], however, when
>> enabling BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y with
>> qemu_aarch64_virt_defconfig, the systemd isn't used and the following
>> warning occurs:
>>
>>      udevd[153]: specified group 'sgx' unknown
>>
>> Just add sgx group to the package/eudev.
>>
>> [1] https://lists.buildroot.org/pipermail/buildroot/2022-April/641079.html
>>
>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> 
> Peter has sent a better patch, which I applied:
>      https://gitlab.com/buildroot.org/buildroot/-/commit/edfa9ea45ce3c2ddad2c52ab57a8047f4257c76f
> 
> Thank you for your contribution nonetheless!

Thank you for letting me know.
I think it's better to add it in udev, too.

Thank you,

---
Best Regards
Kunihiko Hayashi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
