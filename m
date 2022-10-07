Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7247C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 12:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08E8441C0F;
	Fri,  7 Oct 2022 12:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08E8441C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ou1ZqDhT8kdC; Fri,  7 Oct 2022 12:05:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C2341BF2;
	Fri,  7 Oct 2022 12:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C2341BF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CA371BF338
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 12:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15EC941BF2
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 12:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15EC941BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2P1m14nANl1 for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 12:05:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E263041895
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp4.osuosl.org (Postfix) with ESMTP id E263041895
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 12:05:48 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gm6goB5WlSNi8gm6jovW7T; Fri, 07 Oct 2022 14:05:44 +0200
Message-ID: <7dce1c6a-176b-d97a-47b3-cc74a16ad2a6@benettiengineering.com>
Date: Fri, 7 Oct 2022 14:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Wolfgang Grandegger <wg@grandegger.com>, buildroot@buildroot.org
References: <41db705a-2c63-47bc-3f03-d4c52d2a4b14@grandegger.com>
 <e6ddbdfb-7f8b-4eb2-e25d-24fe0c82e981@benettiengineering.com>
 <1d22bd7b-1136-6911-7181-81f2b24c5b00@grandegger.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <1d22bd7b-1136-6911-7181-81f2b24c5b00@grandegger.com>
X-CMAE-Envelope: MS4xfB1EtIO4Ywf1Gv8TDqmSJqkiDn15mu8ubtAXLgoC+kVz9lvb5lpOzBhY9nsn4FEb8kN8H5FamBLBD+8N6/lEl2+pBZ512x1+4AQBS0CIvIyFOUnTIj1c
 pcckIESCyhY/QZ9CRQ06hDHwdpRLU9ygGR7TvosxRCCHXsMhSL9hSQohZMe8SaMr8T+dnWknF6MzLmm7Gt1KB21H80EtbklDEysH/34pLXAUEQy/YAYzF992
 jUx3uMMfIp0MOQDWnN30XONNXeJ38IvNIOwRPbRiYQJhNH7wektOPHTBhDWuVHua
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1665144345; bh=AJXr95Oj8TXbFJ5+QYAKhwVXFJFDAy6PlR8IS61Sn48=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=SfKr+cdUv2qcCBos2P8RxbTtQ2juNzt52ATQFbnlg0aJEZfjub1jAsxrUxbQWJd9X
 bn6xsCPeHTWMD2/RUbdvRkF0EIfzzQcqiG2CGaqHCAiuGO03jfLB2SG/pe+xodhx0X
 38A31D7PhkM/tg4iISuK5hg1Tgp6/++Q/6XjoxWw4AIv87H3qMUSIoZZW7rCLbMiAX
 lzs6sUU60/s8zND1oTyQv6745gXaXArKdxp55wl7ZM7e6RMyoMZjH1eilDPoQETlam
 on28uQnVEFheYDdHRABQPdZcNlHRKXu1+ulqdAM56X16xoZrKTZqfDRWe8sjKHH5Zb
 FfiP2HsqYhW6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SfKr+cdU
Subject: Re: [Buildroot] [PATCH] package/udisks: install to staging
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Wolfgang,

On 07/10/22 09:35, Wolfgang Grandegger wrote:
> Hello Giulio,
> 
> I send trivial patches directly via email. Without "git send-email..." 
> and I also didn't use "buildroot/get-developers". I just sent v2, hope 
> it's fine now!?

Yes, now it looks ok. I ask you please to register to patchwork and set
v1 patch to superseded:
https://patchwork.ozlabs.org/project/buildroot/list/

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>  From my point of few it's a bug... but well, it doesn't really matter.
> 
> Wolfgang
> 
> On 06.10.22 22:14, Giulio Benetti wrote:
>> Hi Wolgang,
>>
>> thanks for contributing!
>>
>> Something to deal with.
>> Before 'git send-email...' do you use buildroot/get-developers script?
>>
>> I ask this because I'm not in Cc but I maintain this package as well as
>> other 2 people.
>>
>> Il 06/10/2022 21:52, Wolfgang Grandegger ha scritto:
>>> UDisks2 provides an Library API [1] for accessing the UDisks2 service 
>>> via
>>> "libudisks2.so". For development of UDisks2 clients, install to staging
>>> as well! This issue has been reported as bug [2] as well.
>>
>> It doesn't make sense that this has been reported as a bug since it's
>> not a bug but an adding. So please remove last sentence.
>>
>>> [1] http://storaged.org/doc/udisks2-api/2.9.4/ref-library.html[1]
>>> [2] https://bugs.busybox.net/show_bug.cgi?id=15026
>>
>> And this line ^^^ too.
>>
>> Best regards

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
