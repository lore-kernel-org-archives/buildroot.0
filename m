Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59CEC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 16:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EB1781E4A;
	Fri, 16 Aug 2024 16:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJMBXv92GksK; Fri, 16 Aug 2024 16:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 450CE81E71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 450CE81E71;
	Fri, 16 Aug 2024 16:16:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21EEA1BF5A7
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 16:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id 0F63481E71
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 16:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id Rmymr7C9aQXI for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 16:16:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=43.163.128.50;
 helo=xmbghk7.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDC8181E4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDC8181E4A
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.50])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id DDC8181E4A
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 16:16:11 +0000 (UTC)
Received: from [192.168.100.247] ([106.120.7.242])
 by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
 id 3F9AE8D3; Sat, 17 Aug 2024 00:15:57 +0800
X-QQ-mid: xmsmtpt1723824957tp1sdlsz6
Message-ID: <tencent_A1F36423924149B55F08484081B33DC77805@qq.com>
X-QQ-XMAILINFO: NwIPvWX4YDag+DgnOdAITKZtNPOmHZKWfV9cetc6qShc2f1I3ZnPINQnGuKY4R
 GUh8vcu9qXBE5iZ4PSEfsBTD0d4udEtHpOjJnu6VBu1ybbHOMNu26oXKHmE4A1kfWn31f4p64J3P
 rZ3FGelFl1MjntcbXAlZLyvzV+1hOptHo2vw59tD1/xMoHrDL7n1ONQo9nQm0K+ma1ETIRLh9Aya
 IgGGBmt7YMiaSq/JbTPtN884GEQi1IvpDzIpQq98kJXajJCwAW5oCLZ/f8sO5L/krNIgGkfI3Uhz
 FpHTCF5JaCoDC+sRw5mXet2S+Y0hLffQf9MfaEHPk9cTDzt6+uga0gPl7tSWmwE76K90hksfYlY7
 ymfwNIbAvSJG2WV/cK7aG+/8Lk38PdaqnzJK2GE3PBG5E8BCbr9wq7dLku5SETQ7a4rmoSFvXJ76
 toroc6RCmJOeU+gMeuYJwwWSUBbqu3BTE6AEk7fBdimOEo9WwwKYjCemzzDdnWv4ek/WIJiWEXgn
 Zq3piLFJlJFupKaBVhByfJ4VpVCTx5cDq/dyZiAryUQPsQSKzabhuWnnDJVjOz+5bFWldc/HhoRg
 sVAqRMr6LHSN5GJKQ6/HUpIWoqxRUG9ngVE0a2eDGgOCnqlVaAYe7M9V+eJWNOyrMhNcqBPyESo6
 lhvrGxvHr8WMw68ElQ/BGomXXw5oWnJHEa5zaGXduE+Pd7J32ZAQDn7GvMqOKxDLIR8kvyjsmDju
 EX3m+/mxgXKXdrJgEdZ/b3HE7ppUdS6ai6+JhhCaCok7U5iYpnwDX2GgfaWvixXtIsen9hAA0yXL
 pOKbcML/P6TJLNRkApeQ99IZ2bhjUF41+hEGybsHq+OZnwUiNs9YiZJQEbh5l94rCop5rvSlryOq
 RnCp2GCDlR+mngedhpQ1WKkoZCaEsRpTi/B+5e5ZxqOH/4/xBbwSsy8tUpWD8qIya3HXena/pSbx
 fdfPh51nT57dA/03n8LdRI2eq+/+xn2yLfahII9lNzl1MnbF7PvfV1TuE3OigxYa5IR2utt/NzP0
 GASJnPiLTYkthRb4woiliQ4vOpMhY=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-OQ-MSGID: <9a3837f6-ae04-4ec8-96da-8b4e0206ff52@foxmail.com>
Date: Sat, 17 Aug 2024 00:15:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <tencent_C2D6061483906AA710B3001B277F4EE62606@qq.com>
 <20240815215040.0908cb47@windsurf> <Zr5eZO21C1avtmSz@landeda>
Content-Language: en-US
From: Dong Wang <wangdong115@foxmail.com>
In-Reply-To: <Zr5eZO21C1avtmSz@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1723824959;
 bh=dqy2Gj00BWDuFxxWK8ZQxNSz8PogB1JIv3qrNgOMugA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RYojMxH5XABLK6h+rl/WAvbo1TKg5BL32QzHkkUggWe1io0XlnJ/iiqxYbcOG81sC
 vgWorGlbuPm/x+mjyB3HxPpdAH6DxKCAzQXf7Ka0+4H74bq1Ltt0sPGMZXZPkC3Geb
 VTP3PTDbNQkE5K5tcpGDPFVxy07OTHvOGzkz18vk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=RYojMxH5
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On 2024/8/16 04:00, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2024-08-15 21:50 +0200, Thomas Petazzoni via buildroot spake thusly:
>> On Fri, 16 Aug 2024 01:28:26 +0800
>> Dong Wang <wangdong115@foxmail.com> wrote:
>>> This patch fixes the wrongly calculated uboot partition size in
>>> genimage.cfg. The size should be 1016K, which is
>>> 1MB (typical partition start) - 8K(offset dictated by the bootrom).
> [--SNIP--]
>>> -		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
>>> +		size = 1016K # 1MB - 8KB(offset)
>> Actually, does this size argument really make sense? This space will
>> automatically take the size of the "u-boot-sunxi-with-spl.bin" file I
>> believe. Or is it needed to make sure that the next partition doesn't
>> start before 1 MB?
>>
>> Why is it important that the size is 1MB - 8KB, and not 1MB or 2MB ?
> 
> The above has two effects:
>    - ensure the uboot image is not bigger than the allocated space,
>    - the filesystem image (rootfs) is aligned to a 1MiB boundary.
> 
> The latter could be achieved by setting offset=1MiB (or 2MiB or
> whatever). I'm not sure how genimage would handle the case where the
> uboot image would be too big that the offset of the next partition could
> not be honored...

 From the doc of the genimage project, yes, sanity checks are done so 
that no partitions overlap.

https://github.com/pengutronix/genimage/blob/v18/README.rst#the-image-section

"The partition must not overlap any other partition, or the areas 
occupied by the partition table."

I also verified this behavior by changing the offset to a smaller one 
(rootfs offset=128K < uboot image size ~500K). genimage.sh would fail 
with the log:

ERROR: hdimage(sdcard.img): partition rootfs (offset 0x20000, size 
0x3c00000) overlaps previous partition u-boot (offset 0x2000, size 0x7cca8)

Maybe I can send another patch to use offset=1M for rootfs?

> 
> Regards,
> Yann E. MORIN.
> 

Thanks,
Dong

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
