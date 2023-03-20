Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5FCC6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 11:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C768414C9;
	Mon, 20 Mar 2023 11:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C768414C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8nKAcTY-byC; Mon, 20 Mar 2023 11:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32EB0414C6;
	Mon, 20 Mar 2023 11:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32EB0414C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA2C1BF3FC
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 11:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8DA0414BF
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 11:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8DA0414BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HfJ1nA8MQYGd for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 11:05:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7641410C0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7641410C0
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 11:05:10 +0000 (UTC)
Received: from [172.20.10.9] ([151.82.43.118])
 by Aruba Outgoing Smtp  with ESMTPSA
 id eDK6p5NiTdwECeDK7pytQ7; Mon, 20 Mar 2023 12:05:07 +0100
Message-ID: <434fcfee-ee15-42d7-2bbb-5f9c5ecab33e@benettiengineering.com>
Date: Mon, 20 Mar 2023 12:05:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Peter Seiderer <ps.report@gmx.net>
References: <20230319201701.469279-1-giulio.benetti@benettiengineering.com>
 <20230319215226.456c67d1@gmx.net>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230319215226.456c67d1@gmx.net>
X-CMAE-Envelope: MS4xfC6oxgi638JiU3GX4uz02O02Wx2wAY18QB3jsNf77SOjXSqrwtHRC5SVBvCRqrhHgFSMopRAWC9j3imdrD7v0apfWiEfYlFSMKVvcQ6xpJQ+cqIQN1Me
 vEcKYzV9+mpfOJzBnIu43lTTxYrKHPCS6qLkNUTgrwx6PDcr37XhQqyzFhoBa0rp09Rr2wzxyhnUKBylAdcooFNmnAmoFxDQZ/OlAmOCwDQzsM67ku7t4XZF
 n5e4nX2tRWOms7We8bJqBgLu/VlG6MsykE2sdODBb2j+Sv9h0ILb3q9Tk5NvBAqfp1wPsVeVBOZYxkNxtUb+jufSQuQwOQjslDm4h+EW2yI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679310307; bh=Fnn79tOgt4dl/NKQ/usG+c+mCg2LZsI4p0y1LG6rcJc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=TDigKwqHHzMJ54Jf/Cu4T+VHwZEWQJXxiUhx1KmW1/VgM75UPmnYuAKjJ+zaKDtX8
 /9FQzpsaPTyqkwtHV2u9flFrbEem4gGC2u3rl/KLaY0sY8RhANA6OHvdyI4vJuLsxk
 d8T/xRF3byFNGaKtqTO58S/RyMzljYi2PhY/e+VMGL2aIzjHm9FnLXM3g9cuV7Su7R
 Cf/yrs606kRU1jZwF2Vy74unZGJRDkYUtKeaSrP8WW3p3WhWlJZbyojUMMsOpvHjyU
 uNrTAgaeqWafXFAjrCeIr10Lk5uzZeKApyfJabKIuL1aMwaLG/fqAT+vvgLCotvV9L
 zoX5fPWcxbv2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TDigKwqH
Subject: Re: [Buildroot] [PATCH v2] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/03/23 21:52, Peter Seiderer wrote:
> Hello Giulio,
> 
> On Sun, 19 Mar 2023 21:17:01 +0100, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Let's also switch to a _SITE that can be accessed from a web browser and
>> results to be the official one for mmc-utils.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> * switch _SITE to a browsable one suggested by Peter Seiderer
>> ---
>>   package/mmc-utils/mmc-utils.hash | 4 ++--
>>   package/mmc-utils/mmc-utils.mk   | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
>> index 1256f63487..22d34c3d40 100644
>> --- a/package/mmc-utils/mmc-utils.hash
>> +++ b/package/mmc-utils/mmc-utils.hash
>> @@ -1,3 +1,3 @@
>>   # Locally computed
>> -sha256  f6ed1cb2f02d49df4244f8872b47b22780dd634fa19d857298ce1b793752776f  mmc-utils-dfc3b6ecda84d21418fb4408b39c5c71db4c6458-br1.tar.gz
>> -sha256  f57e3c6169116aa9ff06eec95734ca000e4d0196467bb221e80e50530c768081  mmc.h
>> +sha256  e5a8dacf26a178010202c8fa7cb28b01f50fe967da98cdbdf320b2f110920106  mmc-utils-d4c2910981ff99b983734426dfa99632fb81ac6b-br1.tar.gz
>> +sha256  f0b53b9d58ee24e8bd9bb69bf4b31f8d1d031cf4f5d5078842198bbc6a779ca5  mmc.h
>> diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
>> index 435e6ae7f1..44abf00dbc 100644
>> --- a/package/mmc-utils/mmc-utils.mk
>> +++ b/package/mmc-utils/mmc-utils.mk
>> @@ -4,8 +4,8 @@
>>   #
>>   ################################################################################
>>
>> -MMC_UTILS_VERSION = dfc3b6ecda84d21418fb4408b39c5c71db4c6458
>> -MMC_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
>> +MMC_UTILS_VERSION = d4c2910981ff99b983734426dfa99632fb81ac6b
>> +MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
>>   MMC_UTILS_SITE_METHOD = git
>>   MMC_UTILS_LICENSE = GPL-2.0
>>   MMC_UTILS_LICENSE_FILES = mmc.h
> 
> Thanks for patch update, updating the project URL from package/mmc-utils/Config.in
> would be nice too ;-)

Oops, I've forgotten it. Thanks for pointing, I update and send V3.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
