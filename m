Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65875C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5C21410E6;
	Sun,  6 Aug 2023 17:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5C21410E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Fl6RR-GFcur; Sun,  6 Aug 2023 17:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C10804097F;
	Sun,  6 Aug 2023 17:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C10804097F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11AF71BF286
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEBB760067
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEBB760067
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3oNuO2zdauIJ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 17:46:15 +0000 (UTC)
Received: from smtpcmd14173.aruba.it (smtpcmd14173.aruba.it [62.149.156.173])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E8FF607BC
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 17:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E8FF607BC
Received: from [10.10.6.40] ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ShpSq5w65XI7yShpSqGRNY; Sun, 06 Aug 2023 19:46:10 +0200
Message-ID: <b5138265-42c0-8118-cf5c-52e9ce38c606@benettiengineering.com>
Date: Sun, 6 Aug 2023 19:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230804193801.93049-1-giulio.benetti@benettiengineering.com>
 <20230806140536.0f5dac52@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230806140536.0f5dac52@windsurf>
X-CMAE-Envelope: MS4xfMm3nXttMBSR9eyq1d2o+lBzZpoHbSIww8JFxHn9HV0DS5QjlUydBbZsMJndOZB2eoJBx7EfnbTSwI4xt7CkyZwYJYNv4CZawfnWgjoFgmo16S7ZhJ0i
 tEWINFE9g/ZSsWQ7EJSDb8knJpps9Bwj3ZzLT7rGQfIOGe0Bz6CIzJiDHvNYQ4ipKuw3BMrFhAS9uSkF0Zcm9LGh5+rlkLG+vaZ65020Msc9Z8B0CMlfd+UL
 GB1RQvDn+d3B8TCwPOaelhjQd0OK0dWtbzfnm37aKhY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691343971; bh=lNAPgJrV8wd6+MBe9t30l67MgJdxEXbwN0OfwEDUj1w=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=j1hedP7kp5ON94JN05JyTFzL4tHP5g2xfwYmri2TYnBMYB3F+v/7QnVfpiqdMGKNB
 x/BCJg0Znc1jLkG1ENNpicg0mJos+knZMHEPwmo9Ikb0xazYfTUv7WoyuqrUr4oKPQ
 o7eSQNWsIicSmgWdmEzlYLLK29HUhnATv21D2uXCsfc1ype1+H6GuN1ORaIJR2aXjO
 otWhZXjZoaYOr7x36m9GkYwz1GWJesbg6+QQVW5IaMZWDLeSJ9wl2U8MDl77bH19lr
 H8uo44d5JB2DNj5ahIyEzGPu07CBcDVCz0KtPve9vE8cuqhjetR0hBdgwodKZ6JQ0i
 URUGl63E5HY1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=j1hedP7k
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.1.1
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


On 06/08/23 14:05, Thomas Petazzoni wrote:
> On Fri,  4 Aug 2023 21:38:01 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Release notes: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/harfbuzz/harfbuzz.hash | 2 +-
>>   package/harfbuzz/harfbuzz.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Applied to next, thanks.

I haven't pointed in commit log but this version contains a security
bug-fix, please check this line:
https://github.com/harfbuzz/harfbuzz/blob/main/NEWS#L5

so IMHO it should be applied to main branch.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
