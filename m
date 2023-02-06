Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76719C636D6
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 193434045C;
	Mon,  6 Feb 2023 13:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 193434045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AkOYTskaj5B2; Mon,  6 Feb 2023 13:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E468403B8;
	Mon,  6 Feb 2023 13:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E468403B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49D531BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 306758123F
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 306758123F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wJBShuDfsSq for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:36:07 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFA5780F58
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFA5780F58
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:36:06 +0000 (UTC)
Received: from [192.168.50.169] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id P1YJp8USZUpapP1YJpXJOP; Mon, 06 Feb 2023 14:28:59 +0100
Message-ID: <01702fdc-51b5-dcca-d822-e04d326dbd17@benettiengineering.com>
Date: Mon, 6 Feb 2023 14:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230202154239.325711-1-giulio.benetti@benettiengineering.com>
 <20230202154239.325711-2-giulio.benetti@benettiengineering.com>
 <20230206122130.25893d8a@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230206122130.25893d8a@windsurf>
X-CMAE-Envelope: MS4xfKVztCV1GtVgc17IN20NtEpduNP7ukCUwJwx5lhd8uum/LECs8XC/AxCJPop+m4ntKhsJfLWsXILefOy2VASRC1gNMPq+boUB6Xn2vk9onCY5U/9XWM4
 /PhfEuWCU2Up6g7fhLPl3qkyEFiYEyXIipxq780oh9KPkBOkF5uD2SsTKxZXN07sknqeE/vtljYv1eiGKrtMx3Jf1vh2mr/xWQwpQHewYMpBniTwb3tPxJFl
 ZaNycRUUHQ6Tu5HzPA4cbRsKMDiw++XQrIKndshgnuGqgyOdibCy91baNW4jXiStZlflsZYtL249uH7FLQ679OkXH1F8E0m2sJZzfgJ9+c8HVDuuz2Ik3nuV
 ny8TIqKohV6AcCO5b77DjeQAAfDIxQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675690139; bh=ZzZoX+P2Yhn0CLWge79y1+VMuQRgu5ii/WlThuNzm3s=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=fPxVqV1dl+QQLWnia0NIOMdaSdlnYsbAleRu5IC9zoFL2ISLve98/hoFILZ24Dcr/
 KBzIXMQuAN2Dsx+crQzl06hVZUo2b35/fvByci5TeMbguglwG5e50OcqJDmu2wEFjw
 EftY0cdFnA2bOIp0jubeyamMRhevR+w3Y8b2O5C2gjeEDAR61IF+aiSnZlSFPH5qYW
 6XPFgg1xY7jHxq4XTHFs92ctlRSgPC3hSXgFPCnr3YwglJblKStRJNbmSDeI2yJJkd
 0r1y33QdTgvoSSwg1T0BDwiuTyr3qOoZCrpt4pirlzHRcgMhPGVaEdafoLbreZFT7J
 n2eKFKx8FaGTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=fPxVqV1d
Subject: Re: [Buildroot] [PATCH 2/2] package/postgresql: work around gcc bug
 43744
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 06/02/23 12:21, Thomas Petazzoni via buildroot wrote:
> Hello Giulio,
> 
> On Thu,  2 Feb 2023 16:42:39 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Package postgresql suffers from gcc bug 43744 other than 85180, so let's
>> work around disabling compiler optimization for this gcc bug too.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/cf272cdc5be2faf4070de3d235ec7a0f7190867a
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/postgresql/postgresql.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied to master, thanks. However, you should have resent a v2 of this
> patch together with the v2 of the first patch. Never resend partial
> series, but instead always, always, always, always, always, always,
> always, always, always, always, always, always, always resend a full
> series, even if only one patch changed. Sending partial series is
> extremely confusing for the people reviewing/applying the patches.

You've pointed me this recently too :-/ Sorry!

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
