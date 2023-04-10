Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64090C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 07:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC14E60DC6;
	Mon, 10 Apr 2023 07:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC14E60DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4501E7eDTMYY; Mon, 10 Apr 2023 07:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18FD660B12;
	Mon, 10 Apr 2023 07:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18FD660B12
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B54E81BF291
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 07:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A95640189
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 07:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A95640189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jeEUQxRNwaVN for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 07:46:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7341440125
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7341440125
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 07:46:19 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id C328A5FD19;
 Mon, 10 Apr 2023 10:46:14 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Mon, 10 Apr 2023 10:46:13 +0300 (MSK)
Message-ID: <9c1b4069-3a4f-5b26-7d2a-8977d2fdc9a7@sberdevices.ru>
Date: Mon, 10 Apr 2023 10:46:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Content-Language: ru
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230407141930.694756-1-ovlevin@sberdevices.ru>
 <20230407183113.30ee6a87@windsurf>
In-Reply-To: <20230407183113.30ee6a87@windsurf>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/04/09 20:22:00 #21072633
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1681112774;
 bh=onZC71gNQCbGoyNZV1KqlyCYxzgICv1uYuU1EI0p6hc=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 b=sEYdPbH3LZK2WwwQvTBJh8DFYRm54Nk9jM6pES0xPjMtKn1jIgicfwGoheaV8Dzs7
 syeloicsmcYIzbig5T5H1ZWkQ48jpx7qXKA/YXyOUhKpKjFW4o0wbe6gonniCea539
 fpAhmQuSpU+9/jDR84cp8R4rZxcs32T0mkA2qU2DdpYJwkPcsGT6Jb9tvJ6OSaaOLC
 AxMl7gI7Q3FuABOtBIIDuvMsMr6++9Nv5kHNDQW/Cmg04NH8Gz32VS5B2ldL5l/c3v
 upT2qgOrx+qQGh31bEX9tcHLEF/p4lNQbPiiYY9mc2NVYfLAKM3vROsY9NgG10DFaM
 XfCw7iPrfoJDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=sEYdPbH3
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: use host-make
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
From: Oleg Lyovin via buildroot <buildroot@buildroot.org>
Reply-To: Oleg Lyovin <ovlevin@sberdevices.ru>
Cc: olegartys@gmail.com, sdfw_system_team@sberdevices.ru,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 4/7/23 7:31 PM, Thomas Petazzoni wrote:
> Hello Oleg,
> 
> On Fri, 7 Apr 2023 17:19:29 +0300
> Oleg Lyovin <ovlevin@sberdevices.ru> wrote:
> 
>> GNU make package from the host machine may be too old,
>> so use the one built by buildroot.
>>
>> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
>> ---
>>  package/linux-headers/linux-headers.mk | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> Thanks for the patch. However, could you provide some details on what
> problem this is fixing? Is this due to something new in recent Linux
> kernel releases that require a more recent version of make? If so, we
> need to understand what is the Linux kernel change that causes that,
> and what is the minimum make version that is now needed. Could you look
> up those details?
> 
> Thanks a lot!
> 
> Thomas

Thanks a lot for the review.

Starting from v6.2 Linux kernel checks Make version and requires it to be >= 3.82: https://elixir.bootlin.com/linux/v6.2/source/Makefile#L14

It is quite old version, and we have faced the issue building kernel in our Ubuntu 14.04 based environment which have Make 3.81. However, to avoid such problem in the future it seems more safe to use host-make package and not depend on host version if possible.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
